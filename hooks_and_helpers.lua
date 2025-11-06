
local init_game_object_ref = Game.init_game_object

function Game:init_game_object()
  local ret = init_game_object_ref(self)

  --Last removed card for Reverse Justice
    ret.hce_last_removed_card = {
        rank = nil,
        suit = nil,
        enhancement = nil,
        set = nil,
        edition = nil,
        seal = nil
    }

    --Last used tarot for Reverse Fool
    ret.hce_last_tarot = nil

    --Flag for if reverse emperor was used (so investment tags obtained through skips can still be used and you can't use another rev emperor until at least one blind is defeated)
    ret.hce_reverse_emperor_used = false
  return ret

end


local calculate_context_ref = SMODS.calculate_context

function SMODS.calculate_context(context, return_table)
    local ret = calculate_context_ref(context, return_table)

    --G.GAME.hce_last_removed_card
    if G.STAGE == G.STAGES.RUN and context.remove_playing_cards and not context.selling_card then
        if context.removed then
            local last_removed_card = context.removed[#context.removed]
            G.GAME.hce_last_removed_card.rank = last_removed_card.base.value
            G.GAME.hce_last_removed_card.suit = last_removed_card.base.suit
            G.GAME.hce_last_removed_card.enhancement = next(SMODS.get_enhancements(last_removed_card))
            if G.GAME.hce_last_removed_card.enhancement then
                G.GAME.hce_last_removed_card.set = "Enhanced"
            else
                G.GAME.hce_last_removed_card.set = "Base"
            end
            G.GAME.hce_last_removed_card.edition = last_removed_card.edition
            G.GAME.hce_last_removed_card.seal = last_removed_card.seal
        end
    end

    --G.GAME.hce_last_tarot
    if G.STAGE == G.STAGES.RUN and context.using_consumeable then
        if context.consumeable then
            if context.consumeable.config.center.set == 'Tarot' then
                G.GAME.hce_last_tarot = context.consumeable.config.center_key
            end
        end
    end

    if G.STAGE == G.STAGES.RUN and context.setting_blind and G.GAME.hce_reverse_emperor_used then
        G.GAME.hce_reverse_emperor_used = false
    end

    return ret

end

--use button on activated jokers
local G_UIDEF_use_and_sell_buttons_ref = G.UIDEF.use_and_sell_buttons

function G.UIDEF.use_and_sell_buttons(card)
    local ret = G_UIDEF_use_and_sell_buttons_ref(card)  
    if card.area and card.area == G.jokers and card.ability.extra and card.ability.extra.activated then --add bool to jokers if they are activated or not
        local use = {
            n = G.UIT.C,
            config = { align = "cr" },
            nodes = {
                {
                    n = G.UIT.C,
                    config = {
                        ref_table = card,
                        align = "cr",
                        minw = 1.25,
                        minh = 1,
                        padding = 0.1,
                        r = 0.08,
                        hover = true,
                        shadow = true,
                        colour = G.C.UI.BACKGROUND_INACTIVE,
                        one_press = false,
                        button = 'use_joker', --activates the function below
                        func = "can_use_joker", --a bool attribute of the extra ability table
                    },
                    nodes = {
                        { n = G.UIT.B, config = { w = 0.1, h = 0.3 } },
                        {
                            n = G.UIT.T,
                            config = {
                                text = localize('b_use'),
                                colour = G.C.UI.TEXT_LIGHT,
                                scale = 0.55,
                                shadow = true,
                            },
                        }
                    },
                }
            },
        }
        local n = ret.nodes[1]
        if not card.added_to_deck then
            use.nodes[1].nodes = { use.nodes[1].nodes[2] }
        end
        n.nodes = n.nodes or {}
        table.insert(n.nodes, {
            n = G.UIT.R,
            config = { align = "cl" },
            nodes = { use, }
        })
    end
    return ret
end

--toggles the button depending on if you can use the joker or not
  G.FUNCS.can_use_joker = function(e)
    if e.config.ref_table.ability.extra.can_use then
        e.config.colour = G.C.RED
        e.config.button = 'use_joker'
    else
      e.config.colour = G.C.UI.BACKGROUND_INACTIVE
      e.config.button = nil
    end
  end

-- if context.hce_using_joker then
-- {
-- 	cardarea = G.jokers,
-- 	hce_using_joker = true,
-- 	hce_joker_used = card,
-- 	area = G.jokers,
-- }

--new context for when the use button is pressed on an activated joker, shown above
G.FUNCS.use_joker = function(e)
    local card = e.config.ref_table
    --print(card)
    SMODS.calculate_context({hce_using_joker = true, hce_joker_used = card, area = card.from_area})
    return true
end
