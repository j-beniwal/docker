# Older versions of Docker were called docker, docker.io, or docker-engine. If these are installed, uninstall them:
sudo apt-get remove docker docker-engine docker.io containerd runc
# update
sudo apt-get update
# install
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
# Add GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
# Use the following command to set up the stable repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# install docker engine
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io


# post installation steps
sudo groupadd docker
sudo usermod -aG docker $USER

# start docker on boot up
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
