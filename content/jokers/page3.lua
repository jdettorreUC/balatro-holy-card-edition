--Page 3 Jokers Atlas
SMODS.Atlas{
    key = 'HCE_Jokers3',
    path = 'HCE_jokers3.png',
    px = 71,
    py = 95
}

--ID 245 (20/20)

SMODS.Joker{

    key = '20_20',
    atlas = 'HCE_Jokers3',
    pos = {x= 0, y = 0},


    rarity = 3,
    cost = 4,
    unlocked = true,
    blueprint_compat = true,


    config = {extra = { chips = 0 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,

    calculate = function(self, card, context)
        if context.before and context.scoring_hand and context.scoring_name == "Pair" then
            card.ability.extra.chips = card.ability.extra.chips + 20
            return {
                message = 'Upgrade!',
                sound = 'hce_thumbs_up'
            }
        end

        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}

--ID 246 (Blue Map)

--ID 247 (BFFS!)

--ID 248 (Hive Mind)

--ID 249 (There's Options)

--ID 250 (Bogo Bombs)

--ID 251 (Starter Deck)

--ID 252 (Little Baggy)

--ID 253 (Magic Scab)

--ID 254 (Blood Clot)

--ID 255 (Screw)

--ID 256 (Hot Bombs)

--ID 257 (Fire Mind)

--ID 258 (Missing No.)

SMODS.Joker{

    key = 'missing_no',
    atlas = 'HCE_Jokers3',
    pos = {x= 13, y = 0},

    rarity = 1,
    cost = 4,
    unlocked = true,
    blueprint_compat = true,
    perishable_compat = false,

    add_to_deck = function(self, card, from_debuff)
        card.ability.eternal = true
    end,

    calculate = function(self, card, context)
        if context.setting_blind then
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] ~= card then
                    local rerolled_joker = G.jokers.cards[i]
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
                end
            end

            card:juice_up()
            play_sound('hce_thumbs_up')
        end
    end
}

--ID 259 (Dark Matter)

--ID 260 (Black Candle)

--ID 261 (Proptosis)

--ID 262 (Missing Page 2)

--ID 263 (Clear Rune)

--ID 264 (Smart Fly)

--ID 265 (Dry Baby)

--ID 266 (Juicy Sack)

--ID 267 (Robo-Baby 2.0)

--ID 268 (Rotten Baby)

--ID 269 (Headless Baby)

--ID 270 (Leech)

--ID 271 (Mystery Sack)

--ID 272 (BBF)

--ID 273 (Bob's Brain)

--ID 274 (Best Bud)

--ID 275 (Lil Brimstone)

--ID 276 (Isaac's Heart)

--ID 277 (Lil Haunt)

--ID 278 (Dark Bum)

--ID 279 (Big Fan)

--ID 280 (Sissy Longlegs)

--ID 281 (Punching Bag)

--ID 282 (How To Jump)

--ID 283 (D100)

--ID 284 (D4)

SMODS.Joker{

    key = 'd4',
    atlas = 'HCE_Jokers3',
    pos = {x= 19, y = 1},


    rarity = 1,
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
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] ~= card then
                    local rerolled_joker = G.jokers.cards[i]
                    local edition = rerolled_joker.edition
                    local apply_eternal = rerolled_joker.ability.eternal
                    local apply_rental = rerolled_joker.ability.rental
                    local apply_perishable = rerolled_joker.ability.perishable

                    SMODS.destroy_cards(rerolled_joker, true, true)
                    local new_joker = SMODS.add_card {
                        set = "Joker",
                        edition = edition,
                        no_edition = true,
                    }

                    SMODS.Stickers["eternal"]:apply(new_joker, apply_eternal)
                    SMODS.Stickers["rental"]:apply(new_joker, apply_rental)
                    SMODS.Stickers["perishable"]:apply(new_joker, apply_perishable)
                end
            end

            play_sound('hce_dice_roll')
            card.ability.extra.can_use = false
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

--ID 285 (D10)

SMODS.Joker{

    key = 'd10',
    atlas = 'HCE_Jokers3',
    pos = {x= 0, y = 2},


    rarity = 1,
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
            if not G.blind_select then
                return {
                    message = localize('k_nope_ex'),
                    sound = "hce_buzzer"
                }
            else
                --so it doesn't spend money every time
                G.from_boss_tag = true
                G.FUNCS.reroll_boss()
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

--ID 286 (Blank Card)

--ID 287 (Book of Secrets)

--ID 288 (Box of Spiders)

--ID 289 (Red Candle)

--ID 290 (The Jar)

--ID 291 (Flush!)

--ID 292 (Satanic Bible)

--ID 293 (Head of Krampus)

--ID 294 (Butter Bean)

--ID 295 (Magic Fingers)
SMODS.Joker{

    key = 'magic_fingers',
    atlas = 'HCE_Jokers3',
    pos = {x= 10, y = 2},


    rarity = 1,
    cost = 4,
    unlocked = true,
    blueprint_compat = false,

    config = {extra = { activated = true, can_use = true, mult = 0, mult_mod = 5, use_cost = 3} },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.activated, card.ability.extra.can_use, card.ability.extra.mult, card.ability.extra.mult_mod, card.ability.extra.use_cost, colours = {G.C.RED, G.C.MONEY}}}
    end,

    calculate = function(self, card, context)
        if context.hce_using_joker and context.hce_joker_used == card then
            if G.GAME.dollars - card.ability.extra.use_cost < G.GAME.bankrupt_at then
                return {
                    message = localize('k_nope_ex'),
                    sound = "hce_buzzer"
                }
            else
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod

                if not context.hce_from_car_battery then
                    ease_dollars(-card.ability.extra.use_cost)
                end

                return {
                    message = "Upgrade!",
                    sound = "hce_thumbs_up"
                }
            end
        end

        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end

        if context.after and context.cardarea == G.jokers and card.ability.extra.mult > 0 then
            card.ability.extra.mult = 0
            return {
                message = "Reset",
            }
        end
    end
}

--ID 296 (Converter)

--ID 297 (Pandora's Box)
SMODS.Joker{

    key = 'pandoras_box',
    atlas = 'HCE_Jokers3',
    pos = {x= 12, y = 2},


    rarity = 2,
    cost = 4,
    unlocked = true,
    blueprint_compat = false,

    config = {extra = { activated = true, can_use = true, desc_key = "j_hce_pandoras_box"} },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.activated, card.ability.extra.can_use, colours = {G.C.RED, G.C.BLUE}}, key = card.ability.extra.desc_key}
    end,

    add_to_deck = function(self, card, from_debuff)
        local desc_keys = {
            [1] = "j_hce_pandoras_box_ante0",
            [2] = "j_hce_pandoras_box_ante1",
            [3] = "j_hce_pandoras_box_ante2",
            [4] = "j_hce_pandoras_box_ante3",
            [5] = "j_hce_pandoras_box_ante4",
            [6] = "j_hce_pandoras_box_ante5",
            [7] = "j_hce_pandoras_box_ante6",
            [8] = "j_hce_pandoras_box_ante7",
            [9] = "j_hce_pandoras_box_ante8",
        }

        if G.GAME.round_resets.blind_ante < 0 then
            card.ability.extra.desc_key = desc_keys[1]
        elseif G.GAME.round_resets.blind_ante < 8 then
            card.ability.extra.desc_key = desc_keys[G.GAME.round_resets.blind_ante + 1]
        else
            card.ability.extra.desc_key = "j_hce_pandoras_box_endless"
        end

        local eval = function(card) return not card.REMOVED end
        juice_card_until(card, eval, true)
    end,

    calculate = function(self, card, context)
        if context.hce_using_joker and context.hce_joker_used == card then
            if G.GAME.round_resets.blind_ante < 1 then
                if G.consumeables.config.card_limit - #G.consumeables.cards > 0 then
                    SMODS.add_card{ key = "c_soul" }
                end
            elseif G.GAME.round_resets.blind_ante == 1 then
                if G.consumeables.config.card_limit - #G.consumeables.cards > 0 then
                    SMODS.add_card{ set = "Spectral" }
                end
            elseif G.GAME.round_resets.blind_ante == 2 then
                if G.consumeables.config.card_limit - #G.consumeables.cards > 0 then
                    SMODS.add_card{ set = "Tarot" }
                end
                if G.consumeables.config.card_limit - #G.consumeables.cards > 0 then
                    SMODS.add_card{ set = "Planet" }
                end
            elseif G.GAME.round_resets.blind_ante == 3 then
                --accounts for the joker slot that will be freed from pandora's box being consumed without giving an extra joker due to car battery
                if G.jokers.config.card_limit - #G.jokers.cards > 0 or (G.jokers.config.card_limit - #G.jokers.cards == 0 and not context.hce_from_car_battery) then
                    local rand_edition = poll_edition("hce_pandoras_box", nil, false, true)
                    SMODS.add_card {
                        set = "Joker",
                        edition = rand_edition,
                        rarity = "Common"
                    }
                end
            elseif G.GAME.round_resets.blind_ante == 4 then
                if G.jokers.config.card_limit - #G.jokers.cards > 0 or (G.jokers.config.card_limit - #G.jokers.cards == 0 and not context.hce_from_car_battery) then
                    local rand_edition = poll_edition("hce_pandoras_box", nil, false, true)
                    SMODS.add_card {
                        set = "Joker",
                        edition = rand_edition,
                        rarity = "Common"
                    }
                end

                if G.consumeables.config.card_limit - #G.consumeables.cards > 0 then
                    SMODS.add_card{ set = "Spectral" }
                end
            elseif G.GAME.round_resets.blind_ante == 5 then
                for i = 1, 2 do
                    if G.consumeables.config.card_limit - #G.consumeables.cards > 0 then
                        SMODS.add_card{ set = "Spectral" }
                    end
                end
            elseif G.GAME.round_resets.blind_ante == 6 then
                ease_dollars(20, true)
            elseif G.GAME.round_resets.blind_ante == 7 then
                for i = 1, 2 do
                    if G.jokers.config.card_limit - #G.jokers.cards > 0 or (G.jokers.config.card_limit - #G.jokers.cards == 0 and not context.hce_from_car_battery) then
                        local rand_edition = poll_edition("hce_pandoras_box", nil, false, true)
                        SMODS.add_card {
                            set = "Joker",
                            edition = rand_edition,
                            rarity = "Common"
                        }
                    end
                end
            elseif G.GAME.round_resets.blind_ante == 8 then
                if G.jokers.config.card_limit - #G.jokers.cards > 0 or (G.jokers.config.card_limit - #G.jokers.cards == 0 and not context.hce_from_car_battery) then
                    SMODS.add_card{key = "j_hce_the_bible"}
                end
            end

            --this allows pandoras box to retrigger via car battery before being destroyed
            if not next(SMODS.find_card("j_hce_car_battery")) or context.hce_from_car_battery then
                SMODS.destroy_cards(card, nil, nil, true)
            end

            if G.GAME.round_resets.blind_ante >= 9 then
                return {
                    message = localize('k_nope_ex'),
                }
            else
                play_sound("hce_thumbs_up")
            end
        end

        if context.ante_change then
            local desc_keys = {
                [1] = "j_hce_pandoras_box_ante0",
                [2] = "j_hce_pandoras_box_ante1",
                [3] = "j_hce_pandoras_box_ante2",
                [4] = "j_hce_pandoras_box_ante3",
                [5] = "j_hce_pandoras_box_ante4",
                [6] = "j_hce_pandoras_box_ante5",
                [7] = "j_hce_pandoras_box_ante6",
                [8] = "j_hce_pandoras_box_ante7",
                [9] = "j_hce_pandoras_box_ante8",
            }

        
            if G.GAME.round_resets.blind_ante < 0 then
                card.ability.extra.desc_key = desc_keys[1]
            elseif G.GAME.round_resets.blind_ante < 8 then
                card.ability.extra.desc_key = desc_keys[G.GAME.round_resets.blind_ante + 1 + context.ante_change]
            else
                card.ability.extra.desc_key = "j_hce_pandoras_box_endless"
            end

            return {
                key = card.ability.extra.desc_key
            }
        end
    end
}

--ID 298 (Unicorn Stump)

--ID 299 (Taurus)

--ID 300 (Aries)

--ID 301 (Cancer)

--ID 302 (Leo)

--ID 303 (Virgo)

--ID 304 (Libra)

--ID 305 (Scorpio)

--ID 306 (Sagittarius)

--ID 307 (Capricorn)

--ID 308 (Aquarius)

--ID 309 (Pisces)

--ID 310 (Eve's Mascara)

--ID 311 (Judas' Shadow)

--ID 312 (Maggy's Bow)

--ID 313 (Holy Mantle)

--ID 314 (Thunder Thighs)

--ID 315 (Strange Attractor)

--ID 316 (Cursed Eye)

--ID 317 (Mysterious Liquid)

--ID 318 (Gemini)

--ID 319 (Cain's Other Eye)

--ID 320 (???'s Only Friend)

--ID 321 (Samson's Chains)

--ID 322 (Mongo Baby)

--ID 323 (Isaac's Tears)

--ID 324 (Undefined)

--ID 325 (Scissors)

--ID 326 (Breath of Life)

--ID 327 (The Polaroid)

--ID 328 (The Negative)

--ID 329 (Ludovico Technique)

--ID 330 (Soy Milk)

--ID 331 (Godhead)

--ID 332 (Lazarus' Rags)

--ID 333 (The Mind)

--ID 334 (The Body)

--ID 335 (The Soul)

--ID 336 (Dead Onion)

--ID 337 (Broken Watch)

--ID 338 (The Boomerang)

--ID 339 (Safety Pin)

--ID 340 (Caffeine Pill)

--ID 341 (Torn Photo)

--ID 342 (Blue Cap)

--ID 343 (Latch Key)

--ID 344 (Match Book)

--ID 345 (Synthoil)

--ID 346 (A Snack)

--ID 347 (Diplopia)

--ID 348 (Placebo)

--ID 349 (Wooden Nickel)

--ID 350 (Toxic Shock)

--ID 351 (Mega Bean)

--ID 352 (Glass Cannon) ***SPRITE IS MISPELLED, NEEDS FIXED***

--ID 353 (Bomber Boy)

--ID 354 (Crack Jacks)

--ID 355 (Mom's Pearls)

--ID 356 (Car Battery)
SMODS.Joker{
    key = 'car_battery',
    atlas = 'HCE_Jokers3',
    pos = {x= 11, y = 5},

    rarity = 2,
    cost = 4,
    unlocked = true,
    blueprint_compat = true,

    calculate = function(self, card, context)
        if context.hce_using_joker and not context.hce_from_car_battery then
            local card_used = context.hce_joker_used
            local car_batteries_to_left = 0

            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    break
                elseif G.jokers.cards[i].config.center.key == "j_hce_car_battery" then
                    car_batteries_to_left = car_batteries_to_left + 1
                end
            end

            --local battery_buffer = 5 * car_batteries_to_left
            local battery_buffer = 0

            --locks button to prevent spam
            local refund_use_flag = false
            --a use_cost existing implies that there is no recharge (may need to change this later)
            if card_used.ability.extra.use_cost then
                card_used.ability.extra.can_use = false
                refund_use_flag = true
            end

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                func = function()
                G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.5 * G.SETTINGS.GAMESPEED,
                        func = function()
                            attention_text({
                                text = localize('k_again_ex'),
                                scale = 0.7,
                                hold = 1.4,
                                major = card,
                                backdrop_colour = G.C.FILTER,
                                align = 'bm',
                                silent = true
                            })
                            card:juice_up()
                            play_sound('hce_charge')
                            G.E_MANAGER:add_event(Event({
                                    trigger = 'after',
                                    delay = 0.5 * G.SETTINGS.GAMESPEED + battery_buffer,
                                    func = function ()
                                        SMODS.calculate_context({hce_using_joker = true, hce_joker_used = card_used, hce_from_car_battery = true, area = card_used.from_area})
                                        G.E_MANAGER:add_event(Event({
                                            trigger = 'after',
                                            delay = 0.5 * G.SETTINGS.GAMESPEED,
                                            func = function ()
                                                if refund_use_flag then
                                                    card_used.ability.extra.can_use = true
                                                end
                                                return true
                                            end
                                        }))
                                        return true
                                    end
                            }))
                            return true
                        end
                    }))
                    return true
                end,
            }))
        end
    end
}

--ID 357 (Box of Friends)

--ID 358 (The Wiz)
SMODS.Joker{
    key = 'the_wiz',
    atlas = 'HCE_Jokers3',
    pos = {x= 13, y = 5},

    rarity = 1,
    cost = 4,
    unlocked = true,
    blueprint_compat = true,

    config = {extra = {to_draw = 3} },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.to_draw } }
    end,

    calculate = function(self, card, context)
        if context.drawing_cards and (G.GAME.current_round.hands_played ~= 0 or G.GAME.current_round.discards_used ~= 0) then
            return {
                cards_to_draw = card.ability.extra.to_draw
            }
        end
    end
}

--ID 359 (8 Inch Nails)

--ID 360 (Incubus)

--ID 361 (Fate's Reward)

--ID 362 (Lil Chest)

--ID 363 (Sworn Protector)

--ID 364 (Friend Zone)