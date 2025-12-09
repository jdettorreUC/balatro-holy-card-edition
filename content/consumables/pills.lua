SMODS.Atlas{
    key = 'HCE_pills',
    path = 'HCE_pills.png',
    px = 71,
    py = 95
}

--48 Hour Energy

--I Can See Forever!

--Infested?

SMODS.Consumable {
    key = 'infested_pill_question',
    set = 'Pills',
    atlas = 'HCE_pills',
    unlocked = true,
    discovered = true,
    cost = 3,
    pos = {x = 2, y = 0},

    config = { mod_conv = 'm_hce_infested', extra = {odds = 3} },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_hce_infested
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'hce_infested_pill_question')
        return { vars = { numerator, denominator } }
    end,

    can_use = function(self, card)
        if G.hand.cards then
            return (#G.hand.cards > 0)
        end
    end,

    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.cards do
            local percent = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.cards[i]:flip()
                    play_sound('card1', percent)
                    G.hand.cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.2)
        for i = 1, #G.hand.cards do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    if SMODS.pseudorandom_probability(card, 'hce_infested_pill_question', 1, card.ability.extra.odds) then
                        G.hand.cards[i]:set_ability(card.ability.mod_conv)
                    end
                    return true
                end
            }))
        end
        for i = 1, #G.hand.cards do
            local percent = 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.cards[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.5)
    end,
}

--Infested!

SMODS.Consumable {
    key = 'infested_pill_exclamation',
    set = 'Pills',
    atlas = 'HCE_pills',
    unlocked = true,
    discovered = true,
    cost = 3,
    pos = {x = 3, y = 0},

    config = { mod_conv = 'm_hce_infested', extra = {conversions = 2}},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_hce_infested
        return {vars = { card.ability.extra.conversions } }
    end,

    can_use = function(self, card)
        if G.hand.cards then
            return (#G.hand.cards > 0)
        end
    end,

    use = function(self, card, area, copier)
        local unenhanced_cards = {}
        for _, v in pairs(G.hand.cards) do
            if not next(SMODS.get_enhancements(v)) then
                unenhanced_cards[#unenhanced_cards+1] = v
            end
        end

        if #unenhanced_cards == 0 then
            return {
                message = localize('k_nope_ex')
            }
        end

        while #unenhanced_cards > card.ability.extra.conversions do
            local _, k = pseudorandom_element(unenhanced_cards, 'hce_infested_pill_exclamation')
            table.remove(unenhanced_cards, k)
        end

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #unenhanced_cards do
            local percent = 1.15 - (i - 0.999) / (#unenhanced_cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    unenhanced_cards[i]:flip()
                    play_sound('card1', percent)
                    unenhanced_cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.2)
        for i = 1, #unenhanced_cards do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    unenhanced_cards[i]:set_ability(card.ability.mod_conv)
                    return true
                end
            }))
        end
        for i = 1, #unenhanced_cards do
            local percent = 0.85 + (i - 0.999) / (#unenhanced_cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    unenhanced_cards[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    unenhanced_cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.5)
    end
}

--Amnesia

--Paralysis

--Bombs Are Key

SMODS.Consumable {
    key = 'bombs_are_key',
    set = 'Pills',
    atlas = 'HCE_pills',
    unlocked = true,
    discovered = true,
    cost = 3,
    pos = {x = 6, y = 0},

    can_use = function(self, card)
        if G.hand.cards then
            return (#G.hand.cards > 0)
        end
    end,

    use = function(self, card, area, copier)
        local suit_swaps = {
            ["Hearts"] = "Diamonds",
            ["Spades"] = "Clubs"
        }

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.cards do
            local percent = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.cards[i]:flip()
                    play_sound('card1', percent)
                    G.hand.cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.2)
        for i = 1, #G.hand.cards do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    for k, v in pairs(suit_swaps) do
                        if G.hand.cards[i]:is_suit(k) then
                            SMODS.change_base(G.hand.cards[i], v)
                            break
                        elseif G.hand.cards[i]:is_suit(v) then
                            SMODS.change_base(G.hand.cards[i], k)
                            break
                        end
                    end
                    return true
                end
            }))
        end
        for i = 1, #G.hand.cards do
            local percent = 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.cards[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.5)
    end,
}

--Telepills

--Re-Lax

