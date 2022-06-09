# nuxeo-builder
Ce projet permet de builder une distribution native nuxeo et de la déposer dans le repository local de maven afin de l'exploiter dans un projet maven custom

## usage
* modifier le tag souhaité dans le fichier nx-builder / DockerFile (variable NX_VERSION)
* vérifier le chemin du repository maven dans le fichier compose / docker-compose.yml (par défaut ~/.m2/repository)
* dans le dossier compose : lancer docker-compose build && docker-compose up

Remarque : certains projets node ne buildent pas mais ne sont pas requis.





