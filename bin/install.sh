#!/bin/bash

asdf plugin-add erlang
echo '\nErlang plugin installed ✓\n'

asdf plugin-add elixir
echo '\nElixir plugin installed ✓\n'

asdf plugin-add nodejs
echo '\nNodeJS plugin installed ✓\n'

asdf install erlang 22.3.1
echo '\nErlang 22.3.1 installed ✓\n'

asdf install elixir 1.12.3
echo '\nElixir 1.12.3 installed ✓\n'

asdf install nodejs 16.0.0
echo '\nNodeJS 16.0.0 installed ✓\n'

asdf local erlang 22.3.1
echo '\nErlang 22.3.1 locally set ✓\n'

asdf local elixir 1.12.3
echo '\nElixir 1.12.3 locally set ✓\n'

asdf local nodejs 16.0.0
echo '\nNodeJS 16.0.0 installed ✓\n'