SMODS.Consumable {
    key = 're_lax',
    set = 'Pills',
    atlas = 'HCE_pills',
    unlocked = true,
    discovered = true,
    cost = 3,
    pos = {x = 0, y = 1},

    config = { mod_conv = 'm_hce_soiled', extra = {conversions = 2} },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_hce_soiled
        return {vars = { card.ability.extra.conversions } }
    end,

    can_use = function(self, card)
        if G.hand.cards then
            return (#G.hand.cards > 0)
        end
    end,

    use = function(self, card, area, copier)
        local unenhanced_cards = {}
        for _, v in pairs(G.hand.cards) do
            if not next(SMODS.get_enhancements(v)) then
                unenhanced_cards[#unenhanced_cards+1] = v
            end
        end

        if #unenhanced_cards == 0 then
            return {
                message = localize('k_nope_ex')
            }
        end

        while #unenhanced_cards > card.ability.extra.conversions do
            local _, k = pseudorandom_element(unenhanced_cards, 'hce_re_lax')
            table.remove(unenhanced_cards, k)
        end

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #unenhanced_cards do
            local percent = 1.15 - (i - 0.999) / (#unenhanced_cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    unenhanced_cards[i]:flip()
                    play_sound('card1', percent)
                    unenhanced_cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.2)
        for i = 1, #unenhanced_cards do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    unenhanced_cards[i]:set_ability(card.ability.mod_conv)
                    return true
                end
            }))
        end
        for i = 1, #unenhanced_cards do
            local percent = 0.85 + (i - 0.999) / (#unenhanced_cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    unenhanced_cards[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    unenhanced_cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.5)
    end
}

--X-Lax

SMODS.Consumable {
    key = 'x_lax',
    set = 'Pills',
    atlas = 'HCE_pills',
    unlocked = true,
    discovered = true,
    cost = 3,
    pos = {x = 1, y = 1},

    config = { mod_conv = 'm_hce_soiled', extra = {odds = 3} },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_hce_soiled
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'hce_x_lax')
        return { vars = { numerator, denominator } }
    end,

    can_use = function(self, card)
        if G.hand.cards then
            return (#G.hand.cards > 0)
        end
    end,

    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.cards do
            local percent = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.cards[i]:flip()
                    play_sound('card1', percent)
                    G.hand.cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.2)
        for i = 1, #G.hand.cards do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    if SMODS.pseudorandom_probability(card, 'hce_x_lax', 1, card.ability.extra.odds) then
                        G.hand.cards[i]:set_ability(card.ability.mod_conv)
                    end
                    return true
                end
            }))
        end
        for i = 1, #G.hand.cards do
            local percent = 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.cards[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.5)
    end,
}

--Feels Like I'm Walking on Sunshine!

--I'm Drowsy...

--I'm Excited!!!

--Balls of Steel

--One Makes You Larger

SMODS.Consumable {
    key = 'one_makes_you_larger',
    set = 'Pills',
    atlas = 'HCE_pills',
    unlocked = true,
    discovered = true,
    cost = 3,
    pos = {x = 6, y = 1},

    can_use = function(self, card)
        if G.hand.cards then
            return (#G.hand.cards > 0)
        end
    end,

    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.cards do
            local percent = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.cards[i]:flip()
                    play_sound('card1', percent)
                    G.hand.cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.2)
        for i = 1, #G.hand.cards do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    assert(SMODS.modify_rank(G.hand.cards[i], 1))
                    return true
                end
            }))
        end
        for i = 1, #G.hand.cards do
            local percent = 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.cards[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.5)
    end,
}

--One Makes You Small

SMODS.Consumable {
    key = 'one_makes_you_small',
    set = 'Pills',
    atlas = 'HCE_pills',
    unlocked = true,
    discovered = true,
    cost = 3,
    pos = {x = 7, y = 1},

    can_use = function(self, card)
        if G.hand.cards then
            return (#G.hand.cards > 0)
        end
    end,

    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.cards do
            local percent = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.cards[i]:flip()
                    play_sound('card1', percent)
                    G.hand.cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.2)
        for i = 1, #G.hand.cards do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    assert(SMODS.modify_rank(G.hand.cards[i], -1))
                    return true
                end
            }))
        end
        for i = 1, #G.hand.cards do
            local percent = 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.cards[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.5)
    end,
}

--Gulp!

--Vurp!

--R U a Wizard?

--Power Pill!

--Experimental Pill

SMODS.Consumable {
    key = 'experimental_pill',
    set = 'Pills',
    atlas = 'HCE_pills',
    unlocked = true,
    discovered = true,
    cost = 3,
    pos = {x = 4, y = 2},

    config = {extra = {level_mod = 1, secret_odds = 2}},

    can_use = function(self, card)
        if G.GAME.hands then
           return true 
        end
    end,

    use = function(self, card, area, copier)
        if next(SMODS.find_card("j_hce_lucky_foot")) then
            --lucky foot secretly decreases the odds of getting a hand's level lowered
            card.ability.extra.secret_odds = card.ability.extra.secret_odds + 1
        end

        for k, _ in pairs(G.GAME.hands) do
            if G.GAME.hands[k].visible then
                if SMODS.pseudorandom_probability(card, 'hce_experimental_pill', 1, card.ability.extra.secret_odds) then
                    if G.GAME.hands[k].level > 1 then
                        SMODS.smart_level_up_hand(card, k, nil, (0 - card.ability.extra.level_mod))
                    end
                else
                    SMODS.smart_level_up_hand(card, k, nil, card.ability.extra.level_mod)
                end
            end
        end
    end 
}

--I Found Pills

SMODS.Consumable {
    key = 'i_found_pills',
    set = 'Pills',
    atlas = 'HCE_pills',
    unlocked = true,
    discovered = true,
    cost = 3,
    pos = {x = 5, y = 2},
}

--Puberty