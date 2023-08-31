#!/bin/bash

# Get the current version from pom.xml
current_version=$(mvn -f myapp/pom.xml help:evaluate -Dexpression=project.version -q -DforceStdout)

# Split the version into major, minor, and patch parts
IFS='.' read -ra version_parts <<< "$current_version"
major=${version_parts[0]}
minor=${version_parts[1]}
patch=${version_parts[2]}

# Increment the patch version by 1
new_patch=$((patch + 1))

# Set the new version using the versions plugin
mvn versions:set -DnewVersion="$major.$minor.$new_patch"

echo "Version incremented to $major.$minor.$new_patch"
