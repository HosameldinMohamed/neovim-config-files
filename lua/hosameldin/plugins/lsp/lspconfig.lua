-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
    return
end

-- import lspconfig.configs plugin safely
local configs_status, configs = pcall(require, "lspconfig.configs")
if not configs_status then
    return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
    return
end

-- import typescript plugin safely
local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
    return
end

-- import navic plugin safely
local navic_setup, navic = pcall(require, "nvim-navic")
if not navic_setup then
    return
end

-- import lsp_signature plugin safely
local signature_setup, signature = pcall(require, "lsp_signature")
if not signature_setup then
    return
end

local icons = require "hosameldin.config.icons"

navic.setup {
    icons = {
        File          = "󰈙 ",
        Module        = " ",
        Namespace     = "󰌗 ",
        Package       = " ",
        Class         = "󰌗 ",
        Method        = "󰆧 ",
        Property      = " ",
        Field         = " ",
        Constructor   = " ",
        Enum          = "󰕘",
        Interface     = "󰕘",
        Function      = "󰊕 ",
        Variable      = "󰆧 ",
        Constant      = "󰏿 ",
        String        = "󰀬 ",
        Number        = "󰎠 ",
        Boolean       = "◩ ",
        Array         = "󰅪 ",
        Object        = "󰅩 ",
        Key           = "󰌋 ",
        Null          = "󰟢 ",
        EnumMember    = " ",
        Struct        = "󰌗 ",
        Event         = " ",
        Operator      = "󰆕 ",
        TypeParameter = "󰊄 ",
    },
    lsp = {
        auto_attach = false,
        preference = nil,
    },
    highlight = false,
    separator = " " .. icons.ui.TriangleRight .. " ",
    depth_limit = 0,
    depth_limit_indicator = "..",
    safe_output = true,
    lazy_update_context = false,
    click = false
}

local keymap = vim.keymap -- for conciseness

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
    -- keybind options
    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- set keybinds
    keymap.set("n", "gf", "<cmd>Lspsaga finder def+ref+imp ++inexist<CR>", opts) -- show definition, references
    keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
    keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts) -- see definition and make edits in window
    keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
    keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
    keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
    keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
    keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
    keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
    keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
    keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
    keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts) -- see outline on right hand side
    -- Floating terminal
    keymap.set({"n", "t"}, "<A-d>", "<cmd>Lspsaga term_toggle<CR>", opts)

    -- typescript specific keymaps (e.g. rename file and update imports)
    if client.name == "tsserver" then
        keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>")
    end

    -- option eneabled for nvim-navic
    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end

    -- functions signature
    signature.on_attach({
        bind = true, -- This is mandatory, otherwise border config won't get registered.
        handler_opts = {
            border = "rounded"
        }
    }, bufnr)

end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- configure html server
lspconfig["html"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- configure typescript server with plugin
typescript.setup({
    server = {
        capabilities = capabilities,
        on_attach = on_attach,
    },
})

-- configure css server
lspconfig["cssls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- configure clangd server
lspconfig["clangd"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- configure pyright server
lspconfig["pyright"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- configure cmake server
lspconfig["cmake"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- configure tailwindcss server
lspconfig["tailwindcss"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- configure marksman server
lspconfig["marksman"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- configure matlab_ls server
lspconfig["matlab_ls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        matlab = {
            indexWorkspace = true,
            installPath = os.getenv("MATLAB_INSTALL_PATH"),
            matlabConnectionTiming = "onStart",
            telemetry = false
        }
    }
})

-- configure qml_lsp server
configs["qml_lsp"] = {
    default_config = {
        cmd = { "/usr/lib/qt6/bin/qmlls" },
        filetypes = { "qmljs" },
        root_dir = function(fname)
            return lspconfig.util.find_git_ancestor(fname)
        end,
        single_file_support = true,
        on_attach = on_attach,
    },
}
lspconfig["qml_lsp"].setup({})

-- configure lua server (with special settings)
lspconfig["lua_ls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = { -- custom settings for lua
    Lua = {
        -- make the language server recognize "vim" global
        diagnostics = {
            globals = { "vim" },
        },
        workspace = {
            -- make language server aware of runtime files
            library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
            },
        },
    },
},
})
