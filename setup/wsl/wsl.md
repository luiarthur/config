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
    ```
- [accessing linux file system from Windows][3]
    - Pin the WSL directory to Quick access. This makes uploading/downloading
      WSL files using a Windows browser more convenient.
- [Change settings for PrintScreen][4]
- Use Microsoft Edge (chromium based)
    - uses less RAM than Chrome
    - as least as fast as Chrome
    - since it's Chromium-based (like Chrome), Chrome extensions can be used,
      and the browser can be linked to Google account.
- OneDrive
    - [Meaning of the icons][5]
    - Note that OneDrive does two things:
        1. Acts like a Google Drive for Windows.
            - Everything in the OneDrive folder is synced (instantly) to the
              Cloud. Devices that are logged on to the same Microsoft account
              will have access to those files in their OneDrive directories.
              You can also sign in to the OneDrive Cloud and browse files
              online.
            - I prefer to be explicit about what I store in OneDrive, so as
              to save space and avoid conflicts. Therefore, instead of storing
              things directly to the Documents, Desktop, and Pictures
              directories in OneDrive (which I will probably never do for the
              aforementioned reasons), I will store everything in a directory
              called OneDrive/Synced. I may consider putting things in a Google
              Drive one day.
        2. Optionally (automatically) backs up files in Documents, Desktop, and
           Pictures.
            - Turn of automatic backup of Documents, Desktop, and Pictures. I
              want to be explicit about what I store in OneDrive, so as to
              avoid conflicts, and save space.

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
[4]: https://www.cnet.com/how-to/8-ways-you-can-take-screenshots-in-windows-10/
[5]: https://support.office.com/en-us/article/what-do-the-onedrive-icons-mean-11143026-8000-44f8-aaa9-67c985aa49b3
