#!/bin/bash

# NOTE: Run this when WSL2 Vmmem gets high. Consider putting in crontab.
# Not as crucial if memory limit is set in `.wslconfig`.
alias drop_cache="sudo sh -c \"echo 3 >'/proc/sys/vm/drop_caches' && swapoff -a && swapon -a && printf '\n%s\n' 'Ram-cache and Swap Cleared'\""

configure_wsl_specific_settings() {
  # NOTE: Not sure if any of these are still needed since LINUX GUI apps are
  # officially supported in WSL2. I think all of these are set by default in
  # the newer wsl2 versions.

  # For VcXsrv (WSL2)
  LOCAL_IP=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}')
  export DISPLAY=$LOCAL_IP:0
  export LIBGL_ALWAYS_INDIRECT=1

  # WSL, X11 stuff. For matplotlib, seaborn.
  export NO_AT_BRIDGE=1

  # NOTE: Fixes default permissions of new directories in WSL.
  # Source: https://www.turek.dev/post/fix-wsl-file-permissions/
  [[ "$(umask)" = "0000" ]] && umask 0022
}

# NOTE: If things break, add the following in ~/.bashrc:
# 
#     [[ -f ~/.wsl-settings.sh ]] && {
#       source ~/.wsl-settings.sh
#       configure_wsl_specific_settings
#     }
