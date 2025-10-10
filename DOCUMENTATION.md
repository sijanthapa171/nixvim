# NixVim Configuration Documentation

A comprehensive Neovim configuration built with Nixvim, featuring modern development tools and a sleek interface.

## Table of Contents

- [Overview](#overview)
- [Installation](#installation)
- [Core Configuration](#core-configuration)
- [Themes](#themes)
- [Plugins](#plugins)
  - [Editor Enhancements](#editor-enhancements)
  - [Language Support](#language-support)
  - [Navigation & Search](#navigation--search)
  - [Development Tools](#development-tools)
  - [UI Components](#ui-components)
- [Key Mappings](#key-mappings)
- [Project Structure](#project-structure)
- [Development Setup](#development-setup)

## Overview

This is a modern Neovim configuration built using Nixvim, providing a complete IDE experience with:

- **Multi-language support**: Rust, Python, C/C++, Go, JavaScript/TypeScript, Nix, and more
- **Advanced debugging**: Integrated DAP support for multiple languages
- **Smart navigation**: Telescope, Hop, Flash for quick movement
- **Beautiful UI**: Catppuccin theme with customized statusline and bufferline
- **Git integration**: Gitsigns and Lazygit integration
- **Project management**: Automatic project detection and workspace management

## Installation

### Run Directly
```bash
nix run github:sijanthapa171/nixvim
```

### Install on NixOS

1. Add to your `flake.nix`:
```nix
{
  inputs = {
    nixvim.url = "github:sijanthapa171/nixvim";
  };
}
```

2. Add to your home-manager configuration:
```nix
{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    inputs.nixvim.packages.${system}.default
  ];
}
```

## Core Configuration

### Options (`config/core/options.nix`)

The configuration includes sensible defaults for modern Neovim usage:

- **Line numbers**: Hybrid line numbers (absolute + relative)
- **Indentation**: 2 spaces, smart indenting enabled
- **Search**: Smart case-sensitive search with highlighting
- **Splits**: Natural split behavior (below/right)
- **Folding**: UFO-compatible fold settings
- **Performance**: Optimized `updatetime` and completion options

### Key Features

- **Leader key**: Space (`<Space>`)
- **Clipboard**: Unified with system clipboard
- **Auto-commands**: Smart file type detection and behavior
- **Session management**: Persistent sessions with `persistence.nvim`

## Themes

### Current Theme: Catppuccin Mocha

Located in `config/themes/catppuccin.nix`, provides:

- **Flavour**: Mocha (dark theme)
- **Transparent background**: Enabled
- **Integrations**: Extensive plugin support including:
  - Telescope
  - Treesitter
  - LSP with inlay hints
  - Git signs
  - Completion menu
  - And many more

### Alternative Themes

- **OneDark** (`onedark.nix`): Modern dark theme with treesitter support
- **Base16 Radium** (`base16-radium.nix`): Custom color scheme with material design

## Plugins

### Editor Enhancements

#### Treesitter (`config/plugins/treesitter.nix`)
- **Syntax highlighting** for 20+ languages
- **Smart text objects** and incremental selection
- **Folding** support (disabled by default)

Supported languages:
```nix
[ nix bash cmake make python rust c c_sharp cpp regex 
  gitcommit gitignore markdown json lua toml yaml zig ]
```

#### Completion (`config/plugins/cmp.nix`)
- **nvim-cmp**: Intelligent completion engine
- **Sources**: LSP, snippets, buffer, path, Lua, crates
- **Luasnip**: Snippet engine integration
- **Smart mapping**: Tab/Enter to confirm, Ctrl+J/K to navigate

#### Auto-pairs & Comments
- **nvim-autopairs**: Automatic bracket/quote pairing
- **Comment.nvim**: Smart commenting with `gcc`, `gbc`, `gc`, `gb`

### Language Support

#### LSP Configuration (`config/plugins/lsp.nix`)

Comprehensive language server support:

| Language | Server | Features |
|----------|--------|----------|
| Rust | rust_analyzer | Full Rust support with cargo integration |
| Python | pyright | Type checking and IntelliSense |
| C/C++ | clangd | Modern C++ support |
| Go | gopls | Full Go language support |
| JavaScript/TypeScript | ts_ls | Modern JS/TS support |
| Nix | nil_ls | Nix language support |
| Lua | lua_ls | Lua with Neovim API |
| Bash | bashls | Shell scripting support |
| CMake | cmake | Build system support |
| C# | csharp_ls | .NET development |
| JSON | jsonls | JSON schema validation |
| YAML | yamlls | YAML support |
| Markdown | marksman | Markdown language server |

#### Formatting (`config/plugins/format.nix`)

**Conform.nvim** handles formatting with language-specific formatters:

- **Rust**: rustfmt
- **Python**: isort + black
- **C/C++**: astyle
- **JavaScript/TypeScript**: prettier
- **Nix**: alejandra
- **Go**: goimports + gofumpt + golines
- **Lua**: stylua
- **And many more**

Key mapping: `<leader>fm` to format current buffer

#### Linting (`config/plugins/lint.nix`)

**nvim-lint** provides real-time linting:

- **Python**: ruff
- **C/C++**: clangtidy
- **Go**: golangci-lint
- **Lua**: luacheck
- **JSON**: jsonlint
- **YAML**: yamllint
- **Nix**: nix (built-in linter)
- **Git commits**: commitlint
- **Markdown**: markdownlint

Auto-linting on buffer events (enter, write, insert leave)

### Navigation & Search

#### Telescope (`config/plugins/telescope.nix`)

Fuzzy finder with extensive functionality:

**Core mappings**:
- `<leader><space>` / `<leader>ff`: Find files
- `<leader>/` / `<leader>fg`: Live grep
- `<leader>fb`: Buffer switcher
- `<leader>fr`: Recent files
- `<C-p>`: Git files

**Git integration**:
- `<leader>gc`: Git commits
- `<leader>gs`: Git status

**Search utilities**:
- `<leader>sk`: Keymaps
- `<leader>sh`: Help tags
- `<leader>sc`: Command history
- `<leader>cs`: Colorscheme preview

#### Hop (`config/plugins/hop.nix`)

EasyMotion-like navigation:
- `<leader>hw`: Hop to words
- `<leader>hc`: Hop to character pairs
- `<leader>hl`: Hop to lines
- `<leader>f`/`<leader>F`: Forward/backward character search
- `<leader>t`/`<leader>T`: Till character search

#### Flash (`config/plugins/flash.nix`)

Modern navigation plugin (alternative to Hop):
- `s`: Flash jump
- `S`: Flash Treesitter
- `r`: Remote Flash (operator mode)
- `R`: Treesitter Search

### Development Tools

#### Debugging (`config/plugins/dap.nix`)

**Debug Adapter Protocol** support for multiple languages:

**Supported debuggers**:
- **Rust**: codelldb
- **Python**: debugpy (via dap-python)
- **Go**: delve (via dap-go)
- **C/C++**: gdb, lldb, codelldb
- **Zig**: lldb

**Key mappings**:
- `<F5>`: Start/continue debugging
- `<S-F5>` / `<F17>`: Terminate debugging
- `<F10>`: Step over
- `<F11>`: Step into
- `<F12>`: Step out
- `<leader>b`: Toggle breakpoint
- `<leader>dt`: Toggle DAP UI

**Smart debugging**:
- Auto-closes file explorer and terminals when debugging starts
- Automatic DAP UI management
- Language-specific configurations

#### Git Integration (`config/plugins/git.nix`)

**Gitsigns** provides:
- **Current line blame**: Shows git blame inline
- **Change indicators**: Visual indicators for added/modified/deleted lines
- **Trouble integration**: Error and diagnostic display

**Lazygit integration**:
- `<leader>gg`: Open Lazygit in tmux window

### UI Components

#### Dashboard (`config/plugins/alpha.nix`)

Beautiful start screen with ASCII art and quick actions:
- **File operations**: New, find, recent files
- **Search**: Live grep across project
- **Session**: Restore previous session
- **Quick quit**: Exit Neovim

#### Bufferline (`config/plugins/bufferline.nix`)

Tab-like buffer management:
- `<S-h>` / `<S-l>`: Navigate between buffers
- `<leader>bo`: Close other buffers
- `<leader>bl` / `<leader>br`: Close left/right buffers
- `<leader>bp`: Toggle pin buffer
- **Visual indicators**: Modified, close icons, ordinal numbers

#### Lualine (`config/plugins/lualine.nix`)

Minimalist statusline with:
- **Global statusline**: Single line across all windows
- **Extensions**: nvim-tree, DAP UI, toggleterm, quickfix
- **Clean design**: Minimal separators and components

#### File Explorer (`config/plugins/nvimtree.nix`)

**nvim-tree** configuration:
- `<C-n>`: Toggle file explorer
- **Smart behavior**: Syncs with current working directory
- **Git integration**: Shows git status indicators
- **Auto-close**: Closes when file is opened

#### Terminal (`config/plugins/toggleterm.nix`)

**Toggleterm** for integrated terminal:
- `<M-f>`: Toggle floating terminal
- **Floating window**: Rounded borders, optimized size
- **Auto-insert**: Starts in insert mode
- **Directory sync**: Opens in current directory

### Additional Plugins

#### Folding (`config/plugins/ufo.nix`)

**nvim-ufo** for modern folding:
- **Providers**: LSP + indent based folding
- **Custom fold text**: Shows fold icon and line count
- **Keymaps**: `zR` (open all), `zM` (close all), `zK` (peek fold)

#### Cursor Enhancement (`config/plugins/cursorline.nix`)

**Cursorline** plugin:
- **Visual feedback**: Highlights current line and word under cursor
- **Smart timing**: Immediate activation
- **Line numbers**: Enhanced current line number display

#### Notifications (`config/plugins/noice.nix`)

**Noice** for better UI messages:
- **Command line**: Enhanced command palette
- **LSP progress**: Clean progress indicators
- **Popup menu**: Improved completion menu
- **Message filtering**: Smart message handling

#### Status Column (`config/plugins/statuscol.nix`)

**statuscol.nvim** for enhanced gutter:
- **Fold indicators**: Visual fold markers
- **Sign column**: Git signs and diagnostics
- **Line numbers**: Clickable line numbers with relative numbering

#### Project Management (`config/plugins/project.nix`)

**project.nvim** for workspace detection:
- **Smart detection**: Uses LSP, patterns, and markers
- **Telescope integration**: Quick project switching
- **Pattern matching**: Supports various project file types

#### Markdown Support (`config/plugins/markdown.nix`)

**markdown-preview** for live preview:
- **Auto-close**: Closes preview when buffer closes
- **Dark theme**: Matches editor theme
- **Port configuration**: Uses port 8080

#### Discord Presence (`config/plugins/presence.nix`)

**presence.nvim** for Discord Rich Presence:
- Shows current file and project in Discord
- Custom plugin build from specific commit

### WakaTime — time tracking for your coding

This configuration includes the WakaTime plugin and installs the `wakatime-cli` so Neovim can report editing activity to your WakaTime account.

Where to put your API key

- Option A — `~/.wakatime.cfg` (recommended)
  1. Create `~/.wakatime` directory if it doesn't exist and open the config file (you already edited `~/.wakatime/wakatime-internal.cfg`):

     ```bash
     mkdir -p ~/.wakatime
     nvim ~/.wakatime/wakatime.cfg
     ```

  2. Add your API key in the file in this format:

     ```ini
     [settings]
     api_key = YOUR_API_KEY_HERE
     ```

- Option B — environment variable (useful for ephemeral environments / CI)

  Export your key in your shell profile (`~/.profile`, `~/.zshenv`, or your systemd/user unit):

  ```bash
  export WAKATIME_API_KEY=your_api_key_here
  ```

  If you use `direnv` or other environment managers, make sure the variable is loaded into your Neovim environment.

Enabling and verifying in this Nix setup

- The plugin module is `config/plugins/wakatime.nix` and is imported by `config/plugins/default.nix`.
- The CLI is added to `extraPackages` in `config/default.nix` as `wakatime-cli`. Rebuild/activate your Home Manager or system configuration so the binary becomes available:

```bash
# If using home-manager with flakes
nix run .#homeConfigurations.$(hostname)-x86_64-linux.activationPackage -- show
# Or rebuild your system / user config as appropriate (example):
# home-manager switch
```

Quick test

- Open Neovim and edit a file. The plugin should call the CLI and create/update `~/.wakatime/wakatime.db` and `~/.wakatime/wakatime.log`.
- You can run the CLI manually to verify it can reach the API:

```bash
wakatime --version
wakatime --logfile ~/.wakatime/wakatime.log --status
```

Troubleshooting

- If nothing appears in your WakaTime dashboard:
  - Verify the API key (no extra spaces/newlines) in `~/.wakatime/wakatime.cfg` or `WAKATIME_API_KEY`.
  - Check `~/.wakatime/wakatime.log` for errors.
  - Ensure the `wakatime-cli` binary is in PATH (rebuild your Nix/home-manager if necessary).
  - If Neovim runs in a different environment (GUI, systemd unit, or as a different user), make sure the environment variable or config file is reachable by that process.

Security note

- Treat your WakaTime API key like a secret. Prefer storing it in `~/.wakatime/wakatime.cfg` with file permissions set to user-only (chmod 600), or inject via secure environment mechanisms.


## Key Mappings

### Global Leader: `<Space>`

### File Operations
| Key | Action | Description |
|-----|--------|-------------|
| `<C-s>` | Save | Save current file |
| `<leader>qq` | Quit all | Exit Neovim |
| `<leader>fy` | Yank file | Copy entire file content |
| `<leader>fp` | Paste file | Replace file with clipboard |

### Buffer Management
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>bd` | Delete buffer | Close current buffer |
| `<S-h>` / `<S-l>` | Buffer navigation | Previous/next buffer |
| `<leader>bo` | Close others | Close all other buffers |

### Window Navigation
| Key | Action | Description |
|-----|--------|-------------|
| `<C-h/j/k/l>` | Window navigation | Move between windows |

### Text Editing
| Key | Action | Description |
|-----|--------|-------------|
| `<A-j/k>` | Move lines | Move current line up/down |
| `K/J` (visual) | Move selection | Move selected text up/down |
| `<leader>sr` | Search replace | Regex replace word under cursor |

### LSP
| Key | Action | Description |
|-----|--------|-------------|
| `gd` | Go to definition | Jump to symbol definition |
| `gi` | Go to implementation | Jump to implementation |
| `gr` | Go to references | Show all references |
| `K` | Hover documentation | Show symbol information |
| `<leader>ca` | Code action | Show available code actions |
| `<leader>rn` | Rename symbol | Rename symbol across project |

### Terminal Integration
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>gg` | Lazygit | Open Lazygit in tmux |
| `<leader>ac` | Tmux split | Create vertical tmux split |
| `<M-f>` | Toggle terminal | Open floating terminal |

## Project Structure

```
nixvim/
├── flake.nix              # Main flake configuration
├── flake.lock             # Lock file for reproducible builds
├── config/
│   ├── default.nix        # Main configuration entry point
│   ├── core/              # Core Neovim settings
│   │   ├── default.nix
│   │   ├── options.nix    # Vim options and settings
│   │   ├── keymaps.nix    # Global key mappings
│   │   └── autocmd.nix    # Auto-commands and events
│   ├── plugins/           # Plugin configurations
│   │   ├── default.nix    # Plugin imports
│   │   ├── lsp.nix        # Language server configuration
│   │   ├── treesitter.nix # Syntax highlighting
│   │   ├── telescope.nix  # Fuzzy finder
│   │   ├── dap.nix        # Debug adapter protocol
│   │   ├── cmp.nix        # Completion engine
│   │   ├── format.nix     # Code formatting
│   │   ├── lint.nix       # Linting configuration
│   │   ├── git.nix        # Git integration
│   │   ├── nvimtree.nix   # File explorer
│   │   ├── bufferline.nix # Buffer/tab management
│   │   ├── lualine.nix    # Status line
│   │   ├── alpha.nix      # Start screen
│   │   ├── toggleterm.nix # Terminal integration
│   │   ├── hop.nix        # Text navigation
│   │   ├── flash.nix      # Alternative navigation
│   │   ├── ufo.nix        # Folding enhancement
│   │   ├── noice.nix      # UI improvements
│   │   ├── cursorline.nix # Cursor enhancements
│   │   ├── statuscol.nix  # Status column
│   │   ├── project.nix    # Project management
│   │   ├── markdown.nix   # Markdown support
│   │   ├── presence.nix   # Discord integration
│   │   ├── comment.nix    # Comment utilities
│   │   └── cmake.nix      # CMake support (commented)
│   └── themes/            # Color scheme configurations
│       ├── default.nix    # Theme selection
│       ├── catppuccin.nix # Current theme
│       ├── onedark.nix    # Alternative theme
│       └── base16-radium.nix # Custom theme
├── README.md              # Basic usage instructions
├── LICENSE                # MIT License
└── DOCUMENTATION.md       # This file
```

## Development Setup

### Building Locally

1. Clone the repository:
```bash
git clone https://github.com/sijanthapa171/nixvim.git
cd nixvim
```

2. Build and run:
```bash
nix run .
```

3. Check configuration:
```bash
nix flake check .
```

### Customization

#### Adding New Plugins

1. Create a new file in `config/plugins/`:
```nix
# config/plugins/my-plugin.nix
{
  plugins.my-plugin = {
    enable = true;
    settings = {
      # Plugin configuration
    };
  };
}
```

2. Add to `config/plugins/default.nix`:
```nix
imports = [
  # ... existing imports
  ./my-plugin.nix
];
```

#### Modifying Themes

1. Edit existing theme in `config/themes/`
2. Or create new theme file
3. Update `config/themes/default.nix` to import your theme

#### Language Server Setup

Add new language servers in `config/plugins/lsp.nix`:

```nix
servers = {
  # ... existing servers
  my_language_server = {
    enable = true;
    # Additional settings
  };
};
```

### Dependencies

The configuration automatically includes necessary external tools:

**Formatters**: alejandra, black, prettier, stylua, rustfmt, etc.
**Linters**: ruff, luacheck, yamllint, golangci-lint, etc.
**Debuggers**: gdb, lldb, delve
**Tools**: ripgrep, fd, tmux-sessionizer, marksman

### Performance Considerations

- **Lazy loading**: Most plugins load on-demand
- **Optimized settings**: Reduced `updatetime`, smart completion
- **Minimal startup**: Clean plugin initialization
- **Memory efficient**: Proper autocmd management

### Troubleshooting

#### LSP Issues
1. Check `:LspInfo` for server status
2. Verify language server is installed: `:checkhealth`
3. Review `config/plugins/lsp.nix` for server configuration

#### DAP Issues
1. Check `:DapShowLog` for debug information
2. Verify debugger is available in PATH
3. Review `config/plugins/dap.nix` for adapter configuration

#### Plugin Issues
1. Use `:checkhealth` to diagnose problems
2. Check plugin-specific health with `:checkhealth <plugin>`
3. Review plugin configuration in respective files

## License

This configuration is released under the MIT License. See [LICENSE](LICENSE) for details.

## Contributing

Feel free to submit issues and pull requests to improve this configuration. When contributing:

1. Test your changes with `nix flake check .`
2. Update documentation as needed
3. Follow existing code style and organization
4. Ensure backward compatibility where possible

## Acknowledgments

- **Nixvim**: For the excellent Nix-based Neovim configuration framework
- **Plugin authors**: For creating the amazing plugins used in this configuration
- **Community**: For inspiration and feedback on modern Neovim setups