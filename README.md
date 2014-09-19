Projet de Johnny Cottereau et Kevin Verschaeve

## But
Utiliser le sdk pour PHP d'amazon et capistrano pour deployer une application sur différents serveurs

L'application déployée n'est pas le plus important.
Ici on s'est interressé au deploiement

## Notre "appli"
### ["pre deploiement"](https://github.com/johnny1991/capistrano) https://github.com/johnny1991/capistrano
### ["repopourri"](https://github.com/kevin-verschaeve/repopourri) https://github.com/kevin-verschaeve/repopourri

Le repo 'repopourri' est le code mis en production

Le repo 'pre deploiement' est une interface permettant de visualiser nos instances, ELB, launch configuration... comme la console d'amazon

Il permet aussi:
* d'initialiser le processus de deploiement : créer un ELB, les metrics/alarmes, l'autoscaling
* mettre a jour la liste des serveurs

L'architecture AWS comporte donc au minimum 2 instances, un ELB qui contient nos instances (et celles qui sont créées à la volées), un auto scaling group, une launch configuration avec un script de deploiement de code, deux alarmes qui surveillent l'utilisation du CPU des instances et qui en ajoute ou en retire en fonction

Pour deployer avec capistrano, il est nécéssaire de l'installer et le configurer

1-click (et 1-command) release :
Une fois la liste des serveurs mise a jour, on lance la commande `cap production deploy` dans un terminal
