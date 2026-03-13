@help:
    just -l -u -f {{ source_file() }}

[private]
clean-append-safe-source file-to-source file-to-append:
    just util::clean-append \
        "[[ ! -f {{ file-to-source }} ]] || source {{ file-to-source }}" \
        {{ file-to-append }}

[linux]
[macos]
setup config-dir backup-dir:
    echo "Configuring shell..."

    mkdir -p \
        {{ config-dir }} \
        {{ backup-dir }} \
        {{ home_dir() }}/.vim \
        {{ home_dir() }}/.config/tmux \
        {{ home_dir() }}/.config/screen \
        {{ home_dir() }}/.zsh/completions

    just util::safe-copy \
        {{ justfile_dir() }}/src/conf/bashrc.local \
        {{ config-dir }} \
        {{ backup-dir }}

    just util::safe-copy \
        {{ justfile_dir() }}/src/conf/zshrc.local \
        {{ config-dir }} \
        {{ backup-dir }}

    just util::safe-copy \
        {{ justfile_dir() }}/src/conf/git-prompt.sh \
        {{ config-dir }} \
        {{ backup-dir }}

    just util::safe-copy \
        {{ justfile_dir() }}/src/conf/openai-api.sh \
        {{ config-dir }} \
        {{ backup-dir }}

    just util::safe-copy \
        {{ justfile_dir() }}/src/conf/vimrc \
        {{ home_dir() }}/.vim \
        {{ backup-dir }}

    just util::safe-copy \
        {{ justfile_dir() }}/src/conf/tmux.conf \
        {{ home_dir() }}/.config/tmux \
        {{ backup-dir }}

    just util::safe-copy \
        {{ justfile_dir() }}/src/conf/screenrc \
        {{ home_dir() }}/.config/screen \
        {{ backup-dir }}

    # Install vim.plug, assuming internet access.
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    just -f {{ source_file() }} clean-append-safe-source \
        {{ config-dir }}/bashrc.local \
        ~/.bashrc

    just -f {{ source_file() }} clean-append-safe-source \
        {{ config-dir }}/zshrc.local \
        ~/.zshrc
