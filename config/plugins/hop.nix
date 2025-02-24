{
  plugins.hop = {
    enable = true;
    settings = {
      case_insensitive = false;
      dim_unmatched = true;
      # direction = "require'hop.hint'.HintDirection.BEFORE_CURSOR";
      hint_position = "require'hop.hint'.HintPosition.BEGIN";
      hint_type = "require'hop.hint'.HintType.OVERLAY";
      jump_on_sole_occurrence = true;
      # keys = "asdghklqwertyuiopzxcvbnmfj"; # Default layout
      # keys = "etovxqpdygfblzhckisuran"; # bépo layout
      quit_key = "<Esc>";
      reverse_distribution = false;
      teasing = true;
      virtual_cursor = true;
      x_bias = 10;
    };
  };
  keymaps = let
    options = {
      silent = true;
      noremap = true;
    };
  in [
    {
      #mode = [ "" ];
      action = "<CMD>lua require('hop').hint_words()<CR>";
      key = "<leader>hw";
      inherit options;
    }
    {
      #mode = [ "" ];
      action = "<CMD>lua require('hop').hint_char2()<CR>";
      key = "<leader>hc";
      inherit options;
    }
    {
      #mode = [ "" ];
      action = "<CMD>lua require('hop').hint_lines_skip_whitespace()<CR>";
      key = "<leader>hl";
      inherit options;
    }
    {
      #mode = [ "" ];
      action = "<CMD>lua require('hop').hint_char1({ direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = true })<CR>";
      key = "<leader>f";
      inherit options;
    }
    {
      #mode = [ "" ];
      action = "<CMD>lua require('hop').hint_char1({ direction = require('hop.hint').HintDirection.BEFORE_CURSOR, current_line_only = true })<CR>";
      key = "<leader>F";
      inherit options;
    }
    {
      #mode = [ "" ];
      action = "<CMD>lua require('hop').hint_char1({ direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<CR>";
      key = "<leader>t";
      inherit options;
    }
    {
      #mode = [ "" ];
      action = "<CMD>lua require('hop').hint_char1({ direction = require('hop.hint').HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<CR>";
      key = "<leader>T";
      inherit options;
    }
  ];
}
