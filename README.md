# docker-postgres-backup
postgres container based in debian bullseye with autopostgesbackup.
I need as container because, autopostgresqlbackup is missing in bullseye.

## sources
* https://salsa.debian.org/kolter/autopostgresqlbackup
* https://github.com/docker-library/postgres/tree/master/13/bullseye
* https://github.com/k0lter/autopostgresqlbackup

## volumes
* /var/lib/autopostgresqlbackup

## build
`docker build --no-cache -t proofy/postgres-13-bullseye-apb:latest . `

## run
`docker run --name postgres13 -d -p 5432:5432 -v ofbizpostgresbackup:/var/lib/autopostgresqlbackup  proofy/postgres-13-bullseye-apb`

for more options:
* https://hub.docker.com/_/postgres/

## TODO
* config smarthost for email logging
