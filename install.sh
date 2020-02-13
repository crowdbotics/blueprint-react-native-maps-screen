#!/bin/bash

# Initialize basic vars and helpers
source blueprint-lib/init.sh

##
# Add dependencies here
##

# source blueprint-lib/docker.sh

##
# ADD BLUEPRINT CODE BELOW HERE
#
# BASE_PATH is the full path to the project root
# APP_NAME is the name of the Django app that will be modified
##

BLUEPRINT="$3"
NAME="$4"

if [ -z "$BLUEPRINT" ]
then
    BLUEPRINT="Maps"
fi

if [ -z "$NAME" ] 
then
    NAME="Maps"
fi

EXT_POINT_1="@BlueprintInsertion"
EXT_POINT_2="@BlueprintImportInsertion"
EXT_POINT_3="@BlueprintNavigationInsertion"
DATA_1="{ name: '${NAME}', human_name: '${NAME}', access_route: '${NAME}', icon: 'map'},"
DATA_2="import { ${NAME}Navigator } from '..\/features\/${NAME}\/navigator';"
DATA_3="${NAME}: { screen: ${NAME}Navigator },"

echo "create blueprint folder"
mkdir -p $BASE_PATH/src/features/$NAME

echo "copy"
cp -r ./$NAME/. $BASE_PATH/src/features/$NAME

echo ">> insert 1" 
sed -i "s/${EXT_POINT_1}/&\n${DATA_1}/g" $BASE_PATH/src/config/installed_blueprints.js

echo ">> insert 2"
sed -i "s/${EXT_POINT_2}/&\n${DATA_2}/g" $BASE_PATH/src/navigator/mainNavigator.js

echo ">> insert 3"
sed -i "s/${EXT_POINT_3}/&\n${DATA_3}/g" $BASE_PATH/src/navigator/mainNavigator.js
