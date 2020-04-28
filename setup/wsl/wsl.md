# Using Bash in Windows (WLS)

- enable linux sub-system (look up how to online)
- install VcXsrv on Windows
    - Save config file to Startup. See [vim/tmux for wsl][1].
    - Also need to configure firewall settings.
    - Needs a system reboot.
- add `export DISPLAY=localhost:0.0` to `~/.bashrc`

# Troubleshoot
- Jupyter, python.http.server
    - For Jupyter. Need to set `jupyter-notebook --no-browser`.
    - Also need to set firewall settings for jupyter and python.
      Select `allow on public network`, and not `private networks`.
      This should be the default.
    - Needs a system reboot.

[1]: https://www.youtube.com/watch?v=_MgrjgQqDcE&list=WL
