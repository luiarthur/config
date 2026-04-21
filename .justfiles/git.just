git-config-dir := home_dir() / ".config/git"
gitignore-src := justfile_dir() / "src/conf/gitignore"
gitignore-dest := git-config-dir / "ignore"

@help:
    just -l -u -f {{ source_file() }}

# Set up git config
[no-cd]
setup:
    #!/bin/bash
    mkdir -p {{ git-config-dir }}
    cp {{ gitignore-src }} {{ gitignore-dest }}
    read -p "Enter your full name for Git: " full_name
    read -p "Enter your email for Git: " email
    git config --global user.email $email
    git config --global user.name "$full-name"
    git config --global core.excludesfile "{{ gitignore-dest }}"
    git config --global push.default simple
    git config --global push.autoSetupRemote true
    git config --global push.followTags true
    git config --global branch.sort -committerdate
    git config --global tag.sort version:refname
    git config --global init.defaultBranch main
    git config --global diff.algorithm histogram
    git config --global diff.colorMoved plain
    git config --global diff.mnemonicPrefix true
    git config --global diff.renames true
    git config --global diff.tool vscode
    git config --global difftool.vscode.cmd 'code --wait --diff $LOCAL $REMOTE'
    git config --global merge.tool vscode
    git config --global mergetool.vscode.cmd 'code --wait $MERGED'
    git config --global fetch.prune true
    git config --global fetch.pruneTags true
    git config --global fetch.all true
    git config --global pull.rebase false
