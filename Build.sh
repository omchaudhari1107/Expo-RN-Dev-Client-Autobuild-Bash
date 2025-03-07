#!/bin/bash

echo "Enter your Expo app name: "
read APP_NAME

CURRENT_USER=$(whoami)
PROJECT_PATH="./$APP_NAME"

npx create-expo-app "$PROJECT_PATH" -t || { echo "❌ Failed to create Expo app."; exit 1; }

sudo chown -R "$CURRENT_USER:$CURRENT_USER" "$PROJECT_PATH"
echo "✅ Ownership updated to $CURRENT_USER."

cd "$PROJECT_PATH" || { echo "❌ Failed to navigate to project directory."; exit 1; }

sudo npm install -g eas-cli
sudo npx expo install expo-dev-client
sudo npx expo prebuild || { echo "❌ Expo prebuild failed."; exit 1; }

read -p "Do you want to build the project? (Y/N): " RESPONSE
if [[ "$RESPONSE" =~ ^[Yy]$ ]]; then
    
    sudo eas build --profile development --platform android || { echo "❌ Build failed."; exit 1; }
    echo "✅ Application built successfully!"
else
    echo "Skipping build process."
fi


echo -e "\n🚀 All set! Your Expo app is ready to go."
echo -e "✨ To launch your app, run:\n"
echo -e "            npx expo start --dev-client\n"
echo -e "Happy coding! 🚀🎉"
