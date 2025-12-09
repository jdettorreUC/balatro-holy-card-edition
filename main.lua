SMODS.current_mod.optional_features = {
    cardareas = {
        discard = true,
        deck = true
    }
}

SMODS.ConsumableType {
    key = "Pills",
    primary_colour = HEX("C93636"),
    secondary_colour = HEX("D45D5D"),
    shop_rate = 4,
    loc_txt = {
        name = "Pills",
        collection = "Pill Cards",
    }
}

SMODS.Sound:register_global()

assert(SMODS.load_file('hooks_and_helpers.lua'))()
assert(SMODS.load_file('content/enhancements.lua'))()
assert(SMODS.load_file('content/jokers/page1.lua'))()
assert(SMODS.load_file('content/jokers/page2.lua'))()
assert(SMODS.load_file('content/jokers/page3.lua'))()
assert(SMODS.load_file('content/consumables/reverse_tarots.lua'))()
assert(SMODS.load_file('content/consumables/pills.lua'))()