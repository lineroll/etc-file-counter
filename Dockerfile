FROM jenkins/jenkins:lts

USER root

# Install dependencies for building and installing RPM/DEB
RUN apt-get update && apt-get install -y \
    rpm \
    dpkg \
    bash \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Allow jenkins user to use sudo without password (for installing packages in pipeline)
RUN echo "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER jenkins

# Install suggested plugins
RUN jenkins-plugin-cli --plugins "workflow-aggregator git docker-workflow"

EXPOSE 8080 50000
