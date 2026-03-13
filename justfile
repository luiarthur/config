# git setup
[group: "modulues"]
mod git '.justfiles/git.just'
# utils
[group: "modulues"]
mod util '.justfiles/util.just'
# tmux plugins
[group: "modulues"]
mod tmux '.justfiles/tmux.just'
# config files
[group: "modulues"]
mod conf '.justfiles/conf.just'
# executables files
[group: "modulues"]
mod bin '.justfiles/bin.just'

current-date := shell("date +'%Y%m%d-%H%M%S'")
archive-dir := home_dir() / ".config/.unix-config-archive" / current-date
config-dir := home_dir() / ".config/unix-config"
uv-bin := `dirname $(which uv)`
test-dir := home_dir() / "tmp/test-config"

# Print this help menu
@help:
    just -l -u

# Setup environment (config files and executables)
[group("main")]
setup: && bin::setup tmux::setup git::setup
    just conf::setup {{ config-dir }} {{ archive-dir }}

# Run bash in sandbox
[group("tests")]
@shell:
    #!/bin/sh
    rm -rf {{ test-dir }}
    mkdir -p {{ test-dir }}
    bwrap \
        --ro-bind /usr /usr \
        --ro-bind /lib /lib \
        --ro-bind /lib64 /lib64 \
        --ro-bind /bin /bin \
        --ro-bind /etc /etc \
        --bind /tmp /tmp \
        --ro-bind {{ uv-bin }} /uv-bin \
        --proc /proc \
        --dev /dev \
        --setenv PATH "/tool-bin:/uv-bin:/usr/bin:/bin" \
        --setenv HOME /work \
        --ro-bind $PWD /setup \
        --bind {{ test-dir }} /work \
        --chdir /setup \
        --share-net \
        bash -c "uv tool install rust-just && /usr/bin/bash"
    rm -rf {{ test-dir }}

# Bump git version
[group("dev")]
bump kind:
    uv run bump {{ kind }} -p
