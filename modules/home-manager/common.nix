{ config, pkgs, inputs, ... }:

let
  notational-fzf-vim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "notational-fzf-vim";
    src = pkgs.fetchFromGitHub {
      owner = "Alok";
      repo = "notational-fzf-vim";
      rev = "75c2c31e7cd77397018c5777804666d648557537";
      hash = "sha256-10IVgfdk8gaz4kHUjExtrnntsiFJry2/KRvuHYccqG4=";
    };
  };
in
{
  home = {
    username = "fchiang";
    homeDirectory = "/Users/${config.home.username}";
    packages = with pkgs; [
      aws-vault
      awscli2
      fzf
      gh
      gnupg
      jq
      nodejs
      ripgrep
      silver-searcher
      tree
      universal-ctags
      yubikey-manager
      zsh
      zsh-powerlevel10k
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
          # add direnv hook
          eval "$(${pkgs.direnv}/bin/direnv hook zsh)"
        ''
      ]);
      target = ".zshrc";
    };
    zshenv = {
      text = ''
        # load base16
        source "${inputs.base16-shell}/profile_helper.sh"
      ''
      ;
      target = ".zshenv";
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

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
      notational-fzf-vim
      (nvim-treesitter.withPlugins (
        plugins: with plugins; [
          bash
          c
          clojure
          diff
          dockerfile
          gitignore
          hcl
          kotlin
          lua
          nix
          python
          terraform
        ]
      ))
    ];

    # language servers and fixers
    extraPackages = with pkgs; [
      # terraform
      terraform-ls
      tflint
      # python
      python311Packages.pyflakes
      python311Packages.python-lsp-server
      isort
      black
      # nix
      rnix-lsp
      nixpkgs-fmt
      # lua
      stylua
    ];
  };

}
