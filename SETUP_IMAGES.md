# 📸 Setup Project Images

## Current Issue
You added paths to images in `lib/data/portfolio_data.dart` but the actual image files don't exist in `assets/images/projects/`.

## Quick Fix

### Step 1: Get Your Images Ready
Save project screenshots as PNG files:
- **Cover image**: 1080×1920px (portrait orientation)
- **Screenshots**: 1080×1920px each (up to 5 per project)

### Step 2: Place Them in the Correct Folder
```bash
assets/images/projects/
├── ezycourse_cover.png
├── ezycourse_screenshot_1.png
├── ezycourse_screenshot_2.png
├── ezycourse_screenshot_3.png
└── ezycourse_screenshot_4.png
```

### Step 3: Update `lib/data/portfolio_data.dart`

Find the EzyCourse project and uncomment the image lines:

```dart
ProjectModel(
  title: 'EzyCourse – SaaS Platform',
  description: '...',
  technologies: [...],
  playStoreLink: '...',
  appStoreLink: '...',
  coverImage: 'assets/images/projects/ezycourse_cover.png',  // ✅ Uncomment
  screenshots: [                                              // ✅ Uncomment
    'assets/images/projects/ezycourse_screenshot_1.png',
    'assets/images/projects/ezycourse_screenshot_2.png',
    'assets/images/projects/ezycourse_screenshot_3.png',
    'assets/images/projects/ezycourse_screenshot_4.png',
  ],
),
```

### Step 4: Run Flutter
```bash
flutter clean
flutter pub get
flutter run
```

## If You Don't Have Images Yet

Leave the project without images for now:

```dart
ProjectModel(
  title: 'EzyCourse – SaaS Platform',
  description: '...',
  technologies: [...],
  playStoreLink: '...',
  appStoreLink: '...',
  // No coverImage or screenshots - will show gradient placeholder
),
```

The card will display a nice gradient placeholder instead.

## Image Best Practices
- **Format**: PNG (transparent bg) or JPEG
- **Size**: 1080×1920 works best (phone aspect ratio)
- **Quality**: Optimize to reduce file size
- **Naming**: Use `{project_name}_screenshot_1.png`, etc.

## Supported Per Project
- ✅ 1 cover image (optional)
- ✅ Up to 5 screenshots (optional)
- ✅ If missing: shows colored gradient placeholder

Done! 🎉
