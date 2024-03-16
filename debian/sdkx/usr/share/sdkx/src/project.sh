#!/bin/bash

# Überprüfe, ob genügend Argumente übergeben wurden
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <project_name> <package_name>"
    exit 1
fi

# Projektname und Paketname aus den Argumenten extrahieren
project_name=$1
package_name=$2

# Verzeichnis erstellen und in das Projektverzeichnis wechseln
project_dir="$HOME/$project_name"
mkdir -p "$project_dir"
cd "$project_dir" || exit

# Erstelle die Grundstruktur des Projekts
mkdir -p app/src/main/java/"${package_name//.//}" app/src/main/res/values app/src/main/res/values-night

# Erstelle die erforderlichen Dateien
touch app/src/main/AndroidManifest.xml
touch app/src/main/res/values/strings.xml
touch app/src/main/res/values/styles.xml
touch app/src/main/res/values/colors.xml
touch app/src/main/res/values-night/themes.xml
touch app/src/main/res/values-night/styles.xml
touch app/src/main/res/values-night/colors.xml
touch app/src/main/res/values-night/themes.xml

# Weitere Verarbeitung, falls erforderlich
