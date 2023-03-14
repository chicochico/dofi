{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = builtins.getEnv "USER";
  home.homeDirectory = builtins.getEnv "HOME";

  home.packages = with pkgs; [
    zsh
    oh-my-zsh
    zsh-powerlevel10k
    fzf
    gnupg
    ripgrep
    silver-searcher
    tree
    nodejs
    gh
  ];

  programs.tmux = {
    enable = true;
    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
    ];
    extraConfig = ''
      source $HOME/.tmux.conf
    '';
  };

  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      neo-tree-nvim

      nvim-lspconfig
      fidget-nvim

      nvim-cmp
      cmp-nvim-lsp
      luasnip
      cmp_luasnip

      vim-autoswap
      base16-vim
      vim-fugitive
      vim-surround
      vim-obsession
      vim-sleuth
      vim-repeat
      vim-commentary
      gitsigns-nvim
      tagbar
      fzf-vim
      gv-vim
      goyo-vim
      vim-gutentags
      vim-tmux-navigator
      vim-pencil
      null-ls-nvim
      markdown-preview-nvim
      nvim-cmp
      (nvim-treesitter.withPlugins (_: with pkgs.tree-sitter-grammars; [
        tree-sitter-python
        tree-sitter-lua
        tree-sitter-c
        tree-sitter-dockerfile
        tree-sitter-hcl
        tree-sitter-nix
      ]))
    ];

    extraPackages = with pkgs; [
      # language servers and fixers
      # terraform
      terraform-ls
      tflint
      # python
      nodePackages.pyright
      isort
      black
    ];
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
