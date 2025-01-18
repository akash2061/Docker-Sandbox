# Use the Red Hat Universal Base Image (UBI9)
FROM redhat/ubi9:latest

# Set environment variables
ENV HOME=/root

# Copy the login script to the container
COPY login.sh /root/Downloads/login.sh

# Make the scripts executable
RUN chmod +x /root/Downloads/login.sh

# Volume for data persistence
VOLUME ["/data", "/root", "/etc", "/var"]

# Install EPEL repository
RUN curl -o /tmp/epel-release-latest-9.noarch.rpm https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm \
    && dnf -y install /tmp/epel-release-latest-9.noarch.rpm \
    && rm -f /tmp/epel-release-latest-9.noarch.rpm \
    && dnf install neofetch -y \
    && dnf clean all

# Install necessary tools and additional packages
RUN dnf -y install \
    bash-completion \
    nano \
    git \
    && dnf clean all

# Add custom Bash aliases and PS1 for prompt customization
RUN echo "alias ls='ls --color=auto'" >> /root/.bashrc \
    && echo "alias grep='grep --color=auto'" >> /root/.bashrc \
    && echo "PS1='\\[\e[1;32m\\]\\u@\\[\e[1;32m\\]\\h\\[\\e[0m\\] \\[\\e[1;31m\\][\\w]\\[\\e[0m\\] \\[\\e[1;32m\\]\\$\\[\\e[0m\\] '" >> /root/.bashrc

# Optionally, create a script for automatic system registration
# This step is optional and should be uncommented only if you want to automate the registration with your Red Hat credentials.
# Be cautious with credentials as it's generally not safe to store them in plain text.
# RUN echo -e "#!/bin/bash\nsubscription-manager register --username=your_username --password=your_password\nsubscription-manager attach --auto" > /root/register-redhat.sh \
#     && chmod +x /root/register-redhat.sh

# Set the default command to bash
CMD ["/bin/bash"]
