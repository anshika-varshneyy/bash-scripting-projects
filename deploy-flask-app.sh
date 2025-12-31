#!/bin/bash

<<task
Deploy flask application, while handling the error
task

code_clone(){
    echo " Cloning the Falsk-app.."

    if [ -d "Flask-application" ]; then
        echo "Code directory already exists"
        return 0
    fi

    git clone https://github.com/anshika-varshneyy/Flask-application.git || return 1
}

install_requirements(){
    echo "Installing the requirements"

     if command -v docker &>/dev/null; then
        echo "Docker already installed, skipping"
    else
        echo "Installing Docker..."
        sudo apt-get install -y docker.io || return 1
    fi

    if command -v nginx &>/dev/null; then
        echo "Nginx already installed, skipping"
    else
        echo "Installing Nginx..."
        sudo apt-get install -y nginx || return 1
    fi
}
restarts(){
    sudo systemctl start docker || return 1
    sudo systemctl start nginx || return 1
}
deploy(){
    [ -d "Flask-application" ] || return 1
    cd "Flask-application" || return 1
    docker build -t flask-ui-app . || return 1
    docker run -d -p 5000:5000 flask-ui-app || return 1
}

echo "*********************DEPLOYMENT STARTED****************************"

if ! code_clone; then
    echo "Code clone failed"
    exit 1
fi

if ! install_requirements;then
    echo "Installation failed"
    exit 1
fi

if ! restarts;then
   echo " System fault"
   exit 1
fi

if ! deploy;then
   echo "Deployment failure"
   exit 1
fi

echo "*******************DEPLOYMENT DONE**********************************"
