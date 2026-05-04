#!/bin/bash

clone() {
        echo "cloning the code"
        if [[ -d "django-notes-app" ]];then
                echo "the code dir already exist"
                cd django-notes-app
        else
                git clone https://github.com/LondheShubham153/django-notes-app.git
                cd django-notes-app
        fi
}


install_req() {
        echo "installing dependencies"
        sudo apt-get update -y
        sudo apt-get install -y docker.io nginx
}

setup_venv() {
        echo "setting up venv"

        if [[ ! -d "venv" ]];then
                python3 -m venv venv
        fi

        source venv/bin/activate
        pip install --upgrade pip
        pip install -r requirements.txt
}
req_restart() {
        sudo chown $USER:$USER /var/run/docker.sock
        sudo service docker start
        sudo service nginx start
}

deploy() {
        docker build -t notes-app .
        docker run -d -p 8000:8000 notes-app:latest
}

echo "==========DEPLOYMENT STARTED=========="

if [[ -d "django-notes-app" ]]; then
        echo "the code dir already exist"
        cd django-notes-app
else
        clone
        cd django-notes-app
fi

if ! install_req; then
        echo "Installation Failed"
        exit 1
fi

echo "==========deployment strted=========="

clone

if ! install_req; then
        echo "Installation Failed"
        exit 1
fi

setup_venv
req_restart
deploy

echo "==========DEPLOYMENT DONE=========="
