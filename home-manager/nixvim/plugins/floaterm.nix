{ ... }:
{
  programs.nixvim.plugins.floaterm = {
    enable = true;
    wintype = "float";
    keymaps = {
      toggle = "<leader>tt";
      prev = "<C-f>";
      next = "<C-n>";
    };
  };
}
