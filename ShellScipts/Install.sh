#!/bin/bash
# A script to download and install Java on Unix

# Set the URL of the JDK tar.gz file to download
JDK_URL="https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_linux-x64_bin.tar.gz"

# Set the Java installation directory
JAVA_DIR="/usr/lib/jvm"

# Create a temporary directory for downloading the JDK file
TMP_DIR=$(mktemp -d)

# Download the JDK file to the temporary directory
wget -O $TMP_DIR/jdk.tar.gz $JDK_URL

# Create the Java installation directory if it does not exist
sudo mkdir -p $JAVA_DIR

# Extract the JDK file to the Java installation directory
sudo tar -xvzf $TMP_DIR/jdk.tar.gz -C $JAVA_DIR

# Find the extracted JDK directory name
JDK_DIR=$(find $JAVA_DIR -maxdepth 1 -type d -name "jdk*")

# Set the JAVA_HOME environment variable
export JAVA_HOME=$JDK_DIR

# Add the JAVA_HOME/bin to the PATH environment variable
export PATH=$PATH:$JAVA_HOME/bin

# Check the Java version
java -version

# Remove the temporary directory
rm -rf $TMP_DIR
