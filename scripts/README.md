# QuizTonic - Build & Test Scripts

This directory contains automation scripts for building, testing, and deploying QuizTonic across different platforms.

## 📋 Table of Contents

- [Available Scripts](#available-scripts)
- [Prerequisites](#prerequisites)
- [Build Scripts](#build-scripts)
- [Local Testing Scripts](#local-testing-scripts)
- [API Testing](#api-testing)
- [Troubleshooting](#troubleshooting)

## Available Scripts

| Script | Description |
|--------|-------------|
| `build_ios.sh` | Check iOS configuration and build for iOS |
| `build_android.sh` | Check Android configuration and build for Android |
| `build_web.sh` | Check web configuration and build for web |
| `test_local_mobile_ios.sh` | Build and launch on iOS simulator |
| `test_local_mobile_android.sh` | Build and launch on Android emulator |
| `test_local_web.sh` | Build and launch web app on localhost |
| `api_test.sh` | Check health of QuizTonic API |

## Prerequisites

### All Platforms
- **Flutter SDK**: Install from [flutter.dev](https://flutter.dev/docs/get-started/install)
- **Git**: For version control

### iOS Development (macOS only)
- **Xcode**: Install from App Store
- **CocoaPods**: `sudo gem install cocoapods`
- **iOS Simulator**: Included with Xcode

### Android Development
- **Android Studio**: Install from [developer.android.com](https://developer.android.com/studio)
- **Android SDK**: Configure via Android Studio
- **Android Emulator**: Create via Android Studio AVD Manager
- **Environment Variables**:
  ```bash
  export ANDROID_HOME=$HOME/Library/Android/sdk
  export PATH=$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
  ```

### Web Development
- **Chrome/Chromium**: For testing
- **Flutter Web**: Enable with `flutter config --enable-web`

## Build Scripts

### iOS Build

```bash
./scripts/build_ios.sh
```

**What it does:**
- ✅ Checks Flutter, Xcode, and CocoaPods installation
- ✅ Verifies iOS project configuration
- ✅ Checks Firebase configuration (`GoogleService-Info.plist`)
- ✅ Installs dependencies and CocoaPods
- ✅ Builds release iOS app

**Output:** `build/ios/iphoneos/Runner.app`

**Next steps:**
1. Open Xcode: `open ios/Runner.xcworkspace`
2. Select your device/provisioning profile
3. Archive and upload to App Store Connect

### Android Build

```bash
./scripts/build_android.sh
```

**What it does:**
- ✅ Checks Flutter and Android SDK installation
- ✅ Verifies Android project configuration
- ✅ Checks Firebase configuration (`google-services.json`)
- ✅ Checks signing configuration (warns if missing)
- ✅ Installs dependencies
- ✅ Builds both APK and App Bundle

**Output:**
- APK: `build/app/outputs/flutter-apk/app-release.apk`
- App Bundle: `build/app/outputs/bundle/release/app-release.aab`

**Next steps:**
1. Test APK on a device
2. Upload App Bundle (.aab) to Google Play Console

### Web Build

```bash
./scripts/build_web.sh
```

**What it does:**
- ✅ Checks Flutter installation and web support
- ✅ Verifies web project files
- ✅ Checks Firebase web configuration
- ✅ Installs dependencies
- ✅ Builds optimized web app with CanvasKit renderer

**Output:** `build/web/`

**Next steps:**
1. Test locally: `./scripts/test_local_web.sh`
2. Deploy to hosting:
   - Firebase: `firebase deploy --only hosting`
   - Netlify: `netlify deploy --dir=build/web --prod`
   - GitHub Pages: Copy `build/web/*` to gh-pages branch

## Local Testing Scripts

### iOS Simulator

```bash
./scripts/test_local_mobile_ios.sh
```

**What it does:**
- Starts iOS Simulator (if not running)
- Installs dependencies
- Launches app on simulator with hot reload enabled

**Controls:**
- `r` - Hot reload
- `R` - Hot restart
- `q` - Quit

### Android Emulator

```bash
./scripts/test_local_mobile_android.sh
```

**What it does:**
- Starts Android Emulator (if not running)
- Installs dependencies
- Launches app on emulator with hot reload enabled

**Controls:**
- `r` - Hot reload
- `R` - Hot restart
- `q` - Quit

### Web Browser

```bash
./scripts/test_local_web.sh [port]
```

**What it does:**
- Launches web app in Chrome
- Default port: 8080 (override with argument)

**Example:**
```bash
./scripts/test_local_web.sh 3000  # Launch on port 3000
```

**Controls:**
- `r` - Hot reload
- `R` - Hot restart
- `q` - Quit

## API Testing

### Health Check

```bash
./scripts/api_test.sh [api_url]
```

**What it does:**
1. ✅ Checks basic connectivity
2. ✅ Tests GET request (expects 405)
3. ✅ Tests POST request with sample quiz generation
4. ✅ Measures response time

**Default URL:** Production API (defined in script)

**Custom URL example:**
```bash
./scripts/api_test.sh http://localhost:5050
```

**Expected results:**
- Connectivity: API is reachable
- GET request: HTTP 405 (Method Not Allowed) - expected
- POST request: HTTP 200 with quiz data
- Response time: <5s (good), 5-15s (acceptable), >15s (slow)

## Troubleshooting

### Common Issues

#### Flutter not found
```bash
# Add Flutter to PATH (add to ~/.zshrc or ~/.bashrc)
export PATH="$PATH:/path/to/flutter/bin"
```

#### CocoaPods not found (iOS)
```bash
sudo gem install cocoapods
pod setup
```

#### Android SDK not found
```bash
# Add to ~/.zshrc or ~/.bashrc
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
```

#### iOS build fails
```bash
cd ios
pod deintegrate
pod install
cd ..
flutter clean
flutter pub get
```

#### Android build fails
```bash
cd android
./gradlew clean
cd ..
flutter clean
flutter pub get
```

#### Web build fails
```bash
flutter config --enable-web
flutter clean
flutter pub get
```

#### API test fails
- Check internet connection
- Verify API URL is correct
- Check API service status on AWS Lambda Console
- Review CloudWatch logs for errors

### Firebase Configuration

#### iOS Firebase Setup
1. Download `GoogleService-Info.plist` from Firebase Console
2. Place in `ios/Runner/`
3. Add to Xcode project if needed

#### Android Firebase Setup
1. Download `google-services.json` from Firebase Console
2. Place in `android/app/`

#### Web Firebase Setup
1. Get Firebase config from Firebase Console
2. Add to `web/index.html` in the Firebase initialization section

### Performance Tips

- **First build**: Will be slow (downloading dependencies)
- **Subsequent builds**: Much faster (cached dependencies)
- **Clean builds**: Use `flutter clean` if experiencing issues
- **Xcode caching**: Delete `~/Library/Developer/Xcode/DerivedData` if iOS builds fail
- **Gradle caching**: Delete `.gradle` folder if Android builds fail

## Script Maintenance

All scripts include:
- ✅ Color-coded output (red=error, green=success, yellow=warning, blue=info)
- ✅ Comprehensive error checking
- ✅ Clear error messages with solutions
- ✅ Progress indicators
- ✅ Exit on error (`set -e`)

To modify scripts:
1. Scripts are located in `scripts/` directory
2. Ensure they remain executable: `chmod +x scripts/*.sh`
3. Test after modifications
4. Update this README if behavior changes

## Related Documentation

- [Project README](../README.md)
- [API Documentation](https://github.com/Bptmn/quiztonic_api)
- [Recommendations](../recommandation.md)

## Support

For issues:
1. Check [Troubleshooting](#troubleshooting) section
2. Review Flutter documentation
3. Check project GitHub issues
4. Consult Firebase documentation for Firebase-related issues

