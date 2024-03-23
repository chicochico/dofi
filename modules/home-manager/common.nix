{ config, pkgs, inputs, ... }:

let
  notational-fzf-vim = pkgs.vimUtils.buildVimPlugin {
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
      actionlint
      aws-vault
      awscli2
      colima
      fd
      findutils
      fzf
      gh
      gnugrep
      gnupg
      htop
      jq
      kitty
      kubernetes-helm
      nodejs
      openssl
      parallel
      ripgrep
      silver-searcher
      tree
      universal-ctags
      unixtools.watch
      vale
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
    alacritty = { source = ./dotfiles/config/alacritty; target = ".config/alacritty"; };
    karabiner = { source = ./dotfiles/config/karabiner; target = ".config/karabiner"; };
    nvim = { source = ./dotfiles/config/nvim; target = ".config/nvim/"; };
    p10k = { source = ./dotfiles/p10k.zsh; target = ".p10k.zsh"; };
    vale = { source = ./dotfiles/vale.ini; target = ".vale.ini"; };
    amethyst = { source = ./dotfiles/amethyst.yaml; target = ".amethyst.yml"; };
    gitconfig-default = { source = ./dotfiles/config/git/config; target = ".config/git/config"; };
    k8s-zsh = { source = ./dotfiles/k8s.zsh; target = ".k8s.zsh"; };
    zshrc = {
      text = builtins.concatStringsSep "\n" ([
        (builtins.readFile dotfiles/zshrc)
        ''
          # add direnv hook
          eval "$(${pkgs.direnv}/bin/direnv hook zsh)"

          # load base16
          source "${inputs.base16-shell}/profile_helper.sh"
        ''
      ]);
      target = ".zshrc";
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
    historyLimit = 5000;
    clock24 = true;
    extraConfig = builtins.readFile dotfiles/tmux.conf;
  };

  programs.zsh = {
    enable = false;
  };

  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      base16-vim
      cmp-nvim-lsp
      copilot-vim
      fidget-nvim
      fzf-vim
      gitsigns-nvim
      goyo-vim
      gv-vim
      markdown-preview-nvim
      neo-tree-nvim
      none-ls-nvim
      notational-fzf-vim
      nvim-autopairs
      nvim-cmp
      nvim-lspconfig
      tagbar
      vim-commentary
      vim-fugitive
      vim-gnupg
      vim-gutentags
      vim-obsession
      vim-pencil
      vim-repeat
      vim-rhubarb
      vim-sleuth
      vim-surround
      vim-tmux-navigator
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
      # yaml
      nodePackages.yaml-language-server
      # github actions
      actionlint
      # sql
      sqlfluff
    ];
  };

}
