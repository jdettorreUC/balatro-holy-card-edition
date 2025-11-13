--Page 1 Jokers Atlas
SMODS.Atlas{
    key = 'HCE_Jokers',
    path = 'HCE_jokers.png',
    px = 71,
    py = 95
}

--ID 001 (Sad Onion)

SMODS.Joker{

    key = 'sad_onion',
    atlas = 'HCE_Jokers',
    pos = {x= 0, y = 0},


    rarity = 2,
    cost = 4,
    unlocked = true,
    blueprint_compat = true,


    config = {extra = { chips = 50 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,

    calculate = function(self, card, context)  
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}

--ID 002 (The Inner Eye)

SMODS.Joker{

    key = 'the_inner_eye',
    atlas = 'HCE_Jokers',
    pos = {x= 1, y = 0},


    rarity = 2,
    cost = 4,
    unlocked = true,
    blueprint_compat = true,


    config = {extra = { mult = 0 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,

    calculate = function(self, card, context)
        if context.before and context.scoring_hand and context.scoring_name == "Three of a Kind" then
            card.ability.extra.mult = card.ability.extra.mult + 6
            return {
                message = 'Upgrade!',
                sound = 'hce_thumbs_up'
            }
        end

        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

--ID 003 (Spoon Bender)

--ID 004 (Cricket's Head)

--ID 005 (My Reflection)

SMODS.Joker {
    key = 'my_reflection',
    atlas = 'HCE_Jokers',
    pos = {x = 4, y = 0},

    rarity = 2,
    cost = 4,
    unlocked = true,
    blueprint_compat = true,

    config = {extra = { xmult = 3 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            if #context.scoring_hand == 1 then
                return {xmult = card.ability.extra.xmult}
            elseif #context.scoring_hand == 2 then
                if context.scoring_hand[1]:get_id() == context.scoring_hand[2]:get_id() then
                    return {xmult = card.ability.extra.xmult}
                end
            elseif #context.scoring_hand == 3 then
                if context.scoring_hand[1]:get_id() == context.scoring_hand[3]:get_id() then
                    return {xmult = card.ability.extra.xmult}
                end
            elseif #context.scoring_hand == 4 then
                if context.scoring_hand[1]:get_id() == context.scoring_hand[4]:get_id() and context.scoring_hand[2]:get_id() == context.scoring_hand[3]:get_id() then
                    return {xmult = card.ability.extra.xmult}
                end
            else
                if context.scoring_hand[1]:get_id() == context.scoring_hand[5]:get_id() and context.scoring_hand[2]:get_id() == context.scoring_hand[4]:get_id() then
                    return {xmult = card.ability.extra.xmult}
                end
            end
        end
    end
    
}


--ID 006 (Number One)

--ID 007 (Blood of the Martyr)

--ID 008 (Brother Bobby)

SMODS.Joker{

    key = 'brother_bobby',
    atlas = 'HCE_Jokers',
    pos = {x= 7, y = 0},


    rarity = 1,
    cost = 4,
    unlocked = true,
    blueprint_compat = true,


    config = {extra = { chips = 2 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips} }
    end,

    calculate = function(self, card, context)  
        if context.individual and context.cardarea == G.play then
            return {
                chips = card.ability.extra.chips * G.GAME.current_round.hands_left,
                card = card
            }
        end
    end
}

--ID 009 (Skatole)

--ID 010 (Halo of Flies)

--ID 011 (1up!)

--ID 012 (Magic Mushroom)

--ID 013 (The Virus)

--ID 014 (Roid Rage)

--ID 015 (<3)

--ID 016 (Raw Liver)

--ID 017 (Skeleton Key)

--ID 018 (A Dollar)

--ID 019 (Boom!)

SMODS.Joker{

    key = 'boom',
    atlas = 'HCE_Jokers',
    pos = {x= 18, y = 0},


    rarity = 1,
    cost = 4,
    unlocked = true,
    blueprint_compat = true,


    config = {extra = { bombs_added = 10 } },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_hce_explosive
        return { vars = { card.ability.extra.bombs_added } }
    end,

    add_to_deck = function(self, card, from_debuff)
        local eval = function(card) return not card.REMOVED end
        juice_card_until(card, eval, true)
    end,

    calculate = function(self, card, context)
        if context.first_hand_drawn then
            for i = 1, card.ability.extra.bombs_added do
                local rand_edition = poll_edition("hce_boom", 2, true)
                local rand_seal = SMODS.poll_seal("hce_boom", 10)
                local new_card = SMODS.add_card {
                    set = "Playing Card",
                    edition = rand_edition,
                    seal = rand_seal,
                    enhancement = 'm_hce_explosive'
                }
                new_card:add_to_deck()
                G.deck.config.card_limit = G.deck.config.card_limit + 1
            end

            SMODS.destroy_cards(card, nil, nil, true)
            return {
                message = 'BOOM!',
                sound = 'hce_explosion'
            }
        end
    end
}


--ID 020 (Transcendence)

SMODS.Joker{

    key = 'transcendence',
    atlas = 'HCE_Jokers',
    pos = {x = 19, y = 0},


    rarity = 2,
    cost = 4,
    unlocked = true,
    blueprint_compat = true,

    config = {extra = {discard_flag = false}},

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.c_hanged_man
        return { vars = { card.ability.extra.discard_flag } }
    end,

    calculate = function(self, card, context)
        --this is extremely scuffed, but honestly i spent way too much time on a joker with a simple effect and i wanna move on
        if context.discard then
            card.ability.extra.discard_flag = true
        end

        if context.setting_blind then
            card.ability.extra.discard_flag = false
        end

        if context.end_of_round and context.cardarea == G.jokers and G.consumeables.config.card_limit - #G.consumeables.cards > 0 and not card.ability.extra.discard_flag then
            SMODS.add_card{ key = "c_hanged_man" }
        end
    end
}


--ID 021 (The Compass)

--ID 022 (Lunch)

--ID 023 (Dinner)

--ID 024 (Dessert)

--ID 025 (Breakfast)

--ID 026 (Rotten Meat)

--ID 027 (Wooden Spoon)

--ID 028 (The Belt)

--ID 029 (Mom's Underwear)

--ID 030 (Mom's Heels)

--ID 031 (Mom's Lipstick)

--ID 032 (Wire Coat Hanger)

--ID 033 (The Bible)

--ID 034 (The Book of Belial)

SMODS.Joker{

    key = 'the_book_of_belial',
    atlas = 'HCE_Jokers',
    pos = {x= 13, y = 1},


    rarity = 2,
    cost = 4,
    unlocked = true,
    blueprint_compat = false,

    config = {extra = { activated = true, can_use = false, xmult = 1, xmult_mod = 2} },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.activated, card.ability.extra.can_use, card.ability.extra.xmult, card.ability.extra.xmult_mod, colours = {G.C.RED, G.C.FILTER}}}
    end,

    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.can_use = true
        local eval = function(card) return card.ability.extra.can_use end
        juice_card_until(card, eval, true)
    end,

    calculate = function(self, card, context)
        if context.hce_using_joker and context.hce_joker_used == card then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod
            card.ability.extra.can_use = false
            return {
                message = "Upgrade!",
                sound = "hce_woosh"
            }
        end

        if context.end_of_round and context.cardarea == G.jokers then
            if not card.ability.extra.can_use then
                card.ability.extra.can_use = true
                local eval = function(card) return card.ability.extra.can_use end
                juice_card_until(card, eval, true)
                return {
                    message = "Charged!",
                    sound = "hce_charge"
                }
            end
        end

        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end

        if context.after and context.cardarea == G.jokers and card.ability.extra.xmult > 1 then
            card.ability.extra.xmult = 1
            return {
                message = "Reset",
            }
        end
    end
}

--ID 035 (The Necronomicon)

--ID 036 (The Poop)

SMODS.Joker{

    key = 'the_poop',
    atlas = 'HCE_Jokers',
    pos = {x= 15, y = 1},


    rarity = 1,
    cost = 4,
    unlocked = true,
    blueprint_compat = false,

    config = {extra = { activated = true, can_use = false} },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_hce_soiled
        return { vars = { card.ability.extra.activated, card.ability.extra.can_use, colours = {G.C.RED, G.C.FILTER}}}
    end,

    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.can_use = true
        local eval = function(card) return card.ability.extra.can_use end
        juice_card_until(card, eval, true)
    end,

    calculate = function(self, card, context)
        if context.hce_using_joker and context.hce_joker_used == card then
            if #G.hand.cards < 1 then
                return {
                    message = localize('k_nope_ex'),
                    sound = "hce_buzzer"
                }
            else
                local rand_edition = poll_edition("hce_the_poop", 2, true)
                local rand_seal = SMODS.poll_seal("hce_the_poop", 10)
                local new_card = SMODS.add_card {
                    set = "Playing Card",
                    edition = rand_edition,
                    seal = rand_seal,
                    enhancement = 'm_hce_soiled'
                }
                new_card:add_to_deck()
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                play_sound('hce_fart')

                card.ability.extra.can_use = false
            end
        end

        if context.end_of_round and context.cardarea == G.jokers then
            if not card.ability.extra.can_use then
                card.ability.extra.can_use = true
                local eval = function(card) return card.ability.extra.can_use end
                juice_card_until(card, eval, true)
                return {
                    message = "Charged!",
                    sound = "hce_charge"
                }
            end
        end
    end
}

--ID 037 (Mr. Boom)

--ID 038 (Tammy's Head)

--ID 039 (Mom's Bra)

--ID 040 (Kamikaze!)

--ID 041 (Mom's Pad)

--ID 042 (Bob's Rotten Head)

--ID 043 DNE

--ID 044 (Teleport!)

--ID 045 (Yum Heart)

--ID 046 (Lucky Foot)

--ID 047 (Doctor's Remote)

--ID 048 (Cupid's Arrow)

--ID 049 (Shoop Da Whoop!)

--ID 050 (Steven)

--ID 051 (Pentagram)

--ID 052 (Dr. Fetus)

--ID 053 (Magneto)

--ID 054 (Treasure Map)

--ID 055 (Mom's Eye)

--ID 056 (Lemon Mishap)

--ID 057 (Distant Admiration)

--ID 058 (Book of Shadows)

--ID 059 DNE

--ID 060 (The Ladder)

--ID 061 DNE

--ID 062 (Mark of the Vampire)

--ID 063 (The Battery)

--ID 064 (Steam Sale)

--ID 065 (Anarchist Cookbook)

--ID 066 (The Hourglass)

--ID 067 (Sister Maggy)

SMODS.Joker{

    key = 'sister_maggy',
    atlas = 'HCE_Jokers',
    pos = {x= 3, y = 3},


    rarity = 1,
    cost = 4,
    unlocked = true,
    blueprint_compat = true,


    config = {extra = { chips = 2 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips} }
    end,

    calculate = function(self, card, context)  
        if context.individual and context.cardarea == G.play then
            return {
                chips = card.ability.extra.chips * G.GAME.current_round.discards_left,
                card = card
            }
        end
    end
}

--ID 068 (Technology)

--ID 069 (Chocolate Milk)

--ID 070 (Growth Hormones)

--ID 071 (Mini Mush)

--ID 072 (Rosary)

--ID 073 (Cube of Meat)

--ID 074 (A Quarter)

--ID 075 (PHD)

--ID 076 (X-Ray Vision)

--ID 077 (My Little Unicorn)

--ID 078 (Book of Revelations)

--ID 079 (The Mark)

SMODS.Joker {
    key = 'the_mark',
    atlas = 'HCE_Jokers',
    pos = {x = 15, y = 3},

    rarity = 2,
    cost = 4,
    unlocked = true,
    blueprint_compat = true,

    config = {extra = { chips = 66, mult = 6} },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.mult } }
    end,

    calculate = function(self, card, context)  
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 6 then
            return {
                mult = card.ability.extra.mult,
                chips = card.ability.extra.chips,
                card = card
            }
        end
    end
}

--ID 080 (The Pact)

--ID 081 (Dead Cat)

--ID 082 (Lord of the Pit)

--ID 083 (The Nail)

--ID 084 (We Need to go Deeper!)

-- SMODS.Joker {
--     key = 'we_need_to_go_deeper',
--     atlas = 'HCE_Jokers',
--     pos = {x = 0, y = 4},

--     rarity = 1,
--     cost = 4,
--     unlocked = true,
--     blueprint_compat = true,

--     config = {extra = { chips = 0} },

--     loc_vars = function(self, info_queue, card)
--         return { vars = { card.ability.extra.chips, card.ability.extra.mult } }
--     end,

--     loc_txt = {
--         name = 'We Need To Go Deeper!',
--         text = {
--             [1] = 'Played {C:attention}Spades{} score {C:chips}+10{} Chips',
--             [2] = 'per {C:attention}Spade{} scored this round',
--             [3] = '{C:inactive}(Currently{} {C:chips}+#1#{} {C:inactive}Chips)'
--         }
--     },

--         calculate = function(self, card, context)

--             if context.individual and context.cardarea == G.play and context.other_card:is_suit("Spades") then
--                 card.ability.extra.chips = card.ability.extra.chips + 10
--                 return {
--                     chips = card.ability.extra.chips,
--                     card = card
--                 }
--             end

--             if context.end_of_round and not context.individual then
--                 card.ability.extra.chips = 0
--                 return {
--                     message = "Reset",
--                 }
--             end
--         end
-- }

--ID 085 (Deck of Cards)

--ID 086 (Monstro's Tooth)

--ID 087 (Loki's Horns)

--ID 088 (Little Chubby)

--ID 089 (Spider Bite)

--ID 090 (The Small Rock)

SMODS.Joker {
    key = 'the_small_rock',
    atlas = 'HCE_Jokers',
    pos = {x = 6, y = 4},

    rarity = 2,
    cost = 4,
    unlocked = true,
    blueprint_compat = true,
    --enhancement_gate = 'm_stone',

    config = {extra = {mult = 4 } },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_stone
        return {vars = { card.ability.extra.mult }}
    end,

    calculate = function(self, card, context)  
        if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, 'm_stone') then
            return {
                mult = card.ability.extra.mult,
                card = card
            }
        end
    end
}

--ID 091 (Spelunker Hat)

SMODS.Joker {
    key = 'spelunker_hat',
    atlas = 'HCE_Jokers',
    pos = {x = 7, y = 4},

    rarity = 2,
    cost = 4,
    unlocked = true,
    blueprint_compat = true,

    config = {extra = { money = 3 } },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_stone
        return { vars = { card.ability.extra.money } }
    end,

    calculate = function(self, card, context)  
        if context.cardarea == G.hand and context.end_of_round and context.individual and SMODS.has_enhancement(context.other_card, 'm_stone') then
            --MUST use "dollars" not "money"
            return {
                dollars = card.ability.extra.money,
                card = card
            }
        end
    end
}

--ID 092 (Super Bandage)

--ID 093 (The Gamekid)

--ID 094 (Sack of Pennies)

SMODS.Joker{

    key = 'sack_of_pennies',
    atlas = 'HCE_Jokers',
    pos = {x= 10, y = 4},


    rarity = 1,
    cost = 4,
    unlocked = true,
    blueprint_compat = true,


    config = {extra = { dollars = 1, nickel_odds = 3, dime_odds = 8} },

    loc_vars = function(self, info_queue, card)
        local n_numerator, n_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.nickel_odds, 'hce_sack_of_pennies')
        local d_numerator, d_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.dime_odds, 'hce_sack_of_pennies')
        return { vars = { card.ability.extra.dollars, n_numerator, n_denominator, d_numerator, d_denominator} }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval then
            if SMODS.pseudorandom_probability(card, 'hce_sack_of_pennies', 1, card.ability.extra.dime_odds) then
                card.ability.extra.dollars = 10
                return {
                    message = 'Dime!',
                    colour = G.C.MONEY,
                    sound = 'hce_dime'
                }
            elseif SMODS.pseudorandom_probability(card, 'hce_sack_of_pennies', 1, card.ability.extra.nickel_odds) then
                card.ability.extra.dollars = 5
                return {
                    message = 'Nickel!',
                    colour = G.C.MONEY,
                    sound = 'hce_nickel'
                }
            else
                card.ability.extra.dollars = 1
            end
        end
    end,

    calc_dollar_bonus = function(self, card)
        return card.ability.extra.dollars
    end
}

--ID 095 (Robo-Baby)

SMODS.Joker{

    key = 'robo_baby',
    atlas = 'HCE_Jokers',
    pos = {x= 11, y = 4},


    rarity = 1,
    cost = 4,
    unlocked = true,
    blueprint_compat = true,


    config = {extra = { chips = 2 } },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_steel

        local steel_tally = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_steel') then steel_tally = steel_tally + 1 end
            end
        end

        return { vars = { card.ability.extra.chips, card.ability.extra.chips * steel_tally } }
    end,

    calculate = function(self, card, context)  
        if context.cardarea == G.play then

            local steel_tally = 0
            if G.playing_cards then
                for _, playing_card in ipairs(G.playing_cards) do
                    if SMODS.has_enhancement(playing_card, 'm_steel') then steel_tally = steel_tally + 1 end
                end
            end

            if context.individual then
                return {
                    chips = card.ability.extra.chips * steel_tally,
                    card = card
                }
            end
        end
    end
}

--ID 096 (Little C.H.A.D.)

--ID 097 (The Book of Sin)

--ID 098 (The Relic)

--ID 099 (Little Gish)

--ID 100 (Little Steven)

SMODS.Joker{

    key = 'little_steven',
    atlas = 'HCE_Jokers',
    pos = {x= 16, y = 4},


    rarity = 2,
    cost = 4,
    unlocked = true,
    blueprint_compat = true,


    config = {extra = { chips = 2, tarot_count = 0} },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.tarot_count, card.ability.extra.chips * card.ability.extra.tarot_count} }
    end,

    calculate = function(self, card, context)
        if context.using_consumeable and context.consumeable.ability.set == 'Tarot' then
            card.ability.extra.tarot_count = card.ability.extra.tarot_count + 1
        end

        if context.individual and context.cardarea == G.play then
            return {
                chips = card.ability.extra.chips * card.ability.extra.tarot_count,
                card = card
            }
        end

        if context.ante_change and context.ante_end then
            card.ability.extra.tarot_count = 0
                return {
                    message = "Reset",
                }
        end
    end
}

--ID 101 (The Halo)

--ID 102 (Mom's Bottle of Pills)

--ID 103 (The Common Cold)

--ID 104 (The Parasite)

--ID 105 (The D6)

SMODS.Joker{

    key = 'the_d6',
    atlas = 'HCE_Jokers',
    pos = {x= 1, y = 5},


    rarity = 3,
    cost = 4,
    unlocked = true,
    blueprint_compat = false,

    config = {extra = { activated = true, can_use = false} },

        loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.activated, card.ability.extra.can_use, colours = {G.C.RED, G.C.FILTER}}}
    end,

    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.can_use = true
        local eval = function(card) return card.ability.extra.can_use end
        juice_card_until(card, eval, true)
    end,

    calculate = function(self, card, context)
        if context.hce_using_joker and context.hce_joker_used == card then
            if G.jokers.cards[1] == card then
                return {
                    message = localize('k_nope_ex'),
                    sound = "hce_buzzer"
                }
            else
                local rerolled_joker = G.jokers.cards[1]
                local edition = rerolled_joker.edition
                local apply_eternal = rerolled_joker.ability.eternal
                local apply_rental = rerolled_joker.ability.rental
                local apply_perishable = rerolled_joker.ability.perishable

                SMODS.Stickers["eternal"]:apply(rerolled_joker, false)
                SMODS.destroy_cards(rerolled_joker)
                local new_joker = SMODS.add_card {
                    set = "Joker",
                    edition = edition,
                    no_edition = true,
                }

                SMODS.Stickers["eternal"]:apply(new_joker, apply_eternal)
                SMODS.Stickers["rental"]:apply(new_joker, apply_rental)
                SMODS.Stickers["perishable"]:apply(new_joker, apply_perishable)
                play_sound('hce_dice_roll')

                card.ability.extra.can_use = false
            end
        end

        if context.ante_change and context.ante_end then
            if not card.ability.extra.can_use then
                card.ability.extra.can_use = true
                local eval = function(card) return card.ability.extra.can_use end
                juice_card_until(card, eval, true)
                return {
                    message = "Charged!",
                    sound = "hce_charge"
                }
            end
        end
    end
}

--ID 106 (Mr. Mega)

--ID 107 (The Pinking Shears)

--ID 108 (The Wafer)

--ID 109 (Money = Power)

--ID 110 (Mom's Contacts)

--ID 111 (The Bean)

--ID 112 (Guardian Angel)

SMODS.Joker{

    key = 'guardian_angel',
    atlas = 'HCE_Jokers',
    pos = {x= 8, y = 5},


    rarity = 1,
    cost = 4,
    unlocked = true,
    blueprint_compat = true,


    config = {extra = { chips = 2 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips} }
    end,

    calculate = function(self, card, context)  
        if context.individual and context.cardarea == G.play then
            return {
                chips = card.ability.extra.chips * #G.hand.cards,
                card = card
            }
        end
    end
}

--ID 113 (Demon Baby)

SMODS.Joker{

    key = 'demon_baby',
    atlas = 'HCE_Jokers',
    pos = {x= 9, y = 5},


    rarity = 1,
    cost = 4,
    unlocked = true,
    blueprint_compat = true,


    config = {extra = { chips = 2, destroyed_count = 0 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.destroyed_count, card.ability.extra.chips * card.ability.extra.destroyed_count} }
    end,

    calculate = function(self, card, context)

        if context.remove_playing_cards and not context.selling_card then
            local local_destroyed_count = 0
            for i, destroyed_card in ipairs(context.removed) do
                if (destroyed_card.ability.set ~= "Joker") then
                    local_destroyed_count = local_destroyed_count + 1
                end
            end
            card.ability.extra.destroyed_count = card.ability.extra.destroyed_count + local_destroyed_count
        end

        if context.individual and context.cardarea == G.play then
            return {
                chips = card.ability.extra.chips * card.ability.extra.destroyed_count,
                card = card
            }
        end

        if context.ante_change and context.ante_end then
            card.ability.extra.destroyed_count = 0
                return {
                    message = "Reset",
                }
        end
    end
}

--ID 114 (Mom's Knife)

--ID 115 (Ouija Board)

--ID 116 (9 Volt)

--ID 117 (Dead Bird)

--ID 118 (Brimstone)

--ID 119 (Blood Bag)

--ID 120 (Odd Mushroom - Skinny)

--ID 121 (Odd Mushroom - Wide)

--ID 122 (Whore of Babylon)

--ID 123 (Monster Manual)