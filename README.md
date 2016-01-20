# ispmail
A containerized implmentation of https://workaround.org/ispmail

This is a collection of scripts and modifications to official Dockerhub images geared to easily set up or replace all the components in the workaround.org ispmail tutorials. 

This work provides several advantages for anyone attempting to run or scale the stack that Christoph Haas has worked so hard to document and test. I _strongly_ suggest that anyone wanting to deploy this stack first read through and understand the components of his tutorial. With a solid basis there, you would turn to containerization to: 

* Deploy his tutorial using Debian packages on a non-Debian system. 
* Scale out one component of the system onto multiple machines easily. e.g. More compute for SpamAssassin. 

## Getting Started

### Requirements
* Docker 

### Containers
The ispmail stack consists of 4 required processes:
* MySQL
* Postfix
* Dovecot
* SpamAssassin

And several optional processes:
* Roundcube
* PhpMyAdmin

This implementation also makes use of a worker image for running one off scripts against the stack such as adding an email user, new domain, training SpamAssassin on junk mail, etc. 

### First time setup

On a brand new machine with docker installed getting up and running should be as easy as running the `bootstrap.sh` script and answer the questions it asks you. You should only need to run bootstrap.sh once if it has completed successfully.

If you want to use a container orchestration suite such as Rancher, Kubernetes, or Docker Control Plane you'll need to generate the configuration for those on your own.

### Major Differences & Notes

In several places I diverged from the tutorial where it made sense. 

* MySQL is 5.7 not 5.5. There isn't a compelling reason to need to track Debian's version of MySQL, when a more up-to-date version maintained directly by the MySQL team with which to work. 
* Postfix runs with the -d flag. This is considered bad practice in production, but as far as I can tell is just fine while we're capturing that output to logging from the container anyway.


