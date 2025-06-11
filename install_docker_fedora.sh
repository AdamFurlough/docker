# Install Docker on Fedora

# Update system
echo "Updating system..."
sudo dnf update -y

# Uninstall all conflicting packages
echo "Uninstalling all conflicting packages..."
for pkg in docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate podman runc; do 
    sudo dnf remove -y $pkg
    done

# Add Docker's official repository
echo "Adding Docker's official repository..."
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

# Install Docker
echo "Installing Docker..."
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Start and enable Docker service
echo "Starting and enabling Docker service..."
sudo systemctl start docker
sudo systemctl enable docker

echo "Done"
