### **Expo RN Dev Client Autobuild Bash Script**
This Bash script automates the process of creating, setting up, and optionally building and running an Expo React Native project with the Expo Development Client.

## **Features**
✅ Automatically creates a new Expo app.  
✅ Installs required dependencies, including `expo-dev-client` and `eas-cli`.  
✅ Prepares the project for development using `expo prebuild`.  
✅ Asks whether to build and run the app.  
✅ Ensures proper file ownership for the current user.

## **Prerequisites**
Before running the script, make sure you have:  
- **Node.js** (Recommended: LTS version)  
- **npm** (comes with Node.js)  
- **npx** (included with npm)  
- **Expo CLI** (install globally using `npm install -g expo-cli`)  
- **EAS CLI** (installed by the script, but can also be installed manually with `npm install -g eas-cli`)  

## **How to Run it(Run to your Bash)**
   ```bash
   git clone https://github.com/omchaudhari1107/Expo-RN-Dev-Client-Autobuild-Bash.git
   cd Expo-RN-Dev-Client-Autobuild-Bash
  bash Build.sh
   ```

## **License**
This project is licensed under the **MIT License**.
