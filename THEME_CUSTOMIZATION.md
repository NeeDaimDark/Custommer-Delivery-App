# Theme and Branding Customization Guide

## 🎨 Changes Applied

### 1. **Color Theme Update**

**New Color Scheme (Orange/Warm Theme):**
- **Primary Color**: `#FF6B35` - Vibrant Orange
- **Secondary Color**: `#FFF8F3` - Soft Cream
- **Tertiary Color**: `#FFB088` - Light Orange
- **Accent Colors**: Warm orange tones
- **Success**: `#28A745` - Green
- **Warning**: `#FFC107` - Amber
- **Error**: `#DC3545` - Red

**Previous Colors (Teal/Cyan Theme):**
- Primary: `#71C9CE` - Teal
- Secondary: `#E3FDFD` - Light Cyan
- Tertiary: `#A6E3E9` - Light Teal

### 2. **App Branding**

**Changed:** "GenZ Delivery" → **"My Delivery App"**

**Files Modified:**
- `lib/splash/splash/splash_widget.dart`

### 3. **Image Assets System**

Created a centralized image configuration file:
`lib/config/image_assets.dart`

**Image Categories Available:**
- 🍔 Food Items (8 images)
- 🏪 Restaurants (4 images)
- 🚴 Delivery & Service (3 images)
- 🎯 Categories (4 images)
- 👤 User/Profile (3 images)
- 🎨 Backgrounds (2 images)
- 📱 Onboarding (4 images)
- 🎁 Promo/Offers (2 images)
- 💳 Payment (2 images)
- 📭 Empty States (3 images)

**Updated Splash Screen Images:**
- Background: Food pattern from Unsplash
- Logo: Delivery scooter image from Unsplash

---

## 🎯 How to Customize Further

### Change Theme Colors

Edit: `lib/flutter_flow/flutter_flow_theme.dart`

```dart
// Light Mode Theme (Line ~130)
late Color primary = const Color(0xFFYOUR_COLOR);
late Color secondary = const Color(0xFFYOUR_COLOR);
late Color tertiary = const Color(0xFFYOUR_COLOR);
```

**Color Picker Tool:** https://htmlcolorcodes.com/

### Change App Name

**In Code:**
Search and replace in all files:
- Find: "My Delivery App"
- Replace with: "Your App Name"

**Main files to check:**
- `lib/splash/splash/splash_widget.dart`
- `android/app/src/main/AndroidManifest.xml` (for Android app name)
- `ios/Runner/Info.plist` (for iOS app name)

### Use Image Assets

**Import the image config:**
```dart
import 'package:customer_app_temp_7/config/image_assets.dart';
```

**Use in your widgets:**
```dart
Image.network(
  ImageAssets.burger,
  width: 200,
  height: 200,
)

// Or for random food images
Image.network(
  ImageAssets.foodImages[Random().nextInt(ImageAssets.foodImages.length)],
)
```

---

## 📝 Recommended Customizations

### 1. **Add Your Own Logo**

**Option A: Use Asset Image**
```dart
// Place your logo in assets/images/logo.png
Image.asset(
  'assets/images/logo.png',
  width: 250,
  height: 250,
)
```

**Option B: Keep Using Network Image**
```dart
Image.network(
  'YOUR_LOGO_URL',
  width: 250,
  height: 250,
)
```

### 2. **Update App Name in Configuration**

**Android (`android/app/src/main/AndroidManifest.xml`):**
```xml
<application
    android:label="My Delivery App"
    ...>
```

**iOS (`ios/Runner/Info.plist`):**
```xml
<key>CFBundleName</key>
<string>My Delivery App</string>
<key>CFBundleDisplayName</key>
<string>My Delivery App</string>
```

**pubspec.yaml:**
```yaml
name: my_delivery_app  # Change this too
description: My custom food delivery application
```

### 3. **Update Package Name/Bundle ID**

For a complete rebrand, change package names:

**Android:** `android/app/build.gradle`
```gradle
applicationId "com.yourcompany.mydeliveryapp"
```

**iOS:** Update in Xcode or `ios/Runner.xcodeproj`

---

## 🎨 Color Palette Options

### Option 1: Blue Theme (Professional)
```dart
primary = Color(0xFF2196F3)     // Blue
secondary = Color(0xFFF5F9FF)   // Light Blue
tertiary = Color(0xFF64B5F6)    // Sky Blue
```

### Option 2: Green Theme (Fresh)
```dart
primary = Color(0xFF4CAF50)     // Green
secondary = Color(0xFFF1F8F4)   // Light Green
tertiary = Color(0xFF81C784)    // Light Green
```

### Option 3: Purple Theme (Modern)
```dart
primary = Color(0xFF9C27B0)     // Purple
secondary = Color(0xFFF8F3F9)   // Light Purple
tertiary = Color(0xFFBA68C8)    // Light Purple
```

### Option 4: Red Theme (Bold) - Current
```dart
primary = Color(0xFFFF6B35)     // Orange-Red
secondary = Color(0xFFFFF8F3)   // Cream
tertiary = Color(0xFFFFB088)    // Light Orange
```

---

## 🖼️ Image Guidelines

### Recommended Image Sizes:
- **Logos**: 500x500px (square)
- **Banners**: 1200x400px (3:1 ratio)
- **Food Items**: 500x500px (square)
- **Restaurants**: 800x500px (16:10 ratio)
- **Profile Photos**: 400x400px (square)
- **Backgrounds**: 1200x800px

### Image Sources:
- **Unsplash**: https://unsplash.com (Free, high-quality)
- **Pexels**: https://pexels.com (Free stock photos)
- **Pixabay**: https://pixabay.com (Free images)

### Using Your Own Images:

1. **Add to assets folder:**
   ```
   assets/images/your-image.jpg
   ```

2. **Update pubspec.yaml** (already configured):
   ```yaml
   assets:
     - assets/images/
   ```

3. **Use in code:**
   ```dart
   Image.asset('assets/images/your-image.jpg')
   ```

---

## 🔄 Apply Changes

After making changes:

```bash
# Hot reload (press 'r' in terminal)
# OR
# Hot restart (press 'R' in terminal)
# OR
# Full restart:
flutter run -d R5CX71YWA0X
```

---

## 📱 Current App Status

✅ **Theme**: Updated to warm orange/red theme  
✅ **Branding**: Changed to "My Delivery App"  
✅ **Images**: Splash screen using real placeholder images  
✅ **Image System**: Centralized image configuration created  
✅ **Ready**: App is running with new branding

---

## 🎯 Next Steps

1. **Test the new theme** - Check all screens for color consistency
2. **Add your own images** - Replace placeholder images with branded images
3. **Update app icons** - Create launcher icons for Android & iOS
4. **Update splash screen** - Customize the loading screen
5. **Configure notifications** - Set up push notification icons

---

**Last Updated:** November 20, 2025  
**Theme Version:** 2.0 (Orange Theme)  
**App Name:** My Delivery App
