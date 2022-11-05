require("neo-tree").setup({
    close_if_last_window = true,
    name = {
        trailing_slash = true,
    } ,
    filesystem = {
        filtered_items = {
            bo = {
                buftype = {
                    "terminal",
                    "quickfix",
                },
            },
            always_show = {
                ".gitignore",
            }
        }
    }
})
