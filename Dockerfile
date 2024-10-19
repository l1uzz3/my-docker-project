# Use the official Python image with the specified version (e.g., 3.9, 3.10, etc.)
ARG VARIANT=3.10-bullseye
FROM python:${VARIANT}

# Avoid prompts from apt to hang the build
ARG DEBIAN_FRONTEND=noninteractive

# Install necessary OS dependencies (adjust this based on your actual project needs)
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
       build-essential \
       libssl-dev \
       libffi-dev \
       python3-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create a new user 'stefanliute' and give them sudo access
RUN useradd -m stefanliute -s /bin/bash \
    && echo 'stefanliute ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

# Switch to user 'stefanliute'
USER stefanliute
WORKDIR /home/stefanliute

# Install Python virtual environment and Python dependencies from python_requirements.txt
COPY python_requirements.txt /home/stefanliute/python_requirements.txt
RUN python3 -m pip install --user virtualenv \
    && python3 -m virtualenv venv \
    && echo "source ~/venv/bin/activate" >> ~/.bashrc \
    && source ~/venv/bin/activate \
    && pip install --user -r /home/stefanliute/python_requirements.txt

# Expose any ports the app needs
EXPOSE 8080

# Default command to keep the container running
CMD ["sleep", "infinity"]