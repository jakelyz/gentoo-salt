# jakelyz-salt

### Initial Setup
1. Install salt-minion.
2. Clone this repo.

        git clone git@github.com:jakelyz/jakelyz-salt

3. Run first highstate as root.

        cd jakelyz-salt && sudo salt-call --local state.highstate --file-root ./
        
4. Correct new salt file_root permissions.

        chown -R $(whoami) ~/srv/salt
        
5. From here on, continue to run highstates as your user.

        salt-call state.highstate
