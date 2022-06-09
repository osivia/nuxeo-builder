#!/bin/bash
set -e

if [ "$1" = "start" ]; then

    echo "Installation des paquets node"

    curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash 
    source ~/.profile
    nvm install node

    sudo npm config set unsafe-perm true
    sudo npm install -g yo bower gulp grunt-cli pub

    echo "Git clone nuxeo"

    cd /opt/sources

	if [ ! -d nuxeo ]; then
        git clone https://github.com/nuxeo/nuxeo.git
    fi

    echo "Switch to HF Tag ${NX_VERSION}"

    cd nuxeo
    git checkout ${NX_VERSION}

    echo "Checkout other repos"
    python clone.py ${NX_VERSION} -a

    echo "Build maven"
    mvn clean install --settings /opt/settings.xml -T 6 --fail-at-end -Paddons,distrib -DskipTests
    
fi
