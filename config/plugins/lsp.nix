{
  plugins = {
    nix.enable = true;
    crates.enable = true;
    lsp = {
      enable = true;
      servers = {
        rust_analyzer = {
          enable = true;
          settings = {
            diagnostics.enable = true;
            # completion.postfix.enable = false; # Disable snippet suggestions because we have no snippet engine at the moment.
          };
          installCargo = true;
          installRustc = true;
        };
        # gdscript.enable = true;
        lua_ls.enable = true;
        yamlls.enable = true;
        nil_ls.enable = true;
        marksman.enable = true;
        # pylsp.enable = true;
        pyright.enable = true;
        bashls.enable = true;
        #ccls.enable = true;
        clangd.enable = true;
        cmake.enable = true;
        csharp_ls.enable = true;
        gopls.enable = true;
        jsonls.enable = true;
        ts_ls.enable = true;
        # html.enable = true;
        # volar.enable = true;
        # terraformls = {enable = true;};
        # ansiblels.enable = true;
      };
      keymaps = {
        silent = true;
        diagnostic = {
          "<leader>k" = "goto_prev";
          "<leader>j" = "goto_next";
        };
        lspBuf = {
          "gd" = "definition";
          "gD" = "declaration";
          "gi" = "implementation";
          "gr" = "references";
          "gt" = "type_definition";
          "K" = "hover";

          "<C-k>" = "signature_help";

          "<leader>ca" = "code_action";
          "<leader>rn" = "rename";
          "<leader>wa" = "add_workspace_folder";
          "<leader>wr" = "remove_workspace_folder";
        };
      };
    };
  };
}
