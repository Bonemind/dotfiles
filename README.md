Dotfiles
=======

Dotfile repository

There are many like it, but this one is mine

## Setup

Needs `stow` and `git`. The tools these dotfiles rely on are listed in `REQUIRES` in `stowdotfiles.sh`, which warns about any that are missing after stowing. vim needs to be 9.1+.

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

### Python venvs

Per project: direnv activates the project's `.venv` on `cd` and deactivates it when leaving. `layout uv` (in `direnvrc`) creates the venv with uv if it doesn't exist yet. `.envrc` is globally gitignored, so it stays local.

```
~/projects/foo $ echo 'layout uv' > .envrc
~/projects/foo $ direnv allow
direnv: loading .envrc
Using CPython 3.14.2
Creating virtual environment at: .venv
direnv: export +VIRTUAL_ENV ~PATH

~/projects/foo $ which python
/home/bonemind/projects/foo/.venv/bin/python
~/projects/foo $ uv pip install requests     # goes into .venv

~/projects/foo $ cd ~
direnv: unloading                            # venv deactivated
```

Global CLI tools (yt-dlp etc.): `uv tool install yt-dlp`, each gets its own venv with the command in `~/.local/bin`. `uv tool upgrade --all` to update.

### ssh-agent

One agent shared by all shells, on a fixed socket (`$XDG_RUNTIME_DIR/ssh-agent.sock`). Every fish shell points `SSH_AUTH_SOCK` at it, except inside ssh sessions so agent forwarding keeps working.

```
ssh_agent start    # start if needed, use it in this shell
ssh_agent status   # pid and loaded keys (default)
ssh_agent unset    # stop using it in this shell only
ssh_agent kill     # stop the agent
```
