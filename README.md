# neovim-config-files

My setup files for [Neovim](https://neovim.io/)

# Install

Install the following packages:

- `neovim`.

Dependencies for some packages:

- `Nerd Fonts`.
- `ripgrep`.

LSP servers for some languages:

- `lua-language-server`.
- `clangd`.
- `cmake-languager-server`.
- `pyright`.

Make a backup of the current nvim folder if exists

```bash
mv ~/.config/nvim ~/.config/nvimbackup
```

Clone the repository

```bash
git clone https://github.com/HosameldinMohamed/neovim-config-files.git ~/.config/nvim
nvim +PackerSync
```

# Thanks

I followed the [YouTube tutorial](https://www.youtube.com/watch?v=vdn_pKJUda8) done by @josean-dev

Code repo: https://github.com/josean-dev/dev-environment-files
