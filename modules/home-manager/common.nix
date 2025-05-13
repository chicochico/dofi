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
    homeDirectory = "/Users/${config.home.username}";
    packages = with pkgs; [
      actionlint
      aws-vault
      awscli2
      colordiff
      difftastic
      fd
      findutils
      fira-code
      fzf
      gh
      gnugrep
      gnupg
      go
      htop
      jq
      k9s
      krew
      kubecolor
      kubectl
      kubernetes-helm
      kustomize
      minikube
      nodejs
      openssl
      parallel
      python311
      python311Packages.ipython
      qrencode
      ripgrep
      silver-searcher
      sshpass
      tree
      unixtools.watch
      vale
      visidata
      websocat
      yq-go
      yubikey-manager
      zbar
      zsh
      zsh-fzf-tab
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
    git-zsh = { source = ./dotfiles/git.zsh; target = ".git.zsh"; };
    aws-zsh = { source = ./dotfiles/aws.zsh; target = ".aws.zsh"; };
    kitty = { source = ./dotfiles/config/kitty; target = ".config/kitty"; };
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
    browser = { source = ./bin/browse.sh; target = "bin/b"; };
    amethyst-layout-center = { source = ./amethyst-layout-center.js; target = "Library/Application Support/Amethyst/Layouts/center.js"; };
    nix = { source = ./dotfiles/config/nix; target = ".config/nix"; };
    k9s = { source = ./dotfiles/config/k9s/config.yaml; target = "Library/Application Support/k9s/config.yaml"; };
    k9s-skin-transparent = { source = ./dotfiles/config/k9s/skins/transparent.yaml; target = "Library/Application Support/k9s/skins/transparent.yaml"; };
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
      cmp-nvim-lsp
      CopilotChat-nvim
      copilot-vim
      fidget-nvim
      fugitive-gitlab-vim
      fzf-vim
      gitsigns-nvim
      goyo-vim
      gv-vim
      luasnip
      markdown-preview-nvim
      none-ls-nvim
      notational-fzf-vim # custom version
      nvim-autopairs
      nvim-cmp
      nvim-lspconfig
      nvim-treesitter-context
      oil-nvim
      vim-commentary
      vim-fugitive
      vim-gnupg
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
          go
          hcl
          kotlin
          lua
          nix
          python
          terraform
          vimdoc
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
      nixpkgs-fmt
      # lua
      stylua
      # yaml
      nodePackages.yaml-language-server
      # github actions
      actionlint
      # sql
      sqlfluff
      # bash
      shellcheck
      bash-language-server
      shfmt
      # go
      gopls
    ];
  };
}
