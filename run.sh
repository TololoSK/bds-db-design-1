#!/bin/bash
if [[ "$1" == "pg" ]]
then
    export FLYWAY_PLACEHOLDERS_AUTOINCREMENT="SERIAL PRIMARY KEY NOT NULL"
    export FLYWAY_URL="jdbc:postgresql://localhost:5432/airport"
elif [[ "$1" == "mysql" ]]
then
    export FLYWAY_PLACEHOLDERS_AUTOINCREMENT="INT NOT NULL AUTO_INCREMENT PRIMARY KEY"
    export FLYWAY_URL="jdbc:mysql://localhost:3306/airport"
fi
shift
flyway -configFiles="flyway.conf" "$@"