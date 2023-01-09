#!/bin/bash

# Create environment skeleton file
cp .env.local.example .env.local
echo -e '\n Environment skeleton file created ✓\n'

# Install rebar and hex
mix local.rebar --force
mix local.hex --force
echo -e '\n Rebar and hex installed ✓\n'

# Source environment file and download dependencies
source .env.local && mix deps.get
echo -e '\n Elixir dependencies downloaded ✓\n'

# Download frontend dependencies
cd assets/ && yarn
echo -e '\n Javascript dependencies downloaded ✓\n'

# Create and migrate database
mix ecto.create
mix ecto.migrate
echo -e '\n Database created and migrated ✓\n'

echo "Setup Complete"