#!/bin/bash
echo 'running start.sh'

# start node server
if [[ $NODE_ENV = production ]]
then
    node server.js
else
    npx nodemon server.js
fi