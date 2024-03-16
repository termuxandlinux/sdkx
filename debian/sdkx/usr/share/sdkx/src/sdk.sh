#!/bin/bash

# Function to install SDK version
install_sdk() {
    sdk_version=$1
    sdkmanager "platforms;android-$sdk_version"
}

# Main function
main() {
    if [ "$1" == "--sdk" ]; then
        sdk_version=$2
        install_sdk $sdk_version
    else
        echo "Invalid option! Use --sdk {SDK version} to install a specific SDK version."
    fi
}

# Call the main function with arguments
main "$@"
