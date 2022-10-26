require("neo-tree").setup({
    close_if_last_window = true,
    name = {
        trailing_slash = true,
    } ,
    filesystem = {
        filtered_items = {
            always_show = {
                ".gitignore",
            }
        }
    }
})
