# Use the Red Hat Universal Base Image (UBI9)
FROM redhat/ubi9:latest

# Set environment variables
ENV HOME=/root

# Copy the login script to the container
COPY login.sh /root/Downloads/login.sh

# Copy vim configuration file to the container
COPY .vimrc /root/.vimrc

# Make the scripts executable
RUN chmod +x /root/Downloads/login.sh

# Install EPEL repository and necessary tools
RUN curl -o /tmp/epel-release-latest-9.noarch.rpm https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm \
    && dnf -y install /tmp/epel-release-latest-9.noarch.rpm \
    && rm -f /tmp/epel-release-latest-9.noarch.rpm \
    && dnf -y install bash-completion vim nano git openssh-server openssh-clients neofetch \
    && dnf clean all

# Enable and configure the SSH service & root login password <> (change it to your desired password)
RUN mkdir -p /var/run/sshd \
    && echo 'root:root' | chpasswd \
    && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config \
    && ssh-keygen -A

# Add custom Bash aliases and PS1 for prompt customization
RUN echo "alias ls='ls --color=auto'" >> /root/.bashrc \
    && echo "alias grep='grep --color=auto'" >> /root/.bashrc \
    && echo "alias la='ls -a'" >> /root/.bashrc \
    && echo "alias ll='ls -l'" >> /root/.bashrc \
    && echo "alias grep='grep --color=auto'" >> /root/.bashrc \
    && echo "PS1='\\[\e[1;32m\\]\\u@\\[\e[1;32m\\]\\h\\[\\e[0m\\] \\[\\e[1;31m\\][\\w]\\[\\e[0m\\] \\[\\e[1;32m\\]\\$\\[\\e[0m\\] '" >> /root/.bashrc

# Expose the SSH port
EXPOSE 22

# Start the SSH service and keep the container running
CMD ["/usr/sbin/sshd", "-D"]
