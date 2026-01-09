{ pkgs, ... }:
{
  # Import all your configuration modules here
  imports = [
    ./core
    ./themes
    ./plugins
  ];
  viAlias = true;
  vimAlias = true;
  clipboard = {
    register = "unnamedplus";
    providers = {
      wl-copy.enable = true;
      xclip.enable = true;
    };
  };
  globals.mapleader = " ";

  # Misc plugins
  plugins = {
    persistence.enable = true;
    direnv.enable = true;
    web-devicons.enable = true;
    lastplace.enable = true;
    nvim-autopairs.enable = true;
    markdown-preview.enable = true;
    tmux-navigator.enable = true;
    zellij = {
      enable = true;
      settings = {
        vimTmuxNavigatorKeybinds = true;
      };
    };
    better-escape = {
      enable = true;
      settings.timeout = 200;
    };
    which-key = {
      enable = false; # If you want to enable then change timeoutLen to 10 in core/options.nix for better performance
      settings.show_keys = true;
    };
  };
  extraPlugins = with pkgs.vimPlugins; [
    vim-be-good
    nui-nvim
  ];
  extraPackages = with pkgs; [
    # ripgrep
    tmux-sessionizer
    # Formatters
    nixfmt
    # asmfmt
    # astyle
    ruff
    # black # Ruff replaces this
    # isort # Ruff replaces this
    # pylint
    cmake-format
    # gofumpt
    # golines
    # gotools
    nodePackages.prettier
    prettierd
    rustfmt
    shfmt
    stylua
    # Debuggers / misc deps
    asm-lsp
    # bashdb
    # clang-tools
    delve
    golangci-lint
    fd
    gdb
    go
    # lldb_17
    # llvmPackages.bintools-unwrapped
    marksman
    # Linters
    commitlint
    # eslint_d
    hadolint
    # html-tidy
    luajitPackages.luacheck
    markdownlint-cli
    # shellcheck
    # vale
    yamllint
  ];
}
