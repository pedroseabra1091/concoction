#!/bin/bash

# Execute migrations
/app/bin/concoction eval "Concoction.Release.migrate"

# Starts the system
# TODO: Not working properly – exits with code 0.
# /app/bin/concoction eval "Concoction.Release.start_app"
exec bin/concoction start

