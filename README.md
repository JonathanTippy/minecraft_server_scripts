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
- sudo cp curseforge_mods_downloader /usr/local/bin
## Setting up Minecraft Server
- mkdir /opt/minecraft
- sudo chown $USER /opt/minecraft -R
- run either minecraft_update_fabric or minecraft_update_forge
- sudo cp minecraft.service /etc/systemd/user
- sudo loginctl enable-linger <username>
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
  you can also use the restic option for super compact backups, 
  but this will require you to create a restic repo. 
  I will not explain how to do that. Also, I will not explain how
  to retrieve the data from the restic repo. There isn't much of a
  reason for this, I just don't want to do it right now but i wanted to
  add the restuc backup script
- mkdir /var/local/minecraft
- sudo chown $USER /var/local/minecraft
- crontab -e
- add the following line to the bottom of the file
- 0 0 * * * /usr/local/bin/minecraft_backup
## adding mods to the server (optional)
- curseforge_mods_downloader
- download the mods and copy the links afterwards
- add each mod link in its own line
- press ctrl + s to save the mods list file and then ctrl + x to close the file
- watch the server boot and answer weather it works or not
- if it doesn't work, wait a few seconds and try again with different mods


![Screenshot_2022-10-06_11-04-50](https://user-images.githubusercontent.com/54297927/194384587-68ffc0d3-c23d-48f8-aeb9-986c908523a1.png)

