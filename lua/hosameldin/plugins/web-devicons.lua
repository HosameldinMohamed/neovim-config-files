-- import web-devicons plugin safely
local status, web_devicons = pcall(require, "nvim-web-devicons")
if not status then
    return
end

web_devicons.setup {
    strict = true;
    -- same as `override` but specifically for overrides by filename
    -- takes effect when `strict` is true
    override_by_filename = {
        [".gitignore"] = {
            icon = "󰊢",
            color = "#f1502f",
            name = "Gitignore"
        },
        [".gitattributes"] = {
            icon = "󰊢",
            color = "#006d07",
            name = "Gitattributes"
        },
    };
    -- same as `override` but specifically for overrides by extension
    -- takes effect when `strict` is true
    override_by_extension = {
        ["m"] = {
            icon = "󰘨",
            color = "#ff7614",
            name = "matlab"
        },
        ["yml"] = {
            icon = "",
            color = "#a074c4",
            name = "yaml"
        },
        ["urdf"] = {
            icon = "",
            color = "#e37933",
            name = "urdf"
        },
        ["tex"] = {
            icon = "󰙩",
            color = "#f3c333",
            name = "tex"
        },
    };
}
