#!/usr/bin/env bash

######################################################################
# dotfiles - Remote Runnable Dotfile Setup and Update Script         #
######################################################################
# This script will clone + install, or update dotfiles from git      #
# Be sure to read through the repo before running anything here      #
# For more info, read docs:                                          #
# https://github.com/zDavidB/dotfiles-public                         #
#                                                                    #
# Uses dotbot - see https://github.com/anishathalye/dotbot           #
#                                                                    #
# Config Options:                                                    #
# - DOTFILES_REPO - Optionally sets the source repo to be cloned     #
# - DOTFILES_DIR - Optionally sets the local destination directory   #
######################################################################
# Licensed under MIT (C) Alicia Sykes 2022 <https://aliciasykes.com> #
######################################################################

# If not already set, specify dotfiles destination directory and source repo
DOTFILES_DIR="${DOTFILES_DIR:-$HOME/dotfiles}"
DOTFILES_REPO="${DOTFILES_REPO:-https://github.com/zDavidB/dotfiles-public.git}"

# Print starting message
echo -e "\033[1;35m""Dotfiles Installation Script 🧰
\033[0;35mThis script will install or update specified dotfiles:
- From \033[4;35m${DOTFILES_REPO}\033[0;35m
- Into \033[4;35m${DOTFILES_DIR}\033[0;35m
Be sure you've read and understood the what will be applied.\033[0m\n"

# Ask user if they'd like to proceed
if [[ ! $* == *"--auto-yes"* ]] ; then
  echo -e "${PURPLE}Are you happy to continue? (y/N)${RESET}"
  read -t 15 -n 1 -r
  echo
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${YELLOW}Proceeding was rejected by user, exiting...${RESET}"
    exit 0
  fi
fi

# If dependencies not met, install them
if ! hash git 2> /dev/null; then
  bash <(curl -s  -L 'https://gist.github.com/zDavidB/d7a1d9ae0c0833f0912ce38537e24807')
fi

# If dotfiles not yet present then clone
if [[ ! -d "$DOTFILES_DIR" ]]; then
  mkdir -p "${DOTFILES_DIR}" && \
  git clone --recursive ${DOTFILES_REPO} ${DOTFILES_DIR}
fi

# Execute setup or update script, using dotbot cli installed in pre-reqs
# instead of using the submodule option
cd "${DOTFILES_DIR}" && \
dotbot -c ./install.conf.yaml


# EOF
