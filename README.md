# Homebrew tap for WarpgateSH

This tap distributes the WarpgateSH command-line client and its per-user
background synchronization agent for macOS and Linux.

Install the latest stable version:

```sh
brew tap M0okz/warpgatesh
brew install M0okz/warpgatesh/warpgatesh
warpgatesh agent install
```

To follow the latest development revision instead, pass `--HEAD` to
`brew install`.

See the [WarpgateSH repository](https://github.com/M0okz/warpgatesh) for
documentation, requirements, and issue reporting.

## Upgrade

```sh
brew update
brew upgrade M0okz/warpgatesh/warpgatesh
warpgatesh agent install
```

Version 0.1.16 adds a persistent per-profile SSH authentication preference.
To consistently use Warpgate browser approval, replace `my-profile` below with
the name shown by `warpgatesh profile list`:

```sh
warpgatesh profile ssh-auth my-profile in-browser
warpgatesh sync
```

This preference survives automatic synchronization and newly discovered targets.
Existing profiles keep automatic authentication until explicitly changed.
Upgrade both the CLI and agent before setting the preference.
