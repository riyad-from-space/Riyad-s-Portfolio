# How to Add Project Images

## Structure
```
assets/images/
├── profile.jpeg          (already exists)
└── projects/
    ├── ezycourse_cover.png       (optional - 1080x1920)
    ├── ezycourse_screenshot_1.png
    ├── ezycourse_screenshot_2.png
    ├── ezycourse_screenshot_3.png
    └── (up to 5 screenshots per project)
```

## Steps to Add Images

### 1. Prepare Your Images
- Cover image: 1080x1920px (portrait, project showcase)
- Screenshots: 1080x1920px (app screenshots)
- Format: PNG or JPEG

### 2. Place Them in `assets/images/projects/`

### 3. Update `lib/data/portfolio_data.dart`

Uncomment and set paths for any project:

```dart
ProjectModel(
  title: 'EzyCourse – SaaS Platform',
  description: '...',
  technologies: [...],
  playStoreLink: '...',
  appStoreLink: '...',
  coverImage: 'assets/images/projects/ezycourse_cover.png',
  screenshots: [
    'assets/images/projects/ezycourse_screenshot_1.png',
    'assets/images/projects/ezycourse_screenshot_2.png',
    'assets/images/projects/ezycourse_screenshot_3.png',
    'assets/images/projects/ezycourse_screenshot_4.png',
    'assets/images/projects/ezycourse_screenshot_5.png',
  ],
),
```

### 4. Make Sure `pubspec.yaml` Includes the Assets

Already configured:
```yaml
assets:
  - assets/
  - assets/images/
  - assets/images/projects/
```

### 5. Run & Test

```bash
flutter clean
flutter pub get
flutter run
```

## Tips
- If an image path doesn't exist, it shows a graceful placeholder with an icon
- You can add images incrementally
- Max 5 screenshots recommended
- Remove screenshots list if you don't want them displayed

