# Project Setup Summary

This document outlines the steps taken to set up a development environment using WSL, Docker, and VSCode, culminating in the version control setup with Git.

## Step 0: Install Required Software + WSL
1. **Docker**: Install **Docker Desktop** to facilitate containerization of applications.
2. **Mandatory: Install Ubuntu (version release 24.04), python3 (version release 3.12.3 - or later version), *optionally install git (version release 2.43.0 - or later version of course) - you can install it from VScode when you will run `code .`***:
   - first, open bash (git bash in my case, you may use PowerShell or CMD or any other terminal)
   - See options of WSL to install `wsl --list --online`
   - Install WSL Ubuntu using: `wsl --install -d Ubuntu`
     - it will require you to enter a new username for UNIX and a password. 
   - check: `wsl --list --verbose`: you'll see something like this
     
   ![image](https://github.com/user-attachments/assets/69276a86-8187-469c-a8e9-42aa2d08db14)
   
   - switch to Ubuntu: `wsl -d Ubuntu`
   - Now from this
     
     ![image](https://github.com/user-attachments/assets/14c7693b-a83c-493f-8f1a-2e9a968cb609)
 will go to this

![image](https://github.com/user-attachments/assets/2b929b2e-484f-4fc9-9fc0-744f5ecc75a7)

   - Update the env: `sudo apt update` and `sudo apt upgrade -y`
   - Go to home dir: type in the terminal `cd $HOME` to prepare for Step 1 below.
      
   ![image](https://github.com/user-attachments/assets/bddfe30b-7a70-49d5-aae6-eaa466607189)
   **Make sure Docker integrates WSL!!!**

4. **Visual Studio Code (VSCode)**: Installed to provide a robust code editor. (I already had it on my windows but when you run for the first time `code .` in Ubuntu it will require you to install VSCode for Ubuntu)
5. **VSCode Extension for Remote Containers**: Enabled development inside Docker containers directly from VSCode.
6. **Git**: Installed for version control.
7. **WSL2**: Enabled Windows Subsystem for Linux for a Unix-like development environment.

## Step 1: Configure Git auth details, etc

1. **Login to Git account**
   - `git config --global user.name "your_username"`
   - `git config --global user.email "youremail@gmail.com"` _It should be the mail that you use on GitHub!_
   - `git config --global credential.helper manager` this is to set the credentials for further git commands
     - After configuring the credential manager, when you run a Git command that requires authentication (like pushing to a remote repository), it should prompt you for your username and the PAT (Personal Access Token - fast generation on GitHub). The credential manager will save these for future use.
## Step 2: Version Control with Git
`git clone` and use whatever remote URL you want _(HTTPS, SSH, CLI)_

## Step 3: Build & run Docker image!
   - **you only have to build the image once.** Then we could work together.
     **Make sure to be in the repo directory `cd`**
     **Open the project in VScode using `code .`**
      - A prompt will appear in the bottom-right corner of VSCode asking if you want to "Reopen in Container." Click Reopen in Container. This will automatically build and start the Docker container if it's not already built. 
   - **Rebuilding images should only be necessary when the Dockerfile or other configuration files are modified!**
## Step 4: Docker workflow (have in mind that commands in the terminal regarding the docker stop/start won't be necesarilly needed, but that's a good to know workflow even if you integrate docker container in vscode directly)
   **In WSL terminal:**
1. **Check Docker Status**:
   `sudo service docker status`
   If it's running you'll see something like this:
   ![image](https://github.com/user-attachments/assets/86e1adcb-6e84-4f2b-aca8-d77002e26bc4)
2. **Check the built / running docker containers:**
   `docker ps`
   ![image](https://github.com/user-attachments/assets/e478518c-6fdc-4d74-82a8-a9688c8b04d9)
   You will only need the `CONTAINER ID` for managing it with start/stop for now.
   If you want to check the images too, you enter `docker images`(not needed now, but nice to know)
2. **Stop / start docker container:** 
   ```bash
   docker stop <container_id>
   docker start <container_id>
   ```
   **EXITING VSCODE AFTER YOU REOPENED THE CONTAINER WILL AUTOMATICALLY CLOSE THE DOCKER CONTAINER.**
3. **Reloading the work:**
   When you want to reload the work another day:
- you just have to enter the WSL terminal (search for WSL in the windows search)
   ![image](https://github.com/user-attachments/assets/09933d57-b6fa-4eee-aaa9-01ca5a015379)
- and just **start the container** and run `code .` to open VScode from Ubuntu and start coding (make sure to be in the repo with `cd`).
## Step 5: Enjoy the process together.
![image](https://github.com/user-attachments/assets/930581c4-2348-4179-8b97-c4179c763dd4)






