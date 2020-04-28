# Using Bash in Windows (WLS)

- enable linux sub-system (look up how to online)
- install VcXsrv on Windows
    - Save config file to Startup. See [vim/tmux for wsl][1].
    - Also need to configure firewall settings.
    - Needs a system reboot.
- add `export DISPLAY=localhost:0.0` to `~/.bashrc`
- [install nodejs for jupyterlab][2]
    ```bash
    # Install nodejs using package manage
    # https://computingforgeeks.com/how-to-install-latest-nodejs-on-ubuntu-debian-linux/
    curl -sL https://deb.nodesource.com/setup_13.x | sudo bash -
    sudo apt-get install -y nodejs
    node -v

    # Install NPM
    curl -L https://npmjs.org/install.sh | sudo sh
    npm -v
    ```
- [accessing linux file system from Windows][3]
    - Pin the WSL directory to Quick access. This makes uploading/downloading
      WSL files using a Windows browser more convenient.

# Troubleshoot
- Jupyter, python.http.server
    - For Jupyter. Need to set `jupyter-notebook --no-browser`.
    - Also need to set firewall settings for jupyter and python.
      Select `allow on public network`, and not `private networks`.
      This should be the default.
    - Needs a system reboot.

[1]: https://www.youtube.com/watch?v=_MgrjgQqDcE&list=WL
[2]: https://www.devroom.io/2011/10/24/installing-node-js-and-npm-on-ubuntu-debian/
[3]: https://devblogs.microsoft.com/commandline/whats-new-for-wsl-in-windows-10-version-1903/
