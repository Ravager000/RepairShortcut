path = "__RepairShortcut__"

data:extend({ -- item to spawn
    {
        type = "repair-tool",
        name = "s-infinite-repair-pack",
        icon = path .. "/graphics/not_a_personal_messager_32.png",
        icon_size = 32,
        subgroup = "tool",
        order = "b[repair]-b[repair-pack]",
        speed = 3,
        --    durability = 1,
        infinite = true,
        stack_size = 1,
        flags = { "hidden", "spawnable", "not-stackable", "only-in-cursor" }
    }
})

data:extend({
    {
        type = "shortcut",
        name = "give-s-infinite-repair-pack",
        order = "i[s-infinite-repair-pack]-a[plain]",
        action = "spawn-item",
        item_to_spawn = "s-infinite-repair-pack",
        --   localised_name = {"item-name.s-infinite-repair-pack"},
        --   localised_description = {"item-description.s-infinite-repair-pack"},
        --  associated_control_input = "give-s-infinite-repair-pack",

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
