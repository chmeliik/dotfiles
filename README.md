# Adam's dotfiles

These are Adam's config files. You're welcome to try them out!

(Consider trying them out with a different local user. The installation process
won't actively try to mess up your setup, but it's not too gentle either.)

## Installation

*The instructions are for Fedora. But apart from listing the required packages,
it should work on most distros.*

### Essentials

Before you can even get started, you will need `git` and `make`:

```shell
sudo dnf install git make
```

Clone the repo to `~/dotfiles`:

```shell
git clone https://github.com/chmeliik/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

Install the list of packages that Adam uses (some of them required for these dotfiles
to work):

```shell
make package-list | xargs sudo dnf install
```

Install the "essential" configuration:

```shell
make
```

Change your shell to `zsh`:

```shell
chsh -s /usr/bin/zsh
```

Log out, log back in. Start the `kitty` terminal. Enjoy :tada:

### Git config

Git configuration, while essential to Adam, is not installed by the default `make`
target (because it requires personal information).

If you want to install the git config, you need to create an `.env` file in
the `~/dotfiles` directory (or, if you're Adam, you can `make choose-env` one
of the included files). The content of the file should be:

```shell
export git_user_name='Your Name'
export git_user_email='you@someserver.org'
export git_user_signingkey='<your GPG key ID>'
```

More details about setting the signingkey [here][signingkey].

### Extras include

* Systemd service that autogenerates `.gitconfig` every time the `.gitconfig.template`
  (or the `.env` file) changes
* Gnome shell workaround to open terminal applications in Kitty instead of gnome-terminal
* Installation of the JetBrainsMono "[nerd font][nerd-fonts]"

Install everything, including git config and extras, with

```shell
make all
```

### System-wide config

Configuration that requires `sudo` lives separately under the `systemwide` target.

Install with:

```shell
sudo make systemwide
```

[signingkey]: https://docs.github.com/en/authentication/managing-commit-signature-verification/telling-git-about-your-signing-key
[nerd-fonts]: https://github.com/ryanoasis/nerd-fonts
