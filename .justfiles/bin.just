bin-dir := home_dir() / "bin"
bin-src := justfile_dir() / "src/bin"

@help:
    just -l -u -f {{ source_file() }}

[linux]
[macos]
setup:
    #!/bin/bash
    echo "Installing executable shell script to {{ bin-dir }}"
    mkdir -p {{ bin-dir }}
    cp {{ bin-src }}/* {{ bin-dir }}
    git init {{ bin-dir }}
    echo "Remember to commit your changes in {{ bin-dir }}"
