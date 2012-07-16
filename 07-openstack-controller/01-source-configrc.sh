#!/bin/sh

echo "To make the environmental variables available in the current session, run: "
echo ". 01-source-configrc.sh"

# Export the variables defined in ../config/configrc
. ../config/configrc
