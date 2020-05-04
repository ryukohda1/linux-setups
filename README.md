# Notice
This script might break your environment like you can't do ssh connection. Please understand what you are about to try with the scripts.

# Contents
- sshd-setting.sh
- ufw.sh

## [sshd config change](sshd-setting.sh)
### Purpose
Securing ssh connection.　As default,
- Port number change
- PermitRootLogin no
- PasswordAuthentication no
- ChallengeResponseAuthentication no

You can enable more or disable by modifying `linux-setting.conf`.

### Prerequisites
- Make sure you can SSH with public key authentication

### How to run
```
sudo ./sshd-setting.sh
# BEFORE restarting sshd, make sure you CAN LOGIN with public key authentication
# Ubuntu
sudo systemctl restart ssh
```

## [ufw.sh](ufw.sh)
### Purpose
In order to secure the connection from outside, enabling firewall and opening ports for use by `ufw`. As default,
- Deny all the connection as default
- Open ssh port, which is the same parameter for `sshd-setting.sh`
- Open specific ports defined in `linux-setting.conf`

### Prerequisites
- Install `ufw`

### How to run
```
sudo ./ufw.sh
```