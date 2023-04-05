{ config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    zsh
    zsh-powerlevel10k
    fzf
    gnupg
    ripgrep
    silver-searcher
    tree
    nodejs
    gh
    universal-ctags
    jq
  ];

  programs.tmux = {
    enable = true;
    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
    ];
    sensibleOnTop = false;
    extraConfig = builtins.readFile dotfiles/.tmux.conf;
  };

  programs.zsh = {
    enable = false;
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
        # tree-sitter-python
        tree-sitter-lua
        tree-sitter-c
        tree-sitter-dockerfile
        tree-sitter-hcl
        tree-sitter-nix
      ]))
    ];

    # language servers and fixers
    extraPackages = with pkgs; [
      # terraform
      terraform-ls
      tflint
      # python
      nodePackages.pyright
      isort
      black
      # nix
      rnix-lsp
      nixpkgs-fmt
      # lua
      stylua
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

  home.file = {
    alacritty = { source = ./dotfiles/.config/alacritty; target = ".config/alacritty/"; };
    gitconfig = { source = ./dotfiles/.gitconfig; target = ".gitconfig"; };
    karabiner = { source = ./dotfiles/.config/karabiner; target = ".config/karabiner"; };
    nvim = { source = ./dotfiles/.config/nvim; target = ".config/nvim/"; };
    p10k = { source = ./dotfiles/.p10k.zsh; target = ".p10k.zsh"; };
    tmuxcolors = { source = ./dotfiles/.tmuxcolors; target = ".tmuxcolors"; };
    vale = { source = ./dotfiles/.vale.ini; target = ".vale.ini"; };
    zshrc = {
      text = builtins.concatStringsSep "\n" ([
        (builtins.readFile dotfiles/.zshrc)

        ''
          BASE16_THEME_DEFAULT="base16_default-dark"
          [ -n "$PS1" ] && \
            [ -s "${inputs.base16-shell}/profile_helper.sh" ] && \
              source "${inputs.base16-shell}/profile_helper.sh" > /dev/null
        ''
      ]);
      target = ".zshrc";
    };
  };
}
