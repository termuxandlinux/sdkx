#!/bin/bash

# Function to install the SDK
install_sdk() {
    sdk_version=$1
    /usr/share/sdkx/src/sdk.sh --sdk $sdk_version
}

# Function to install
install() {
    /usr/share/sdkx/src/install.sh
}

# Function to forward to project.sh
create_project() {
    project_name=$1
    package_name=$2

    # Forward to project.sh with project_name and package_name
    /usr/share/sdkx/src/project.sh $project_name $package_name
}

# Function to forward to build.sh
build_project() {
    project_name=$1
    sdk_path=$2

    # Forward to build.sh with project_name and sdk_path
    /usr/share/sdkx/src/build.sh $project_name $sdk_path
}

# Function to display help
show_help() {
    echo "Usage: sdkx.sh OPTIONS"
    echo "Options:"
    echo "  --install                          Install the SDK"
    echo "  --project <project_name> <package_name> Create a new project"
    echo "  --build <project_name> <path to android.jar> Build the APK"
    echo "  --sdk <SDK version>                Install a specific SDK version"
    echo "  --help                             Display this help"
}

# Main function
main() {
    if [ "$1" == "--install" ]; then
        install
    elif [ "$1" == "--project" ]; then
        project_name=$2
        package_name=$3
        create_project $project_name $package_name
    elif [ "$1" == "--build" ]; then
        project_name=$2
        sdk_path=$3
        build_project $project_name $sdk_path
    elif [ "$1" == "--sdk" ]; then
        sdk_version=$2
        install_sdk $sdk_version
    elif [ "$1" == "--help" ]; then
        show_help
    else
        echo "Invalid option! Use --help to display the help."
    fi
}

# Call the main function with arguments
main "$@"
