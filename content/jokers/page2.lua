--Page 2 Jokers Atlas
SMODS.Atlas{
    key = 'HCE_Jokers2',
    path = 'HCE_jokers2.png',
    px = 71,
    py = 95
}

--ID 124 (Dead Sea Scrolls)

--ID 125 (Bobby Bombs)

--ID 126 (Razor Blade)

--ID 127 (Forget Me Now)

--ID 128 (Forever Alone)

--ID 129 (Bucket of Lard)

--ID 130 (A Pony)

--ID 131 (Bomb Bag)

--ID 132 (A Lump of Coal)

--ID 133 (Guppy's Paw)

--ID 134 (Guppy's Tail)

SMODS.Joker{

    key = 'guppys_tail',
    atlas = 'HCE_Jokers2',
    pos = {x= 10, y = 0},


    rarity = 2,
    cost = 4,
    unlocked = true,
    blueprint_compat = true,


    config = {extra = { odds = 3, card_slots = 1, pack_slots = 1, restore_flag = false} },

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'hce_guppys_tail')
        return { vars = { numerator, denominator, card.ability.extra.card_slots, card.ability.extra.pack_slots, card.ability.extra.restore_flag} }
    end,

    remove_from_deck = function(self, card, from_debuff)
        if card.ability.restore_flag then
            change_shop_size(card.ability.extra.card_slots)
            SMODS.change_booster_limit(-card.ability.extra.pack_slots)
        end
    end,

    calculate = function(self, card, context)
        if context.starting_shop and SMODS.pseudorandom_probability(card, 'hce_guppys_tail', 1, card.ability.extra.odds) then
            change_shop_size(-card.ability.extra.card_slots)
            SMODS.change_booster_limit(card.ability.extra.pack_slots)
            card.ability.extra.restore_flag = true
            card:juice_up()
            play_sound('hce_thumbs_up')
        end

        if context.ending_shop and card.ability.extra.restore_flag then
            change_shop_size(card.ability.extra.card_slots)
            SMODS.change_booster_limit(-card.ability.extra.pack_slots)
            card.ability.restore_flag = false
        end
    end
}

--ID 135 (IV Bag)

--ID 136 (Best Friend)

--ID 137 (Remote Detonator)

--ID 138 (Stigmata)

--ID 139 (Mom's Purse)

--ID 140 (Bob's Curse)

--ID 141 (Pageant Boy)

--ID 142 (Scapular)

--ID 143 (Speed Ball)

--ID 144 (Bum Friend)

--ID 145 (Guppy's Head)

--ID 146 (Prayer Card)

--ID 147 (Notched Axe)

--ID 148 (Infestation)

SMODS.Joker{

    key = 'infestation',
    atlas = 'HCE_Jokers2',
    pos = {x= 4, y = 1},


    rarity = 1,
    cost = 4,
    unlocked = true,
    blueprint_compat = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_hce_infested
    end,

    calculate = function(self, card, context)
        if context.before then
            local non_infesteds = {}

            for _, v in pairs(context.scoring_hand) do
                if not SMODS.has_enhancement(v, 'm_hce_infested') then
                    non_infesteds[#non_infesteds + 1] = v
                end
            end

            if #non_infesteds < #context.scoring_hand and #non_infesteds > 0 then --there was at least one infested card and at least one non-infested card
                local new_infested = pseudorandom_element(non_infesteds, 'hce_infestation')
                new_infested:set_ability('m_hce_infested')
                G.E_MANAGER:add_event(Event({
                    func = function()
                        new_infested:juice_up()
                        return true
                    end
                }))

                return {
                    message = 'Infested!',
                    sound = 'hce_thumbs_up'
                }
            end
        end
    end
}

--ID 149 (Ipecac)

--ID 150 (Tough Love)

--ID 151 (The Mulligan)

--ID 152 (Technology 2)

--ID 153 (Mutant Spider)

SMODS.Joker{

    key = 'mutant_spider',
    atlas = 'HCE_Jokers2',
    pos = {x= 9, y = 1},


    rarity = 2,
    cost = 4,
    unlocked = true,
    blueprint_compat = true,


    config = {extra = { mult = 0, chips = 0} },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.chips } }
    end,

    calculate = function(self, card, context)
        if context.before and context.scoring_hand and context.scoring_name == "Four of a Kind" then
            card.ability.extra.mult = card.ability.extra.mult + 8
            card.ability.extra.chips = card.ability.extra.chips + 8
            return {
                message = 'Upgrade!',
                sound = 'hce_thumbs_up'
            }
        end

        if context.joker_main then
            return {
                mult = card.ability.extra.mult,
                chips = card.ability.extra.chips
            }
        end
    end
}

--ID 154 (Chemical Peel)

--ID 155 (The Peeper)

--ID 156 (Habit)

--ID 157 (Bloody Lust)

--ID 158 (Crystal Ball)

--ID 159 (Spirit of the Night)

--ID 160 (Crack the Sky)

--ID 161 (Ankh)

--ID 162 (Celtic Cross)

--ID 163 (Ghost Baby)

SMODS.Joker{

    key = 'ghost_baby',
    atlas = 'HCE_Jokers2',
    pos = {x = 19, y = 1},


    rarity = 1,
    cost = 4,
    unlocked = true,
    blueprint_compat = true,


    config = {extra = { chips = 2, spectral_count = 0 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.spectral_count, card.ability.extra.chips * card.ability.extra.spectral_count} }
    end,

    calculate = function(self, card, context)
        if context.using_consumeable and context.consumeable.ability.set == 'Spectral' then
            card.ability.extra.spectral_count = card.ability.extra.spectral_count + 1
        end

        if context.individual and context.cardarea == G.play then
            return {
                chips = card.ability.extra.chips * card.ability.extra.spectral_count,
                card = card
            }
        end
    end
}

--ID 164 (The Candle)

--ID 165 (Cat-O-Nine-Tails)

--ID 166 (D20)

SMODS.Joker{

    key = 'd20',
    atlas = 'HCE_Jokers2',
    pos = {x= 2, y = 2},


    rarity = 2,
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
            if #G.consumeables.cards == 0 then
                return {
                    message = localize('k_nope_ex'),
                    sound = "hce_buzzer"
                }
            else
                local edition_queue = {}

                for i = 1, #G.consumeables.cards do
                    if G.consumeables.cards[i].edition then
                        edition_queue[#edition_queue+1] = G.consumeables.cards[i].edition.key
                    else
                        edition_queue[#edition_queue+1] = 0
                    end
                end

                SMODS.destroy_cards(G.consumeables.cards)

                while (#edition_queue > 0) do
                    local random_pool = nil

                    if SMODS.pseudorandom_probability(card, 'hce_d20', 7, 100) then --mimics Ghost Deck odds for spectrals (7%)
                        random_pool = 'Spectral'
                    elseif SMODS.pseudorandom_probability(card, 'hce_d20', 1, 2) then --50/50 for pill or tarot
                        random_pool = 'Planet'
                    else
                        random_pool = 'Tarot'
                    end

                    SMODS.add_card{set = random_pool, edition = edition_queue[1]}
                    table.remove(edition_queue, 1)
                end

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

--ID 167 (Harlequin Baby)

SMODS.Joker{

    key = 'harlequin_baby',
    atlas = 'HCE_Jokers2',
    pos = {x = 3, y = 2},


    rarity = 1,
    cost = 4,
    unlocked = true,
    blueprint_compat = true,


    config = {extra = { chips = 2 } },

    loc_vars = function(self, info_queue, card)
        local joker_count = 0
        if G.jokers then
            joker_count = #G.jokers.cards
        end
        return { vars = { card.ability.extra.chips, card.ability.extra.chips * joker_count} }
    end,

    calculate = function(self, card, context)  
        if context.individual and context.cardarea == G.play then
            return {
                chips = card.ability.extra.chips * #G.jokers.cards,
                card = card
            }
        end
    end
}

--ID 168 (Epic Fetus)

--ID 169 (Polyphemus)

--ID 170 (Daddy Longlegs)

--ID 171 (Spider Butt)

--ID 172 (Sacrificial Dagger)

--ID 173 (Mitre)

--ID 174 (Rainbow Baby)

SMODS.Joker{

    key = 'rainbow_baby',
    atlas = 'HCE_Jokers2',
    pos = {x= 10, y = 2},


    rarity = 1,
    cost = 4,
    unlocked = true,
    blueprint_compat = true,


    config = {extra = { chips = 2 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips} }
    end,

    calculate = function(self, card, context)

        if context.cardarea == G.play then
            local suit_count = 0
            for _, suit in pairs(SMODS.Suits) do
                for _, playing_card in pairs(context.scoring_hand) do
                    if playing_card:is_suit(suit.key) then
                    suit_count = suit_count + 1
                    break
                    end
                end
            end

            if context.individual then
                return {
                    chips = card.ability.extra.chips * suit_count,
                    card = card
                }
            end
        end
    end
}

--ID 175 (Dad's Key)

--ID 176 (Stem Cells)

--ID 177 (Portable Slot)

--ID 178 (Holy Water)

--ID 179 (Fate)

--ID 180 (The Black Bean)

--ID 181 (White Pony)

--ID 182 (Sacred Heart)

--ID 183 (Tooth Picks)

--ID 184 (Holy Grail)

--ID 185 (Dead Dove)

--ID 186 (Blood Rights)

--ID 187 (Guppy's Hairball)

--ID 188 (Abel)

SMODS.Joker{

    key = 'abel',
    atlas = 'HCE_Jokers2',
    pos = {x= 4, y = 3},


    rarity = 1,
    cost = 4,
    unlocked = true,
    blueprint_compat = true,


    config = {extra = { chips = 2, lucky_triggers = 0 } },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_lucky
        return { vars = { card.ability.extra.chips, card.ability.extra.lucky_triggers, card.ability.extra.chips * card.ability.extra.lucky_triggers} }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card.lucky_trigger then
            card.ability.extra.lucky_triggers = card.ability.extra.lucky_triggers + 1
        end

        if context.individual and context.cardarea == G.play then
            return {
                chips = card.ability.extra.chips * card.ability.extra.lucky_triggers,
                card = card
            }
        end

        if context.ante_change and context.ante_end then
            card.ability.extra.lucky_triggers = 0
                return {
                    message = "Reset",
                }
        end
    end
}

--ID 189 (SMB Super Fan)

--ID 190 (Pyro)

--ID 191 (3 Dollar Bill)

--ID 192 (Telepathy For Dummies)

--ID 193 (MEAT!)

--ID 194 (Magic 8 Ball)

--ID 195 (Mom's Coin Purse)

--ID 196 (Squeezy)

--ID 197 (Jesus Juice)

--ID 198 (Box)

--ID 199 (Mom's Key)

--ID 200 (Mom's Eyeshadow)

--ID 201 (Iron Bar)

--ID 202 (Midas' Touch)

--ID 203 (Humbleing Bundle)

--ID 204 (Fanny Pack)

--ID 205 (Sharp Plug)

--ID 206 (Guillotine)

--ID 207 (Ball of Bandages)

--ID 208 (Champion Belt)

--ID 209 (Butt Bombs)

--ID 210 (Gnawed Leaf)

--ID 211 (Spiderbaby)

--ID 212 (Guppy's Collar)

--ID 213 (Lost Contact)

--ID 214 (Anemic)

--ID 215 (Goat Head)

--ID 216 (Ceremonial Robes)

--ID 217 (Mom's Wig)

--ID 218 (Placenta)

--ID 219 (Old Bandage)

--ID 220 (Sad Bombs)

--ID 221 (Rubber Cement)

--ID 222 (Anti-Gravity)

--ID 223 (Pyromaniac)

--ID 224 (Cricket's Body)

--ID 225 (Gimpy)

--ID 226 (Black Lotus)

--ID 227 (Piggy Bank)

--ID 228 (Mom's Perfume)

--ID 229 (Monstro's Lung)

--ID 230 (Abaddon)

--ID 231 (Ball of Tar)

--ID 232 (Stop Watch)

--ID 233 (Tiny Planet)

--ID 234 (Infestation 2)

--ID 235 DNE

--ID 236 (E. Coli)

--ID 237 (Death's Touch)

--ID 238 (Key Piece 1)

--ID 239 (Key Piece 2)

--ID 240 (Experimental Treatment)

--ID 241 (Contract From Below)

--ID 242 (Infamy)

--ID 243 (Trinity Shield)

--ID 244 (Tech.5)