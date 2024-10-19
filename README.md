# Project Setup Summary

This document outlines the steps taken to set up a development environment using WSL, Docker, and VSCode, culminating in the version control setup with Git.

## Step 0: Install Required Software
1. **Docker**: Installed Docker to facilitate containerization of applications.
2. **Visual Studio Code (VSCode)**: Installed to provide a robust code editor.
3. **VSCode Extension for Remote Containers**: Enabled development inside Docker containers directly from VSCode.
4. **Git**: Installed for version control.
5. **WSL2**: Enabled Windows Subsystem for Linux for a Unix-like development environment.

## Step 1: Install Ubuntu, Python and Git and run it. Configure auth details, etc
1. **Install Ubuntu**:
   - first, open bash (git bash in my case)
   - See options of WSL to install `wsl --list --online`
   - Install WSL Ubuntu using: `wsl --install -d Ubuntu`
     - it will require you to enter a new username for UNIX and a password. 
   - check: `wsl --list --verbose`: you'll see something like this
   ![image](https://github.com/user-attachments/assets/69276a86-8187-469c-a8e9-42aa2d08db14)
   - switch to Ubuntu: `wsl -d Ubuntu`
   - Now from this ![image](https://github.com/user-attachments/assets/14c7693b-a83c-493f-8f1a-2e9a968cb609)
 will go to this ![image](https://github.com/user-attachments/assets/2b929b2e-484f-4fc9-9fc0-744f5ecc75a7)
   - Update the env: `sudo apt update` and `sudo apt upgrade -y`
2. **Install WSL dependencies by running wsl_installed_packages.txt from the repo**
   - `sudo dpkg --set-selections < wsl_installed_packages.txt
      sudo apt-get dselect-upgrade`
3. **Login to Git account**
   - `git config --global user.name "your_username"`
   - `git config --global user.email "youremail@gmail.com"` _It should be the mail that you use on GitHub!_
   - `git config --global credential.helper manager` this is to set the credentials for further git commands
     - After configuring the credential manager, when you run a Git command that requires authentication (like pushing to a remote repository), it should prompt you for your username and the PAT (Personal Access Token - fast generation on GitHub). The credential manager will save these for future use.
## Step 2: Create the architecture of the project
`/project-folder
    /.devcontainer
        Dockerfile
        devcontainer.json
    /src
        app.py
        ...`
Now let's create these.
1. **Create main project dir**
   - `mkdir my-docker-project`
   - `cd my-docker-project`
   - `mkdir .devcontainer`
   - `mkdir src`
   - `touch .devcontainer/Dockerfile`
   - `touch .devcontainer/devcontainer.json`
   - `touch src/app.py`
   Now the structure of the project is set but you have to edit the content of the files.
   - Copy everything from classroom Dockerfile to our Dockerfile. `nano Dockerfile` will open it for editing and then you paste the content there (I modified all instances where 'dev' was the username (to 'stefanliute')
   - Do the same for devcontainer.json (make sure the username to match)
   - `cd src` and write `code .`. It will install VScode from Ubuntu and it will automatically run. You can modify the app.py there (add a simple code whatever).
## Step 3: Version control with Git
**Go on GitHub, create an EMPTY repository 'my-docker-project' _(do NOT create README.md and .gitignore file from GitHub)_**
**Now ensure that you're in the main folder 'my-docker-project'**
  - `git init` to initialize the local repository! To ensure that it is initialized, you can write `ls -a` this will list all the hidden and unhidden folders and files in the repo. You should have '.git' folder created.
  - make sure you're on the same branch as created on GitHub
  - `git config --global init.defaultBranch <name>` to make the default branch the one from Github _(without <>)_
  - `git branch -m <name>` 
  - `git add .` to add all the content of the 'my-docker-project'
  - `git status` to check what's the status
  - `git commit -m "first commit, added the local repo"`
  - `git status`
  - `git push origin main`
  - `git status`
**Now it should work.** Check the remote repo as well





