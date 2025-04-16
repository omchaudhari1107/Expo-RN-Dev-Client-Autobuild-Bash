#!/bin/bash

# Ask for the app name
read -p "Enter your Expo app name: " app_name

# Check for empty input
if [ -z "$app_name" ]; then
  echo "App name cannot be empty."
  exit 1
fi

# Step 1: Create Expo app with template option
echo "Creating Expo app '$app_name'..."
npx create-expo-app "$app_name" -t

cd "$app_name" || { echo "Failed to change directory to $app_name"; exit 1; }

# Step 2: Install EAS CLI globally
echo "Installing EAS CLI..."
npm install -g eas-cli

# Step 3: Install expo-dev-client
echo "Installing expo-dev-client..."
npx expo install expo-dev-client

# Step 4: Prebuild the app
echo "Running expo prebuild..."
npx expo prebuild

# Step 5: Ask to build and run
read -p "Do you want to build the dev client and start Expo? (y/n): " build_choice

if [[ "$build_choice" == "y" || "$build_choice" == "Y" ]]; then
  echo "Building dev client..."
  eas build --profile development --platform android
  echo "Starting Expo with dev client..."
  npx expo start --dev-client
else
  echo "Skipping build and start."
fi