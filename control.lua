local function on_give_infiniterepair(event)
    local player = game.get_player(event.player_index)
    if not player or not player.valid then return end

    if remote.interfaces["space-exploration"] and remote.interfaces["space-exploration"]["remote_view_is_unlocked"] and
        remote.call("space-exploration", "remote_view_is_active", { player = player }) then
        return
    end

    local cleared = player.clear_cursor() -- Returns items to inventory
    if not cleared then return end

    --local inventory = player.get_main_inventory()
    -- if not inventory or not inventory.valid then return end
    local cursor_stack = player.cursor_stack
    -- local oldstack = inventory.find_item_stack("s-infinite-repair-pack")
    -- if oldstack then
    --	cursor_stack.swap_stack(oldstack);
    -- else
    cursor_stack.set_stack({ name = "i-infinite-repair-pack", count = 100 })
    -- end
    player.surface.play_sound { path = "sound-infinite-repair-pack", position = player.position }
    player.create_local_flying_text {
        text = { "item-name." .. "i-infinite-repair-pack" },
        create_at_cursor = true,
    }
end

script.on_event("give-ci-infinite-repair-pack", on_give_infiniterepair)

script.on_event(defines.events.on_lua_shortcut, function(event)
    if event.prototype_name == "give-s-infinite-repair-pack" then
        on_give_infiniterepair(event)
    end
end)

script.on_event(defines.events.on_player_main_inventory_changed, function(event)
    local player = game.get_player(event.player_index)
    if not player or not player.valid then return end
    local inventory = player.get_main_inventory()
    if not inventory or not inventory.valid then return end
    local stolenstack = inventory.find_item_stack("i-infinite-repair-pack")
    if stolenstack then
        stolenstack.clear()
    end
end)
