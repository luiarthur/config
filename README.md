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
