path = "__RepairShortcut__"

data:extend({ -- item to spawn
    {
        type = "repair-tool",
        name = "i-infinite-repair-pack",
        icon = path .. "/graphics/not_a_personal_messager_32.png",
        icon_size = 32,
        subgroup = "other",
        order = "b[repair]-b[repair-pack]",
        speed = 3,
        --    durability = 1,
        infinite = true,
        stack_size = 100,
        flags = { "hidden", "spawnable", "only-in-cursor" }
    }
})
data:extend({ -- sound
    {
        type = "sound",
        name = "sound-infinite-repair-pack",
        filename = path .. "/sounds/Sonic_Screw_Driver.ogg",
        volume = 0.2
    }
})
data:extend({
    {
        type = "custom-input",
        name = "give-ci-infinite-repair-pack",
        localised_name = { "shortcut-name.give-s-infinite-repair-pack" },
        key_sequence = "CONTROL + R",
        order = "r",
        action = "lua",
        -- action = "spawn-item",
        -- item_to_spawn = "i-infinite-repair-pack",
    }, {
    type = "shortcut",
    name = "give-s-infinite-repair-pack",
    order = "i[i-infinite-repair-pack]-a[plain]",
    action = "lua",
    -- action = "spawn-item",
    -- item_to_spawn = "i-infinite-repair-pack",
    --   localised_name = {"item-name.i-infinite-repair-pack"},
    --   localised_description = {"item-description.i-infinite-repair-pack"},
    associated_control_input = "give-ci-infinite-repair-pack",
    icon =
    {
        filename = path .. "/graphics/not_a_personal_messager_32.png",
        priority = "extra-high-no-scale",
        size = 32,
        mipmap_count = 2,
        flags = { "gui-icon" }
    }
}
})
