@help:
    just -l -u -f {{ source_file() }}

[linux]
setup config-dir backup-dir:
    echo "Configuring linux/bash..."

    [[ ! -f ~/.bashrc ]] || touch ~/.bashrc

    mkdir -p \
        {{ config-dir }} \
        {{ backup-dir }} \
        {{ home_dir() }}/.vim \
        {{ home_dir() }}/.local/share/bash-completions \
        {{ home_dir() }}/.vim/autoload \
        {{ home_dir() }}/.config/tmux \
        {{ home_dir() }}/.config/screen

    just util::safe-copy \
        {{ justfile_dir() }}/src/conf/bashrc.local \
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

    just util::clean-append \
        "[[ ! -f {{ config-dir }}/bashrc.local ]] || source {{ config-dir }}/bashrc.local" \
        ~/.bashrc

[macos]
setup config-dir backup-dir:
    echo "Configuring macos/zsh..."

    [[ ! -f ~/.zshrc ]] || touch ~/.zshrc

    mkdir -p \
        {{ config-dir }} \
        {{ backup-dir }} \
        {{ home_dir() }}/.vim \
        {{ home_dir() }}/.zsh/completions \
        {{ home_dir() }}/.config/tmux \

    just util::safe-copy \
        {{ justfile_dir() }}/src/conf/zshrc.local \
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

    # Install vim.plug, assuming internet access.
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    just util::clean-append \
        "[[ ! -f {{ config-dir }}/zshrc.local ]] || source {{ config-dir }}/zshrc.local" \
        ~/.zshrc
