@help:
    just -l -u -f {{ source_file() }}

# Backup file to a directory
[no-cd]
backup file-to-backup backup-dir:
    #!/bin/sh
    if [[ -f {{ file-to-backup }} ]]; then
      mkdir -p {{ backup-dir }}
      echo "backing up {{ file-to-backup }} to {{ backup-dir }}"
      cp {{ file-to-backup }} {{ backup-dir }}
    fi

# Copy with backup
[no-cd]
safe-copy src-path dest-path backup-dir:
    just -f {{ source_file() }} backup {{ src-path }} {{ backup-dir }}
    cp {{ src-path }} {{ dest-path }}

# Clean append a phrase to a file
[no-cd]
@clean-append phrase file-path:
    [[ -f {{ file-path }} ]] || touch {{ file-path }}
    grep -qxF "{{ phrase }}" {{ file-path }} || \
        (echo >> {{ file-path }} && echo "{{ phrase }}" >> {{ file-path }})
