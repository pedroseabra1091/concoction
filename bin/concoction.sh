#!/bin/bash

# Assign and capitalize target app name
target_app_name=$1
target_app_name_c="$(tr a-z A-Z <<< ${target_app_name:0:1})${target_app_name:1}"

# Rename the project root directory
mv ../concoction ../${target_app_name}
echo -e '\nRoot directory renamed ✓\n'

# Remove .git folder and init a new repo
rm -rf .git && git init
echo -e '\nNew repo initiated ✓\n'

# Search and replace all occurrences
LC_ALL=C find . -iname "*concoction*" -not -path './.git/*' | while read f; do mv $f $(echo $f | sed "s/concoction/${target_app_name_c}/"); done
echo -e '\nProject file directories renamed ✓\n'

LC_ALL=C find . -not -path './assets/*' -and -not -path './.git/*' -exec sed -i '' -e "s/concoction/${target_app_name}/g" -e "s/Concoction/${target_app_name_c}/g" {} \;
echo -e '\nCode ocurrences renamed ✓\n'

./setup
echo -e '\nSetup complete! ✓\n'

