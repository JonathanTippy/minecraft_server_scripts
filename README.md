# minecraft_server_scripts
These scripts are for managing a forge or fabric headless minecraft server while tunneling with playit.gg. They were written on debian bullseye and might not work on other distributions.
## Installing Dependancies
### playit
- curl -SsL https://playit-cloud.github.io/ppa/key.gpg | sudo apt-key add -
- sudo curl -SsL -o /etc/apt/sources.list.d/playit-cloud.list https://playit-cloud.github.io/ppa/playit-cloud.list
- sudo apt update
- sudo apt install playit
### mcrcon
- git clone https://github.com/Tiiffi/mcrcon.git
- cd mcrcon
- make
- sudo make install
### java
- sudo apt update
- sudo apt install openjdk-17-jre-headless
## Installing Scripts
- wget https://github.com/JonathanTippy/minecraft_server_scripts/archive/refs/heads/main.zip
- unzip main.zip
- cd minecraft_server_scripts-main
- sudo cp minecraft_backup /usr/local/bin
- sudo cp minecraft_stop /usr/local/bin
- sudo cp minecraft_start /usr/local/bin
- sudo cp minecraft_update_fabric /usr/local/bin
- sudo cp minecraft_update_forge /usr/local/bin
## Setting up Minecraft Server
- mkdir /opt/minecraft
- sudo chown $USER /opt/minecraft -R
- run either minecraft_update_fabric or minecraft_update_forge
- sudo cp minecraft.service /etc/systemd/user
- systemctl --user daemon-reload
- systemctl --user enable minecraft
- systemctl --user start minecraft
## Installing playit.service
- playit (set up playit on their website with the link in the program)
- sudo cp playit.service /etc/systemd/system
- sudo systemctl daemon-reload
- sudo systemctl enable playit
- sudo systemctl start playit
## adding a server backup to crontab (optional)
- mkdir /var/local/minecraft
- sudo chown $USER /var/local/minecraft
- crontab -e
- add the following line to the bottom of the file
- 0 0 * * * /usr/local/bin/minecraft_backup
