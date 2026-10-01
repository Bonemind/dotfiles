Dotfiles
=======

Dotfile repository

There are many like it, but this one is mine

## What's in here

Each top-level directory is a [GNU Stow](https://www.gnu.org/software/stow/) package, mirroring the layout under `~`.

| Package    | What                                                      |
| ---------- | --------------------------------------------------------- |
| `bash`     | Minimal bashrc that hands interactive shells over to fish |
| `fish`     | Main shell config, git helpers, `ssh_agent`               |
| `git`      | Global gitignore (`~/.config/git/ignore`)                 |
| `vim`      | Minimal vimrc, plugins as git submodules in `.vim/pack`   |
| `tmux`     | tmux config, no plugins                                   |
| `ctags`    | ctags defaults                                            |

## Setup

Requires: `stow`, `fish`, `vim` (9.1+), `tmux`, `starship`, `direnv`, `asdf`.

```
git clone --recurse-submodules git@github.com:Bonemind/dotfiles.git ~/dotfiles
cd ~/dotfiles
./stowdotfiles.sh
```

The repo has to live directly in `~`: the stow script stows into the parent directory of the repo.

Already cloned without submodules (vim-surround, vim-repeat)?

```
git submodule update --init
```

### One-off migration

The global gitignore moved from `~/.gitignore_global` to git's default location `~/.config/git/ignore`, which git reads without any config. Older machines still point git at the old file, and while that setting exists nothing gets ignored globally. Run once per machine:

```
git config --global --unset core.excludesfile
```

## Notes

### Machine-local config

Not tracked, picked up if present:

- `~/.config/fish/config.fish.local`: extra PATH entries, env vars, per-machine aliases
- `~/.gitconfig`: identity, commit signing and credential helpers differ per machine, so it's deliberately not in this repo

### ssh-agent

One agent shared by all shells, on a fixed socket (`$XDG_RUNTIME_DIR/ssh-agent.sock`). Every fish shell points `SSH_AUTH_SOCK` at it, except inside ssh sessions so agent forwarding keeps working.

```
ssh_agent start    # start if needed, use it in this shell
ssh_agent status   # pid and loaded keys (default)
ssh_agent unset    # stop using it in this shell only
ssh_agent kill     # stop the agent
```
