vim.filetype.add({
    extension = {
        qml = "qmljs",
        qmltypes = "qmljs",
        qmlproject = "qmljs",
        qrc = "xml",
        -- conf = "dosini",
        -- service = "dosini",
        -- ini = "dosini",
        -- timer = "dosini",
        -- vala = "vala",
        -- vapi = "vala",
        -- tex = "tex",
        -- mpp = "cpp",
        -- slint = "slint",
        -- qss = "css",
        -- agda = "agda",
        -- dox = "doxygen",
        -- pam = "dosini",
        -- gyp = "jsonc",
        -- vert = "glsl",
        -- frag = "glsl",
        -- rkt = "racket",
        urdf = "xml",
        scxml = "xml",
    },
    filename = {
        -- environment = "dosini",
        -- grub = "dosini",
        -- ufw = "dosini",
        qmldir = "qmljs",
        -- [".clang-format"] = "yaml",
        -- [".gitignore"] = "gitignore",
    },
    -- pattern = {
    --     ["environment.*"] = "dosini",
    --     ["grub.*"] = "dosini",
    -- },
})
