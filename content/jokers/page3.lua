--Page 3 Jokers Atlas
SMODS.Atlas{
    key = 'HCE_Jokers3',
    path = 'HCE_jokers3.png',
    px = 71,
    py = 95
}

--ID 245 (20/20)

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

--ID 285 (D10)

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
                --this is >= because it accounts for the slot that will be freed when pandoras box is consumed
                if G.jokers.config.card_limit - #G.jokers.cards >= 0 then
                    local rand_edition = poll_edition("hce_pandoras_box", nil, false, true)
                    SMODS.add_card {
                        set = "Joker",
                        edition = rand_edition,
                        rarity = "Common"
                    }
                end
            elseif G.GAME.round_resets.blind_ante == 4 then
                if G.jokers.config.card_limit - #G.jokers.cards >= 0 then
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
                    if G.jokers.config.card_limit - #G.jokers.cards >= 0 then
                        local rand_edition = poll_edition("hce_pandoras_box", nil, false, true)
                        SMODS.add_card {
                            set = "Joker",
                            edition = rand_edition,
                            rarity = "Common"
                        }
                    end
                end
            elseif G.GAME.round_resets.blind_ante == 8 then
                --does nothing until I add The Bible
            end

            SMODS.destroy_cards(card, nil, nil, true)

            if G.GAME.round_resets.blind_ante >= 9 then
                return {
                    message = localize('k_nope_ex'),
                }
            end
        end

        if context.ante_change then
            --print("test")
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

--ID 357 (Box of Friends)

--ID 358 (The Wiz)

--ID 359 (8 Inch Nails)

--ID 360 (Incubus)

--ID 361 (Fate's Reward)

--ID 362 (Lil Chest)

--ID 363 (Sworn Protector)

--ID 364 (Friend Zone)