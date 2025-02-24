{
  plugins.markdown-preview = {
    enable = true;
    settings = {
      auto_close = 1;
      # auto_start = true;
      page_title = "「\${name}」";
      port = "8080";
      preview_options = {
        disable_filename = 1;
        disable_sync_scroll = 1;
        sync_scroll_type = "middle";
      };
      theme = "dark";
    };
  };
}
