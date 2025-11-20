# Quick Start Guide - Food Delivery Customer App

## 🚀 Getting Started in 5 Minutes

---

## Prerequisites Checklist
- [ ] Flutter SDK installed (3.0.0+)
- [ ] Android Studio or VS Code installed
- [ ] Android device connected OR emulator running
- [ ] Git installed (optional)

---

## Step 1: Install Dependencies

```bash
cd customer_app_temp_7
flutter pub get
```

**Expected Output:** `Got dependencies!`

---

## Step 2: Check Connected Devices

```bash
flutter devices
```

**You should see:**
- Android device
- iOS device (Mac only)
- Chrome browser
- Edge browser

---

## Step 3: Run the App

### On Android Device/Emulator:
```bash
flutter run
```

### On Specific Device:
```bash
# List devices first
flutter devices

# Run on specific device
flutter run -d <device-id>

# Example:
flutter run -d R5CX71YWA0X
```

### On Chrome (Web):
```bash
flutter run -d chrome
```

---

## Step 4: Explore the App

### 1. **Onboarding Flow**
- View 4 onboarding screens
- Tap "Get Started"

### 2. **Authentication**
- Try Login/Sign Up screens
- Test OTP verification UI
- Password reset flow

### 3. **Main Features**
- Browse home page
- View categories
- Check restaurant details
- Add items to cart
- Test address management
- View order tracking

---

## 🛠️ Troubleshooting

### Build Failed?
```bash
flutter clean
flutter pub get
flutter run
```

### Gradle Issues?
```bash
cd android
./gradlew clean
cd ..
flutter run
```

### Dependencies Error?
```bash
flutter doctor
flutter pub upgrade --major-versions
```

---

## 📱 App Features to Test

### ✅ Must Test:
- [ ] Splash screen appears
- [ ] Onboarding screens work
- [ ] Navigation between screens
- [ ] Bottom navigation bar
- [ ] Back button works

### 🎨 UI Testing:
- [ ] All images load (placeholders)
- [ ] Fonts display correctly
- [ ] Colors match design
- [ ] Buttons are clickable
- [ ] Forms accept input

### 🗺️ Map Features:
- [ ] Address search screen
- [ ] Google Maps loads (needs API key)
- [ ] Location permission popup

---

## 🔑 Configuration Needed

### 1. Google Maps API Key

**Android:**
```xml
<!-- android/app/src/main/AndroidManifest.xml -->
<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="YOUR_API_KEY_HERE"/>
```

**iOS:**
```xml
<!-- ios/Runner/AppDelegate.swift -->
GMSServices.provideAPIKey("YOUR_API_KEY_HERE")
```

**Web:**
```html
<!-- web/index.html -->
<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY"></script>
```

### 2. Backend API URL

Create a configuration file:
```dart
// lib/config/api_config.dart
class ApiConfig {
  static const String baseUrl = 'https://your-api.com/api';
  static const String googleMapsKey = 'YOUR_GOOGLE_MAPS_KEY';
}
```

---

## 🎯 Quick Commands Reference

```bash
# Check Flutter installation
flutter doctor

# Install dependencies
flutter pub get

# Clean build
flutter clean

# Run app
flutter run

# Run on specific device
flutter run -d chrome

# Build APK (Android)
flutter build apk

# Build for iOS
flutter build ios

# Run tests
flutter test

# Analyze code
flutter analyze

# Format code
dart format .

# Fix lint issues
dart fix --apply
```

---

## 📂 Project Structure (Quick Reference)

```
lib/
├── main.dart              # App entry point
├── splash/                # Splash screen
├── onboardings/           # 4 onboarding screens
├── auth/                  # Login, signup, OTP, reset
├── home_page/             # Main home screen
├── restaurant_view/       # Restaurant details
├── product_view/          # Product details
├── cart_page/             # Shopping cart
├── checkout/              # Checkout flow
├── adress/                # Address management
├── track_order/           # Order tracking
├── profile/               # User profile
└── components/            # Reusable widgets
```

---

## 🎨 App Screens Overview

### Authentication (8 screens)
1. Splash
2-5. Onboarding 1-4
6. Login/Signup Selector
7. Login
8. Sign Up

### Main App (10+ screens)
- Home
- Categories
- Restaurant View
- Product View
- Cart
- Checkout
- Menu (Food/Beverages/Dessert)
- Profile
- Edit Profile
- More Options

### Orders (5 screens)
- Ongoing Orders
- Order History
- Track Order
- Order Arrival
- Enjoy (Success)

### Address (9 screens)
- Address List
- Address Search
- Add Home/Office/Apartment/Other
- Change Address

---

## 💡 Tips for Development

### Hot Reload
Press `r` in the terminal to hot reload changes

### Hot Restart
Press `R` (capital R) to hot restart

### Open DevTools
Press `d` to open DevTools

### Quit App
Press `q` to quit

---

## 🔗 Backend Integration Guide

### See Complete Documentation:
📖 **README_DETAILED.md** - Full API documentation

### Quick API Checklist:
- [ ] Authentication endpoints
- [ ] User profile APIs
- [ ] Restaurant listing
- [ ] Menu & products
- [ ] Order management
- [ ] Payment processing
- [ ] Real-time tracking
- [ ] Notifications

---

## 📞 Need Help?

### Resources:
- **Full Documentation:** README_DETAILED.md
- **Fixes Applied:** FIXES_APPLIED.md
- **Flutter Docs:** https://flutter.dev/docs
- **Flutter Community:** https://flutter.dev/community

### Common Questions:

**Q: App crashes on startup?**  
A: Check if all dependencies are installed: `flutter pub get`

**Q: Maps not showing?**  
A: Add Google Maps API key (see Configuration section)

**Q: Build taking too long?**  
A: First build takes 3-5 minutes. Subsequent builds are faster.

**Q: How to connect to backend?**  
A: Create API service classes and use the `http` package

---

## ✨ You're Ready!

The app is now running on your device! 🎉

**Next Steps:**
1. Explore all screens
2. Read README_DETAILED.md for backend integration
3. Configure Google Maps API
4. Start building your backend APIs
5. Connect the app to your backend

---

**Happy Coding! 🚀**
