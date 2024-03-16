#!/bin/bash

# Überprüfe, ob genügend Argumente übergeben wurden
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <project_name> <sdk_path>"
    exit 1
fi

# Projektname und Pfad zur .jar-Datei der SDK-Version aus den Argumenten extrahieren
project_name=$1
sdk_path=$2

# Verzeichnis des Projekts im Home-Verzeichnis finden
project_dir="$HOME/$project_name"

# Überprüfen, ob das Projektverzeichnis existiert
if [ ! -d "$project_dir" ]; then
    echo "Projektverzeichnis nicht gefunden: $project_dir"
    exit 1
fi

# Ableitung des Package-Namens
package_name=$(find "$project_dir/app/src/main/java" -type f -name "*.java" | sed -n 's/.*\/\([^\/]*\)\/\([^\/]*\)\/\([^\/]*\)\.java/\1/p')

# APK mit aapt bauen
aapt package -f -M "$project_dir/app/src/main/AndroidManifest.xml" -I "$sdk_path" -F "$project_dir/Ausgabedatei.apk" -S "$project_dir/app/src/main/res" -A "$project_dir/app/src/main/assets" -I "$project_dir/app/src/main/java/$package_name" -m

echo "APK erfolgreich erstellt: $project_dir/Ausgabedatei.apk"
