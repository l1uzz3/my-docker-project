# Use Ubuntu 20.04 LTS as the base image
FROM ubuntu:20.04

# Avoid prompts from apt to hang the build
ARG DEBIAN_FRONTEND=noninteractive

# Update the package repository and install packages
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
       sudo \
       python3-pip \
       python3-dev \
       git \
       vim \
       curl \
       wget \
       bash-completion \
       build-essential \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create a new user 'dev' and give them sudo access
RUN useradd -m dev -s /bin/bash \
    && echo 'dev ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

# Switch to user 'dev'
USER dev
WORKDIR /home/dev

# Optional: Set up a Python virtual environment (recommended)
RUN python3 -m pip install --user virtualenv \
    && python3 -m virtualenv venv \
    && echo "source ~/venv/bin/activate" >> ~/.bashrc

# Optional: Install any global Python packages
# RUN python3 -m pip install flask django numpy pandas

# Set the default shell to bash instead of sh
SHELL ["/bin/bash", "--login", "-c"]

# Expose any ports the app needs
EXPOSE 8080

# Default command to keep the container running
CMD ["sleep", "infinity"]