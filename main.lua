SMODS.current_mod.optional_features = {
    cardareas = {
        discard = true,
        deck = true
    }
}

SMODS.Sound:register_global()

assert(SMODS.load_file('hooks_and_helpers.lua'))()
assert(SMODS.load_file('content/enhancements.lua'))()
assert(SMODS.load_file('content/jokers/page1.lua'))()
assert(SMODS.load_file('content/jokers/page2.lua'))()
assert(SMODS.load_file('content/jokers/page3.lua'))()
assert(SMODS.load_file('content/consumables/reverse_tarots.lua'))()