#!/bin/bash
heroku pg:reset --confirm cs542-project-db

heroku pg:psql -f generateTables.sql

heroku pg:psql -f copyTables.sql
