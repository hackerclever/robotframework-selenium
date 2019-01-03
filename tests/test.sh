#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
echo "dir" 
echo $DIR

export image=""
export version=""

browsers=(
    "chrome"
)

docker-compose up -d demoapp

for browser in "${browsers[@]}"; do
    image="robotframework-selenium-${browser}"
    docker-compose build pybot
    docker-compose run pybot -v BROWSER:${browser} --outputdir /out /tests
done

docker-compose down -v
