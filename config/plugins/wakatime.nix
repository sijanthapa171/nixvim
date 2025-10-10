{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    vim-wakatime
  ];

  # WakaTime plugin itself does not require Lua configuration here. The
  # plugin expects the `wakatime-cli` binary to be available and an API key
  # configured via `~/.wakatime.cfg` or the `WAKATIME_API_KEY` environment
  # variable. We install the CLI in `config/default.nix`'s `extraPackages`.
  extraConfigLua = ''
    -- No runtime Lua configuration required for wakatime.nvim (vim-wakatime).
  '';
}
