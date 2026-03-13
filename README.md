# Configs

## System requirements
* `just`: Install via `uv tool install -p 3.12 rust-just`

## Usage
Clone this repo, then in the repo, run

```sh
just setup
```

This will copy configuration files to your home directory and make backups of
existing files as needed.

## Testing
Use bubblewrap (bwrap) to test. Install via 

```sh
pixi global install bubblewrap
```

Then run

```sh
just test
```

## Dev
Install the following tools for bumping versions

```sh
uv tool install bump-cli
```

Then, bump with

```sh
just bump patch  # or minor, major, etc
```
