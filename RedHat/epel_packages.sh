# Description: Install EPEL repository and neofetch package
# Adding EPEL repository to RedHat 9
curl -o /tmp/epel-release-latest-9.noarch.rpm https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm

# Install EPEL repository
dnf -y install /tmp/epel-release-latest-9.noarch.rpm

# Install neofetch package
dnf -y install neofetch

# Remove EPEL rpm file
rm -rf /tmp/epel-release-latest-9.noarch.rpm

# Clean Cache
dnf clean all