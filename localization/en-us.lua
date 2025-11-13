return {
    descriptions = {
        Enhanced = {
            m_hce_infested = {
                name = 'Infested Card',
                text = {
                    [1] = 'Scores {C:mult}+1{} Mult and {C:chips}+2{} Chips',
                    [2] = 'per {C:attention}Infested Card{} in full deck',
                    [3] = '{C:inactive}(Currently {C:mult}+#1# {C:inactive}Mult and {C:chips}+#2# {C:inactive}Chips)',
                },
            },
            m_hce_soiled = {
                name = 'Soiled Card',
                text = {
                    [1] = '{C:green}#2# in #3#{} chance to',
                    [2] = 'earn {C:money}$#1#{} when discarded',
                },
            },
            m_hce_charged = {
                name = 'Charged Card',
                text = {
                    [1] = 'Increase rank by {C:attention}#1#{} after',
                    [2] = 'scoring, permanently gains',
                    [3] = '{X:mult,C:white}X0.25{} mult when rank resets',
                    [4] = '{C:inactive}({C:attention}Ace {C:inactive}into {C:attention}2{C:inactive})'
                },
            },
            m_hce_explosive = {
                name = 'Explosive Card',
                text = {
                    [1] = '{C:attention}Explodes{} after scoring, permanently',
                    [2] = 'adding total chips to {C:attention}adjacent{}',
                    [3] = 'scoring cards in hand',
                },
            },
            m_hce_bone = {
                name = 'Bone Card',
                text = {
                    [1] = '{X:chips,C:white}X#1#{} Chips',
                    [2] = '{C:green}#2# in #3#{} chance to',
                    [3] = 'destroy card',
                },
            },
            m_hce_bloodied = {
                name = 'Bloodied Card',
                text = {
                    [1] = 'Gains {X:mult,C:white}X0.5{} Mult per card',
                    [2] = '{C:attention}destroyed{} this ante',
                    [3] = '{C:inactive}(Currently {X:mult,C:white}X#1#{} {C:inactive}Mult)'
                },
            },
        },
        Tarot = {
            c_hce_reverse_fool = {
                name = 'The Fool?',
                text = {
                    [1] = 'Creates a {C:attention}reverse{} copy of',
                    [2] = 'the last {C:tarot}Tarot{} card',
                    [3] = 'used during this run',
                    [4] = '{s:0.8,C:tarot}The Fool{s:0.8}/{s:0.8,C:tarot}The Fool? {s:0.8}excluded'
                },
            },
            c_hce_reverse_magician = {
                name = 'The Magician?',
                text = {
                    [1] = 'Discards {C:attention}#1#{} random cards in hand',
                    [2] = 'without spending a {C:attention}Discard',
                },
            },
            c_hce_reverse_high_priestess = {
                name = 'The High Priestess?',
                text = {
                    [1] = 'Decreases the highest leveled hand by',
                    [2] = '{C:attention}#1#{} levels and creates a {C:dark_edition}Negative{} copy of',
                    [3] = 'the corresponding {C:planet}Planet{} card',
                    [4] = '{C:inactive}(Currently: {C:attention}#2#{C:inactive})'
                },
            },
            c_hce_reverse_empress = {
                name = 'The Empress?',
                text = {
                    [1] = 'Debuffs {C:attention}2{} selected cards in hand',
                    [2] = 'then creates a random {C:spectral}Spectral{} card',
                    [3] = '{C:inactive}(Must have room)'
                },
            },
            c_hce_reverse_emperor = {
                name = 'The Emperor?',
                text = {
                    [1] = 'Rerolls upcoming {C:attention}Non-Boss Blind',
                    [2] = 'into a random {C:attention}Boss Blind{} and',
                    [3] = 'creates a free {C:attention}Investment Tag'
                },
            },
            c_hce_reverse_hierophant = {
                name = 'The Hierophant?',
                text = {
                    [1] = 'Enhances {C:attention}#1#{} selected',
                    [2] = 'card into a',
                    [3] = '{C:attention}Bone Card',
                },
            },
            c_hce_reverse_lovers = {
                name = 'The Lovers?',
                text = {
                    [1] = 'Select {C:attention}#1#{} cards, enhance',
                    [2] = 'the {C:attention}left{} card into a {C:attention}Bloodied Card',
                    [3] = 'and destroy the {C:attention}right{} card',
                },
            },
            c_hce_reverse_chariot = {
                name = 'The Chariot?',
                text = {
                    [1] = 'Applies {C:attention}Eternal{} to a random Joker',
                    [2] = 'and applies {C:attention}Perishable{} to a random Joker',
                },
            },
            c_hce_reverse_justice = {
                name = 'Justice?',
                text = {
                    [1] = 'Creates a {C:attention}copy{} of',
                    [2] = 'the last {C:attention}destroyed{} card',
                },
            },
            c_hce_reverse_hermit = {
                name = 'The Hermit?',
                text = {
                    [1] = 'Halves money and creates',
                    [2] = 'a free {C:attention}Coupon Tag{} and {C:attention}D6 Tag{}',
                    [3] = '{C:inactive}(Max of{} {C:money}-$20{}{C:inactive})',
                },
            },
            c_hce_reverse_wheel = {
                name = 'The Wheel of Fortune?',
                text = {
                    [1] = '{C:green}#1# in #2#{} chance to add',
                    [2] = '{C:dark_edition}Negative{} edition',
                    [3] = 'to a random {C:attention}Joker{}',
                },
            },
            c_hce_reverse_strength = {
                name = 'Strength?',
                text = {
                    [1] = 'Decreases rank of',
                    [2] = 'up to {C:attention}2{} selected',
                    [3] = 'cards by {C:attention}1',
                },
            },
            c_hce_reverse_hanged_man = {
                name = 'The Hanged Man?',
                text = {
                    [1] = 'Creates {C:attention}2{} random',
                    [2] = '{C:attention}Playing cards{} and',
                    [3] = 'adds them to your hand',
                },
            },
            c_hce_reverse_death = {
                name = 'Death?',
                text = {
                    [1] = 'Select {C:attention}1{} card, remove',
                    [2] = '{C:attention}all enhancements{} and gain',
                    [3] = 'the corresponding {C:attention}consumables{}',
                    [4] = '{C:inactive}(Example:{} {C:attention}Mult Card{} {C:inactive}={} {C:attention}The Empress{}{C:inactive})',
                },
            },
            c_hce_reverse_temperance = {
                name = 'Temperance?',
                text = {
                    [1] = 'Gives {C:money}$5{} per',
                    [2] = 'empty Joker slot',
                    [3] = '{C:inactive}(Currently{} {C:money}$#1#{}{C:inactive})',
                },
            },
            c_hce_reverse_devil = {
                name = 'The Devil?',
                text = {
                    [1] = 'Applies {C:attention}Rental{} to a random Joker',
                    [2] = 'then increases interest cap by {C:money}$#1#',
                },
            },
            c_hce_reverse_tower = {
                name = 'The Tower?',
                text = {
                    [1] = 'Enhances {C:attention}#1#{} selected',
                    [2] = 'card into an',
                    [3] = '{C:attention}Explosive Card',
                },
            },
            c_hce_reverse_star = {
                name = 'The Star?',
                text = {
                    [1] = 'Converts up to {C:attention}3{}',
                    [2] = 'selected {C:attention}Diamonds{} to',
                    [3] = 'random non-{C:attention}Diamond{} suits',
                },
            },
            c_hce_reverse_moon = {
                name = 'The Moon?',
                text = {
                    [1] = 'Converts up to {C:attention}3{}',
                    [2] = 'selected {C:attention}Clubs{} to',
                    [3] = 'random non-{C:attention}Club{} suits',
                },
            },
            c_hce_reverse_sun = {
                name = 'The Sun?',
                text = {
                    [1] = 'Converts up to {C:attention}3{}',
                    [2] = 'selected {C:attention}Hearts{} to',
                    [3] = 'random non-{C:attention}Heart{} suits',
                }
            },
            c_hce_reverse_judgement = {
                name = 'Judgement?',
                text = {
                    [1] = 'Destroy a random {C:attention}Joker{} and create',
                    [2] = 'a random non-Negative {C:attention}Joker tag',
                },
            },
            c_hce_reverse_world = {
                name = 'The World?',
                text = {
                    [1] = 'Converts up to {C:attention}3{}',
                    [2] = 'selected {C:attention}Spades{} to',
                    [3] = 'random non-{C:attention}Spade{} suits',
                },
            },
        },
        Joker = {
        --PAGE 1
            j_hce_sad_onion = {
                name = 'Sad Onion',
                text = {
                    [1] = '{C:chips}+#1#{} Chips',
                },
            },
            j_hce_the_inner_eye = {
                name = 'The Inner Eye',
                text = {
                    [1] = 'This Joker gains {C:mult}+6{} Mult if',
                    [2] = 'played hand is a {C:attention}Three of a Kind{}',
                    [3] = '{C:inactive}(Currently {C:mult}+#1#{} {C:inactive}Mult)',
                },
            },
            j_hce_my_reflection = {
                name = 'My Reflection',
                text = {
                    [1] = '{X:mult,C:white}x#1#{} Mult if scoring hand has',
                    [2] = '{C:attention}symmetrical{} ranks',
                },
            },
            j_hce_brother_bobby = {
                name = 'Brother Bobby',
                text = {
                    [1] = 'Played cards score {C:chips}+#1#{} Chips',
                    [2] = 'per remaining {C:attention}hand{}',
                },
            },
            j_hce_boom = {
                name = 'Boom!',
                text = {
                    [1] = 'When blind is selected, add {C:attention}#1#',
                    [2] = 'random {C:attention}Explosive Cards{} to hand',
                    [3] = 'and {C:attention}destroy{} this joker'
                },
            },
            j_hce_transcendence = {
                name = 'Transcendence',
                text = {
                    [1] = 'Create a {C:tarot}Hanged Man{} card if',
                    [2] = 'no {C:attention}discards{} are used',
                    [3] = 'by the end of the round',
                    [4] = '{C:inactive}(Must have room)'
                },
            },
            j_hce_the_poop = {
                name = 'The Poop',
                text = {
                    [1] = '{C:white,B:1}On Use:{} Creates a random {C:attention}Soiled Card{} in hand',
                    [2] = '{C:white,B:2}Recharge:{} At end of round'
                },
            },
            j_hce_sister_maggy = {
                name = 'Sister Maggy',
                text = {
                    [1] = 'Played cards score {C:chips}+#1#{} Chips',
                    [2] = 'per remaining {C:attention}discard{}',
                },
            },
            j_hce_the_mark = {
                name = 'The Mark',
                text = {
                    [1] = 'Played {C:attention}6s{} score',
                    [2] = '{C:chips}+#1#{} Chips and {C:mult}+#2#{} Mult',
                },
            },
            j_hce_the_small_rock = {
                name = 'The Small Rock',
                text = {
                    [1] = 'Played {C:attention}Stone Cards{}',
                    [2] = 'give {C:mult}+#1#{} mult when scored',
                },
            },
            j_hce_spelunker_hat = {
                name = 'Spelunker Hat',
                text = {
                    [1] = '{C:attention}Stone Cards{} held in hand',
                    [2] = 'earn {C:money}$#1#{} at end of round',
                },
            },
            j_hce_sack_of_pennies = {
                name = 'Sack of Pennies',
                text = {
                    [1] = 'Earn {C:money}$1{} at end of round',
                    [2] = '{C:green}#2# in #3#{} chance for {C:money}$5{} instead',
                    [3] = '{C:green}#4# in #5#{} chance for {C:money}$10{} instead',
                },
            },
            j_hce_robo_baby = {
                name = 'Robo-Baby',
                text = {
                    [1] = 'Played cards score {C:chips}+#1#{} Chips',
                    [2] = 'per {C:attention}Steel Card{} in full deck',
                    [3] = '{C:inactive}(Currently: {C:chips}+#2# {C:inactive}Chips)'
                },
            },
            j_hce_little_steven = {
                name = 'Little Steven',
                text = {
                    [1] = 'Played cards score {C:chips}+#1#{} Chips',
                    [2] = 'per {C:tarot}Tarot{} card used this ante',
                    [3] = '{C:inactive}(Currently: {C:chips}+#3# {C:inactive}Chips)'
                },
            },
            j_hce_the_d6 = {
                name = 'The D6',
                text = {
                    [1] = '{C:white,B:1}On Use:{} Rerolls the {C:attention}leftmost{} joker',
                    [2] = '{s:0.9,C:inactive}(Cannot reroll self)',
                    [3] = '{C:white,B:2}Recharge:{} After clearing ante'
                },
            },
            j_hce_guardian_angel = {
                name = 'Guardian Angel',
                text = {
                    [1] = 'Played cards score {C:chips}+#1#{} Chips',
                    [2] = 'per card {C:attention}held in hand',
                },
            },
            j_hce_demon_baby = {
                name = 'Demon Baby',
                text = {
                    [1] = 'Played cards score {C:chips}+#1#{} Chips',
                    [2] = 'per card {C:attention}destroyed{} this ante',
                    [3] = '{C:inactive}(Currently: {C:chips}+#3# {C:inactive}Chips)'
                },
            },
        --PAGE 2
            j_hce_guppys_tail = {
                name = "Guppy's Tail",
                text = {
                    [1] = 'When entering shop, {C:green}#1# in #2#{} chance',
                    [2] = 'for {C:attention}-#3#{} card slot in shop and',
                    [3] = '{C:attention}+#4#{} Booster Pack slot in shop',
                },
            },
            j_hce_infestation = {
                name = 'Infestation',
                text = {
                    [1] = 'If scoring hand contains',
                    [2] = 'an {C:attention}Infested Card{} another random',
                    [3] = 'scoring card becomes {C:attention}Infested'
                },
            },
            j_hce_mutant_spider = {
                name = 'Mutant Spider',
                text = {
                    [1] = 'This Joker gains {C:mult}+8{} Mult and {C:chips}+8{} Chips if',
                    [2] = 'played hand is a {C:attention}Four of a Kind{}',
                    [3] = '{C:inactive}(Currently {C:mult}+#1#{} {C:inactive}Mult and {C:chips}+#2#{} {C:inactive}Chips)',
                },
            },
            j_hce_ghost_baby = {
                name = 'Ghost Baby',
                text = {
                    [1] = 'Played cards score {C:chips}+#1#{} Chips',
                    [2] = 'per {C:spectral}Spectral{} card used this run',
                    [3] = '{C:inactive}(Currently: {C:chips}+#3# {C:inactive}Chips)'
                },
            },
            j_hce_d20 = {
                name = 'D20',
                text = {
                    [1] = '{C:white,B:1}On Use:{} Rerolls all held {C:attention}consumables',
                    [2] = '{C:white,B:2}Recharge:{} After clearing ante'
                },
            },
            j_hce_harlequin_baby = {
                name = 'Harlequin Baby',
                text = {
                    [1] = 'Played cards score {C:chips}+#1#{} Chips',
                    [2] = 'per {C:attention}Joker{} owned',
                    [3] = '{C:inactive}(Currently: {C:chips}+#2# {C:inactive}Chips)'
                },
            },
            j_hce_rainbow_baby = {
                name = 'Rainbow Baby',
                text = {
                    [1] = 'Played cards score {C:chips}+#1#{} Chips',
                    [2] = 'per unique {C:attention}suit{} in scoring hand',
                },
            },
            j_hce_abel = {
                name = 'Abel',
                text = {
                    [1] = 'Played cards score {C:chips}+#1#{} Chips',
                    [2] = 'per card {C:attention}Lucky Card{} triggered this ante',
                    [3] = '{C:inactive}(Currently: {C:chips}+#3# {C:inactive}Chips)'
                },
            },
        --PAGE 3
            j_hce_pandoras_box = {
                name = "Pandora's Box",
                text = {
                    [1] = "{C:white,B:1}On Use:{} Has a different effect",
                    [2] = "based on the current {C:attention}Ante",
                    [3] = "{C:white,B:2}Single Use"
                },
            },
            j_hce_pandoras_box_ante0 = {
                name = "Pandora's Box",
                text = {
                    [1] = "{C:white,B:1}On Use:{} {C:attention}Ante 0:{} Does nothing...?",
                    [2] = "{C:white,B:2}Single Use"
                },
            },
            j_hce_pandoras_box_ante1 = {
                name = "Pandora's Box",
                text = {
                    [1] = "{C:white,B:1}On Use:{} {C:attention}Ante 1:{} Gain a",
                    [2] = "random {C:spectral}Spectral{} card",
                    [3] = '{s:0.9,C:inactive}(Must have room)',
                    [4] = "{C:white,B:2}Single Use"
                },
            },
            j_hce_pandoras_box_ante2 = {
                name = "Pandora's Box",
                text = {
                    [1] = "{C:white,B:1}On Use:{} {C:attention}Ante 2:{} Gain a random",
                    [2] = "{C:tarot}Tarot{} card and {C:planet}Planet{} card",
                    [3] = '{s:0.9,C:inactive}(Must have room)',
                    [4] = "{C:white,B:2}Single Use"
                },
            },
            j_hce_pandoras_box_ante3 = {
                name = "Pandora's Box",
                text = {
                    [1] = "{C:white,B:1}On Use:{} {C:attention}Ante 3:{} Gain a random",
                    [2] = "{C:attention}editioned{} {C:blue}Common{} Joker",
                    [3] = '{s:0.9,C:inactive}(Must have room)',
                    [4] = "{C:white,B:2}Single Use"
                },
            },
            j_hce_pandoras_box_ante4 = {
                name = "Pandora's Box",
                text = {
                    [1] = "{C:white,B:1}On Use:{} {C:attention}Ante 4:{} Gain a random",
                    [2] = "{C:attention}editioned{} {C:blue}Common{} Joker",
                    [3] = "and a random {C:spectral}Spectral{} card",
                    [4] = '{s:0.9,C:inactive}(Must have room)',
                    [5] = "{C:white,B:2}Single Use"
                },
            },
            j_hce_pandoras_box_ante5 = {
                name = "Pandora's Box",
                text = {
                    [1] = "{C:white,B:1}On Use:{} {C:attention}Ante 5:{} Gain {C:attention}2{}",
                    [2] = "random {C:spectral}Spectral{} cards",
                    [3] = '{s:0.9,C:inactive}(Must have room)',
                    [4] = "{C:white,B:2}Single Use"
                },
            },
            j_hce_pandoras_box_ante6 = {
                name = "Pandora's Box",
                text = {
                    [1] = "{C:white,B:1}On Use:{} {C:attention}Ante 6:{} Gain {C:money}+$20{}",
                    [2] = "{C:white,B:2}Single Use"
                },
            },
            j_hce_pandoras_box_ante7 = {
                name = "Pandora's Box",
                text = {
                    [1] = "{C:white,B:1}On Use:{} {C:attention}Ante 7:{} Gain {C:attention}2{} random",
                    [2] = "{C:attention}editioned{} {C:blue}Common{} Jokers",
                    [3] = '{s:0.9,C:inactive}(Must have room)',
                    [4] = "{C:white,B:2}Single Use"
                },
            },
            j_hce_pandoras_box_ante8 = {
                name = "Pandora's Box",
                text = {
                    [1] = "{C:white,B:1}On Use:{} {C:attention}Ante 8:{} Gain {C:attention}The Bible",
                    [2] = '{s:0.9,C:inactive}(Must have room)',
                    [3] = "{C:white,B:2}Single Use"
                },
            },
            j_hce_pandoras_box_endless = {
                name = "Pandora's Box",
                text = {
                    [1] = "{C:white,B:1}On Use:{} {C:attention}Antes 9+:{} Does nothing.",
                    [2] = "{C:white,B:2}Single Use"
                },
            },
        },
    }
}