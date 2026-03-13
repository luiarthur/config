tmux-plugins-dir := home_dir() / ".config/tmux/plugins"
tmux-resurrect-clone := tmux-plugins-dir / "tmux-resurrect"
tmux-resurrect-cmd := f"run-shell {{tmux-resurrect-clone}}/resurrect.tmux"

@help:
    just -l -u -f {{ source_file() }}

# Install all plugins
setup: install-tmux-resurrect

# Install tmux resurrect
[linux]
[macos]
install-tmux-resurrect:
    mkdir -p {{ tmux-plugins-dir }}
    git clone https://github.com/tmux-plugins/tmux-resurrect \
            {{ tmux-plugins-dir }}/tmux-resurrect
    just -f {{ justfile() }} util::clean-append \
            "{{ tmux-resurrect-cmd }}" \
            {{ home_dir() }}/.config/tmux/tmux.conf
