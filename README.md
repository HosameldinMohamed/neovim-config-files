# neovim-config-files

My setup files for [Neovim](https://neovim.io/).

# Install

Install the following packages:

- `neovim`.

Dependencies for some plugins:

- `Nerd Fonts`.
- `ripgrep`.
- `lazygit`.

LSP servers for some languages:

- `lua-language-server`.
- `clangd`.
- `cmake-languager-server`.
- `pyright`.
- `qml-lsp` (`qt6-languageserver`).

Also `npm` package manager for [`Mason`](https://github.com/williamboman/mason.nvim) to automatically download and install LSP servers and linters.

Make a backup of the current nvim folder if exists

```bash
mv ~/.config/nvim ~/.config/nvimbackup
```

Clone the repository

```bash
git clone https://github.com/HosameldinMohamed/neovim-config-files.git ~/.config/nvim
nvim +PackerSync
```

### Notes

- When running on `Xorg`, you need to install `xclip` for clipboard synching.
- When running on `Wayland`, you need to install `wl-clipboard` for clipboard synching.
- For MATLAB LSP you need to set the environment variable `$MATLAB_INSTALL_PATH` with the location of MATLAB installation.

# Thanks

I followed the [YouTube tutorial](https://www.youtube.com/watch?v=vdn_pKJUda8) done by @josean-dev

Code repo: https://github.com/josean-dev/dev-environment-files
