--- STEAMODDED HEADER
--- MOD_NAME: Neow Blessings
--- MOD_ID: NeowBlessings
--- MOD_AUTHOR: [kjossul]
--- MOD_DESCRIPTION: Choose starting blessings, inspired from Slay The Spire.

----------------------------------------------
------------MOD CODE -------------------------
function SMODS.INIT.NeowBlessings()
    sendDebugMessage("Loaded NeowBlessings~")

    local mod_name = "NeowBlessings"
    local sprite_neow = SMODS.Sprite:new(mod_name, SMODS.findModByID(mod_name).path, "j_neow.png", 71, 95, "asset_atli")
    sprite_neow:register()
    G.P_CENTERS.j_neow = {
        order = 0,
        name = "neow",
        set = "",
        config = {},
        pos = { x = 0, y = 0 },
        atlas = mod_name
    }

    G.localization.misc.quips.nb_1 = {"Greetings...", "Choose..."}
    init_localization()

    -- table scraped from the wiki to gather joker effects (not everyone is specified in the source code)
    local joker_effects = {
        ["Joker"] = {effect = "Additive Mult", rarity = "Common"},
        ["Greedy Joker"] = {effect = "Additive Mult", rarity = "Common"},
        ["Lusty Joker"] = {effect = "Additive Mult", rarity = "Common"},
        ["Wrathful Joker"] = {effect = "Additive Mult", rarity = "Common"},
        ["Gluttonous Joker"] = {effect = "Additive Mult", rarity = "Common"},
        ["Jolly Joker"] = {effect = "Additive Mult", rarity = "Common"},
        ["Zany Joker"] = {effect = "Additive Mult", rarity = "Common"},
        ["Mad Joker"] = {effect = "Additive Mult", rarity = "Common"},
        ["Crazy Joker"] = {effect = "Additive Mult", rarity = "Common"},
        ["Droll Joker"] = {effect = "Additive Mult", rarity = "Common"},
        ["Sly Joker"] = {effect = "Chips", rarity = "Common"},
        ["Wily Joker"] = {effect = "Chips", rarity = "Common"},
        ["Clever Joker"] = {effect = "Chips", rarity = "Common"},
        ["Devious Joker"] = {effect = "Chips", rarity = "Common"},
        ["Crafty Joker"] = {effect = "Chips", rarity = "Common"},
        ["Half Joker"] = {effect = "Additive Mult", rarity = "Common"},
        ["Joker Stencil"] = {effect = "Multiplicative Mult", rarity = "Uncommon"},
        ["Four Fingers"] = {effect = "Effect", rarity = "Uncommon"},
        ["Mime"] = {effect = "Retrigger", rarity = "Uncommon"},
        ["Credit Card"] = {effect = "Economy", rarity = "Common"},
        ["Ceremonial Dagger"] = {effect = "Additive Mult", rarity = "Uncommon"},
        ["Banner"] = {effect = "Chips", rarity = "Common"},
        ["Mystic Summit"] = {effect = "Additive Mult", rarity = "Common"},
        ["Marble Joker"] = {effect = "Effect", rarity = "Uncommon"},
        ["Loyalty Card"] = {effect = "Multiplicative Mult", rarity = "Uncommon"},
        ["8 Ball"] = {effect = "Effect", rarity = "Common"},
        ["Misprint"] = {effect = "Additive Mult", rarity = "Common"},
        ["Dusk"] = {effect = "Retrigger", rarity = "Uncommon"},
        ["Raised Fist"] = {effect = "Additive Mult", rarity = "Common"},
        ["Chaos the Clown"] = {effect = "Effect", rarity = "Common"},
        ["Fibonacci"] = {effect = "Additive Mult", rarity = "Uncommon"},
        ["Steel Joker"] = {effect = "Multiplicative Mult", rarity = "Uncommon"},
        ["Scary Face"] = {effect = "Chips", rarity = "Common"},
        ["Abstract Joker"] = {effect = "Additive Mult", rarity = "Common"},
        ["Delayed Gratification"] = {effect = "Economy", rarity = "Common"},
        ["Hack"] = {effect = "Retrigger", rarity = "Uncommon"},
        ["Pareidolia"] = {effect = "Effect", rarity = "Uncommon"},
        ["Gros Michel"] = {effect = "Additive Mult", rarity = "Common"},
        ["Even Steven"] = {effect = "Additive Mult", rarity = "Common"},
        ["Odd Todd"] = {effect = "Chips", rarity = "Common"},
        ["Scholar"] = {effect = "Chips, Additive Mult", rarity = "Common"},
        ["Business Card"] = {effect = "Economy", rarity = "Common"},
        ["Supernova"] = {effect = "Additive Mult", rarity = "Common"},
        ["Ride the Bus"] = {effect = "Additive Mult", rarity = "Common"},
        ["Space Joker"] = {effect = "Upgrade Hand", rarity = "Uncommon"},
        ["Egg"] = {effect = "Economy", rarity = "Common"},
        ["Burglar"] = {effect = "Effect", rarity = "Uncommon"},
        ["Blackboard"] = {effect = "Multiplicative Mult", rarity = "Uncommon"},
        ["Runner"] = {effect = "Chips", rarity = "Common"},
        ["Ice Cream"] = {effect = "Chips", rarity = "Common"},
        ["DNA"] = {effect = "Effect", rarity = "Rare"},
        ["Splash"] = {effect = "Effect", rarity = "Common"},
        ["Blue Joker"] = {effect = "Chips", rarity = "Common"},
        ["Sixth Sense"] = {effect = "Effect", rarity = "Rare"},
        ["Constellation"] = {effect = "Multiplicative Mult", rarity = "Uncommon"},
        ["Hiker"] = {effect = "Chips", rarity = "Uncommon"},
        ["Faceless Joker"] = {effect = "Economy", rarity = "Common"},
        ["Green Joker"] = {effect = "Additive Mult", rarity = "Common"},
        ["Superposition"] = {effect = "Effect", rarity = "Common"},
        ["To Do List"] = {effect = "Economy", rarity = "Common"},
        ["Cavendish"] = {effect = "Multiplicative Mult", rarity = "Common"},
        ["Card Sharp"] = {effect = "Multiplicative Mult", rarity = "Uncommon"},
        ["Red Card"] = {effect = "Additive Mult", rarity = "Common"},
        ["Madness"] = {effect = "Multiplicative Mult", rarity = "Uncommon"},
        ["Square Joker"] = {effect = "Chips", rarity = "Common"},
        ["Seance"] = {effect = "Effect", rarity = "Rare"},
        ["Riff-Raff"] = {effect = "Effect", rarity = "Common"},
        ["Vampire"] = {effect = "Multiplicative Mult", rarity = "Uncommon"},
        ["Shortcut"] = {effect = "Effect", rarity = "Uncommon"},
        ["Hologram"] = {effect = "Multiplicative Mult", rarity = "Uncommon"},
        ["Vagabond"] = {effect = "Effect", rarity = "Uncommon"},
        ["Baron"] = {effect = "Multiplicative Mult", rarity = "Rare"},
        ["Cloud 9"] = {effect = "Economy", rarity = "Uncommon"},
        ["Rocket"] = {effect = "Economy", rarity = "Uncommon"},
        ["Obelisk"] = {effect = "Multiplicative Mult", rarity = "Rare"},
        ["Midas Mask"] = {effect = "Effect", rarity = "Uncommon"},
        ["Luchador"] = {effect = "Effect", rarity = "Uncommon"},
        ["Photograph"] = {effect = "Multiplicative Mult", rarity = "Common"},
        ["Gift Card"] = {effect = "Economy", rarity = "Uncommon"},
        ["Turtle Bean"] = {effect = "Effect", rarity = "Uncommon"},
        ["Erosion"] = {effect = "Additive Mult", rarity = "Uncommon"},
        ["Reserved Parking"] = {effect = "Economy", rarity = "Uncommon"},
        ["Mail-In Rebate"] = {effect = "Economy", rarity = "Common"},
        ["To The Moon"] = {effect = "Economy", rarity = "Uncommon"},
        ["Hallucination"] = {effect = "Effect", rarity = "Common"},
        ["Fortune Teller"] = {effect = "Additive Mult", rarity = "Common"},
        ["Juggler"] = {effect = "Effect", rarity = "Common"},
        ["Drunkard"] = {effect = "Effect", rarity = "Common"},
        ["Stone Joker"] = {effect = "Chips", rarity = "Uncommon"},
        ["Golden Joker"] = {effect = "Economy", rarity = "Common"},
        ["Lucky Cat"] = {effect = "Multiplicative Mult", rarity = "Uncommon"},
        ["Baseball Card"] = {effect = "Multiplicative Mult", rarity = "Rare"},
        ["Bull"] = {effect = "Chips", rarity = "Uncommon"},
        ["Diet Cola"] = {effect = "Effect", rarity = "Uncommon"},
        ["Trading Card"] = {effect = "Economy", rarity = "Uncommon"},
        ["Flash Card"] = {effect = "Additive Mult", rarity = "Uncommon"},
        ["Popcorn"] = {effect = "Additive Mult", rarity = "Common"},
        ["Spare Trousers"] = {effect = "Additive Mult", rarity = "Uncommon"},
        ["Ancient Joker"] = {effect = "Multiplicative Mult", rarity = "Rare"},
        ["Ramen"] = {effect = "Multiplicative Mult", rarity = "Uncommon"},
        ["Walkie Talkie"] = {effect = "Chips, Additive Mult", rarity = "Common"},
        ["Seltzer"] = {effect = "Retrigger", rarity = "Uncommon"},
        ["Castle"] = {effect = "Chips", rarity = "Uncommon"},
        ["Smiley Face"] = {effect = "Additive Mult", rarity = "Common"},
        ["Campfire"] = {effect = "Multiplicative Mult", rarity = "Rare"},
        ["Golden Ticket"] = {effect = "Economy", rarity = "Common"},
        ["Mr. Bones"] = {effect = "Effect", rarity = "Uncommon"},
        ["Acrobat"] = {effect = "Multiplicative Mult", rarity = "Uncommon"},
        ["Sock and Buskin"] = {effect = "Retrigger", rarity = "Uncommon"},
        ["Swashbuckler"] = {effect = "Effect", rarity = "Common"},
        ["Troubadour"] = {effect = "Effect", rarity = "Uncommon"},
        ["Certificate"] = {effect = "Effect", rarity = "Uncommon"},
        ["Smeared Joker"] = {effect = "Effect", rarity = "Uncommon"},
        ["Throwback"] = {effect = "Multiplicative Mult", rarity = "Uncommon"},
        ["Hanging Chad"] = {effect = "Retrigger", rarity = "Common"},
        ["Rough Gem"] = {effect = "Economy", rarity = "Uncommon"},
        ["Bloodstone"] = {effect = "Multiplicative Mult", rarity = "Uncommon"},
        ["Arrowhead"] = {effect = "Chips", rarity = "Uncommon"},
        ["Onyx Agate"] = {effect = "Additive Mult", rarity = "Uncommon"},
        ["Glass Joker"] = {effect = "Multiplicative Mult", rarity = "Uncommon"},
        ["Showman"] = {effect = "Effect", rarity = "Uncommon"},
        ["Flower Pot"] = {effect = "Multiplicative Mult", rarity = "Uncommon"},
        ["Blueprint"] = {effect = "Effect", rarity = "Rare"},
        ["Wee Joker"] = {effect = "Chips", rarity = "Rare"},
        ["Merry Andy"] = {effect = "Effect", rarity = "Uncommon"},
        ["Oops! All 6s"] = {effect = "Effect", rarity = "Uncommon"},
        ["The Idol"] = {effect = "Multiplicative Mult", rarity = "Uncommon"},
        ["Seeing Double"] = {effect = "Multiplicative Mult", rarity = "Uncommon"},
        ["Matador"] = {effect = "Economy", rarity = "Uncommon"},
        ["Hit the Road"] = {effect = "Multiplicative Mult", rarity = "Rare"},
        ["The Duo"] = {effect = "Multiplicative Mult", rarity = "Rare"},
        ["The Trio"] = {effect = "Multiplicative Mult", rarity = "Rare"},
        ["The Family"] = {effect = "Multiplicative Mult", rarity = "Rare"},
        ["The Order"] = {effect = "Multiplicative Mult", rarity = "Rare"},
        ["The Tribe"] = {effect = "Multiplicative Mult", rarity = "Rare"},
        ["Stuntman"] = {effect = "Chips", rarity = "Uncommon"},
        ["Invisible Joker"] = {effect = "Effect", rarity = "Rare"},
        ["Brainstorm"] = {effect = "Effect", rarity = "Rare"},
        ["Satellite"] = {effect = "Economy", rarity = "Uncommon"},
        ["Shoot the Moon"] = {effect = "Additive Mult", rarity = "Common"},
        ["Driver's License"] = {effect = "Multiplicative Mult", rarity = "Rare"},
        ["Cartomancer"] = {effect = "Effect", rarity = "Uncommon"},
        ["Astronomer"] = {effect = "Effect", rarity = "Uncommon"},
        ["Burnt Joker"] = {effect = "Upgrade Hand", rarity = "Uncommon"},
        ["Bootstraps"] = {effect = "Additive Mult", rarity = "Uncommon"},
        ["Canio"] = {effect = "Multiplicative Mult", rarity = "Legendary"},
        ["Triboulet"] = {effect = "Multiplicative Mult", rarity = "Legendary"},
        ["Yorick"] = {effect = "Multiplicative Mult", rarity = "Legendary"},
        ["Chicot"] = {effect = "Effect", rarity = "Legendary"},
        ["Perkeo"] = {effect = "Effect", rarity = "Legendary"},
    }    

    local blessings = {
        {
            desc = "Get a common mult Joker",
            f = function()
                create_joker("Mult", 0)
                G.FUNCS:exit_overlay_menu()
            end
        },
        {
            desc = "Get a common chips Joker",
            f = function()
                create_joker("Chips", 0)
                G.FUNCS:exit_overlay_menu()
            end
        },
        {
            desc = "Get an uncommon Joker",
            f = function()
                create_joker(nil, 0.8)  -- (rarity > 0.95 and 3) or (rarity > 0.7 and 2) or 1
                G.FUNCS:exit_overlay_menu()
            end
        },
        {
            desc = "Get $10",
            f = function()
                G.GAME.dollars = G.GAME.dollars + 10
                G.FUNCS:exit_overlay_menu()
            end
        },
        {
            desc = "Open a Mega Arcana pack",
            f = function()
                create_booster('arcana', 'mega')
                G.FUNCS:exit_overlay_menu()
            end
        },
        {
            desc = "Open a Mega Celestial pack",
            f = function()
                create_booster('celestial', 'mega')
                G.FUNCS:exit_overlay_menu()
            end
        },
        {
            desc = "Open a Spectral pack",
            f = function()
                create_booster('spectral', 'normal')
                G.FUNCS:exit_overlay_menu()
            end
        },
        {
            desc = "Open a Mega Standard pack",
            f = function()
                create_booster('standard', 'mega')
                G.FUNCS:exit_overlay_menu()
            end
        },
        {
            desc = "Open a Jumbo Buffoon pack",
            f = function()
                create_booster('buffoon', 'jumbo')
                G.FUNCS:exit_overlay_menu()
            end
        },          
    }

    function create_joker(effect, rarity)
        pool, pool_key = get_current_pool('Joker', rarity)
        choices = {}
        for k,v in pairs(pool) do
            if G.P_CENTERS[v] then
                joker = joker_effects[G.P_CENTERS[v].name]
                if joker and (not effect or string.match(joker.effect, effect)) then
                    table.insert(choices, v)
                end
            end
        end
        key = pseudorandom_element(choices, pseudoseed(mod_name))
        local card = create_card('Joker', G.jokers, nil, 0, nil, nil, key, nil)
        card:add_to_deck()
        G.jokers:emplace(card)
        card:start_materialize()
        G.GAME.used_jokers[key] = true       
    end

    function create_booster(tag, type)
        local key = 'p_' .. tag .. '_' .. type .. '_1'
        local card = Card(G.play.T.x + G.play.T.w/2 - G.CARD_W*1.27/2,
        G.play.T.y + G.play.T.h/2-G.CARD_H*1.27/2, G.CARD_W*1.27, G.CARD_H*1.27, G.P_CARDS.empty, G.P_CENTERS[key], {bypass_discovery_center = true, bypass_discovery_ui = true})
        card.cost = 0
        G.FUNCS.use_card({config = {ref_table = card}})
        card:start_materialize()
    end

    function random_n(n, i, j)
        local result = {}
        local temp = setmetatable({}, { __index = function( _, i ) return i end })  -- helper table with index = value
        for k = 1, n do
          -- swap first element in range with randomly selected element in range
          local idx = math.random(i, j)
          local v = temp[idx]
          temp[idx] = temp[i]
          result[k] = v
          i = i + 1 -- first element in range is fixed from now on
        end
        return result
    end

    function replace_jimbo_sprite()
        -- remove old Jimbo
        jimbo = G.BLESSINGS_JIMBO
        jimbo.children.card:remove()
        jimbo.children.card = Card(jimbo.T.x, jimbo.T.y, G.CARD_W, G.CARD_H, G.P_CARDS.empty, G.P_CENTERS.j_neow, {bypass_discovery_center = true})
        jimbo.children.card.states.visible = false
        jimbo.children.card:start_materialize({G.C.BLUE, G.C.WHITE, G.C.RED})
        jimbo.children.card:set_alignment{
            major = jimbo, type = 'cm', offset = {x=0, y=0}
        }
        jimbo.children.card.jimbo = jimbo
        jimbo.children.card.states.collide.can = true
        jimbo.children.card.states.focus.can = false
        jimbo.children.card.states.hover.can = true
        jimbo.children.card.states.drag.can = false
        jimbo.children.card.hover = Node.hover
    end

    function create_blessings_overlay(forced_blessing_index)
        buttons = {}
        blessings_indexes = random_n(4, 1, #blessings)
        for i=1, 4 do 
            -- forced blessing index useful to debug blessing functions during development, otherwise pick at random
            j = forced_blessing_index and forced_blessing_index or blessings_indexes[i]
            buttons[i] = UIBox_button{label = {blessings[j].desc}, button = 'blessing_' .. i, minw = 8}
            G.FUNCS['blessing_' .. i] = blessings[j].f
        end
        
        G.FUNCS.overlay_menu{
            definition = createNeowBox(),
            config = {no_esc = true}
        }
        
    end

    -- Custom function to create two separate elements on the overlay menu, the box containing the blessings options and the Neow card
    function createNeowBox()
        -- todo: add exit button? or maybe remove the no_back flag. I personally prefer it without but let's see others opinion on this.
        t =  create_UIBox_generic_options({ contents = buttons, no_back=true})
        t.nodes[1] = {n=G.UIT.R, config={align = "cm", padding = 0.1}, nodes={

            -- First, the blessings box
            {n=G.UIT.C, config={align = "tm", padding = 0.3}, nodes={ {n=G.UIT.R, config={align = "cm"}, 
                nodes={
                    {n=G.UIT.O,
                    -- todo: create localization strings
                    config={object = DynaText({string = {"Choose your blessing"}, colours = {G.C.MONEY},shadow = true, float = true, scale = 1.5, pop_in = 0.4, maxw = 6.5})}
                    }}},t.nodes[1]}}, 

            -- Second, Neow card
            {n=G.UIT.C, config={align = "cm", padding = 1}, nodes={
                {n=G.UIT.R, config={align = "cm"}, nodes={
                    {n=G.UIT.O, config={padding = 0, id = 'jimbo_spot', object = Moveable(0,0,G.CARD_W*1.1, G.CARD_H*1.1)}},
                }}, 
            }}
            }
        }
        return t
    end

    function draw_blessings_overlay()
        G.SETTINGS.paused = true
        create_blessings_overlay()
        
        table.insert(G.I.POPUP, G.BLESSINGS_JIMBO)
        table.insert(G.OVERLAY_MENU.children, G.BLESSINGS_JIMBO)

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.5,
            func = function()
                G.CONTROLLER.interrupt.focus = true
                G.BLESSINGS_JIMBO = Card_Character({x = 0, y = 5})
                local spot = G.OVERLAY_MENU:get_UIE_by_ID('jimbo_spot')
                spot.config.object:remove()
                spot.config.object = G.BLESSINGS_JIMBO
                replace_jimbo_sprite()
                G.BLESSINGS_JIMBO.ui_object_updated = true
                G.BLESSINGS_JIMBO:add_speech_bubble("nb_1", "tm", {quip=true})
                G.BLESSINGS_JIMBO:say_stuff(5)

                return true
            end
        }))
    end

    local game_start_run_ref = Game.start_run
    function Game.start_run(self, args)
        result = game_start_run_ref(self, args)
        if not args.savetext then  -- it's a new game
            draw_blessings_overlay()
        end
        return result
    end
end
----------------------------------------------
------------MOD CODE END----------------------