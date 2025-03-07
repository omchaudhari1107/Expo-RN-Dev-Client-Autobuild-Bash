#!/bin/bash

echo "Enter your Expo app name: "
read APP_NAME

CURRENT_USER=$(whoami)

sudo npx create-expo-app "$APP_NAME" -t

cd "$APP_NAME"

sudo npm install -g eas-cli
sudo npx expo install expo-dev-client
sudo npx expo prebuild

read -p "Do you want to build and run the project? (Y/N): " RESPONSE
if [[ "$RESPONSE" == "Y" || "$RESPONSE" == "y" ]]; then
    sudo eas login
    sudo eas build --profile development --platform android
    echo "✅ Applicatio Builded.."
else
    echo "Skipping build and run process."
fi
sudo chown -R "$CURRENT_USER:$CURRENT_USER" "/home/$CURRENT_USER/Desktop/$APP_NAME"

echo "✅ Ownership updated to $CURRENT_USER."

echo "🚀 All set! Your Expo app is ready to roll. To launch it, simply run:"
echo "✨ npx expo start --dev-client ✨"
echo "Enjoy coding and happy building! 🚀🎉"
