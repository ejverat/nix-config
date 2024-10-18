{ ... }:
{
  programs.nixvim = {
    plugins.neo-tree = {
      enable = true;
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>E";
        action = "<cmd>Neotree dir=./ reveal toggle<cr>";
      }
    ];
  };
}
