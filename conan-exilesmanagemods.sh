#!/bin/bash

cd ./conan-exiles/443030/ConanSandbox/Mods || exit 0

echo "Generating modlist.txt ..."
> modlist.txt

find . -maxdepth 1 -mindepth 1 -type d | while read -r modDir; do
  modID=$(basename "$modDir")
  pakFile=$(find "$modDir" -maxdepth 1 -type f -name '*.pak' | head -n 1)

  if [ -n "$pakFile" ]; then
    echo "$modID/$(basename "$pakFile")" >> modlist.txt
  else
    echo "No .pak file in ConanSandbox/Conan/$modID, skipping"
  fi
done

echo "Done"
exit 0
