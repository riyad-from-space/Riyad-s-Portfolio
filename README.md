# Riyad's Portfolio

A single-page personal portfolio for Riyad Ahmed Sagor, a Flutter engineer, built with Flutter Web and hosted on Firebase Hosting.

**Live site: [riyad-portfolio-f18db.web.app](https://riyad-portfolio-f18db.web.app)**

![Flutter Web](https://img.shields.io/badge/Flutter-Web-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3-0175C2?logo=dart&logoColor=white)
![Firebase Hosting](https://img.shields.io/badge/Firebase-Hosting-FFCA28?logo=firebase&logoColor=black)

<!-- Screenshot: add a desktop screenshot here, e.g. <img src="screenshots/desktop.png" width="800"> -->

## Sections

The page scrolls top to bottom in this order:

| Section | What it shows |
| --- | --- |
| Hero | Profile photo, name, role and contact chips (email, phone, LinkedIn, GitHub, location, résumé) |
| About | A short professional summary |
| Skills | Technical skill cards, plus programming languages with proficiency levels |
| Experience | Roles drawn as a vertical timeline, with bullet points per role |
| Languages | Spoken languages |
| Projects | Project cards with tech chips and store/GitHub links |
| Education | Degree, institute, dates and CGPA |
| Footer | "Built with Flutter" line |

## Features

- **Navigation bar fixed at the top.** It stays in place while the content scrolls. Clicking a section label smooth-scrolls to that section (600 ms, ease-in-out).
- **Light / dark toggle.** One button switches between the two themes. The site opens in light mode.
- **Accent colour picker.** A palette menu offers 8 accent colours (Teal is the default). The whole UI recolours when you pick one.
- **Responsive layout.** There are three breakpoints: mobile under 600 px, tablet under 1200 px and desktop above that. Page padding, font sizes and grid columns change with the breakpoint (skills: 1/2/3 columns; projects: 1/2/2). On mobile the nav labels move to a horizontally scrolling row and the experience timeline line is hidden.
- **Project cards:**
  - Icon buttons for Play Store, App Store, GitHub and Web, each shown only if that link is set. Links open in a new tab.
  - A cover image if one is set. Otherwise the card shows a gradient placeholder generated from the project title.
  - An optional screenshot gallery dialog with arrows, dot indicators and a thumbnail strip. It appears only when a project lists screenshots.
- **Hover effects.** Skill, experience and project cards lift slightly on hover, and contact and nav chips highlight.
- **Typography.** Poppins, loaded through `google_fonts`.

## Customise it

Almost all content comes from one file: **`lib/data/portfolio_data.dart`**. To make the site your own, start there:

- `name`, `role`, `summary` for the hero and the About section
- `technicalSkills`, `programmingLanguages`, `spokenLanguages`
- `experiences` (a list of `ExperienceModel`: title, company, period, bullets)
- `projects` (a list of `ProjectModel`: title, description, technologies, and optionally `playStoreLink`, `appStoreLink`, `githubLink`, `webLink`, `coverImage`, `screenshots`)
- `education`

Some text is hard-coded in widgets instead of coming from the data file:

- **Hero contact chips:** email, phone, LinkedIn, GitHub, location and résumé URL are written directly in `lib/widgets/hero_section.dart`. The matching fields in `portfolio_data.dart` are not used yet, so edit both files.
- **Section headings and order:** set in `lib/screens/portfolio_screen.dart`. The nav labels come from `sectionLabels`, but each one is tied to a section by index in this file. If you add or remove a label, update the screen too.
- **Other hard-coded text:** the "R." logo is in `lib/widgets/nav_bar.dart` and the footer text is in `lib/widgets/footer.dart`.
- **Page metadata:** the browser title is in `lib/main.dart`. The SEO, Open Graph tags and PWA name are in `web/index.html` and `web/manifest.json`.

**Images:**

- The profile photo is `assets/images/profile.png`.
- Project covers and screenshots go in `assets/images/projects/`. Reference them by path in `coverImage` / `screenshots`.
- If a path doesn't exist, the card falls back to its placeholder.
- See `IMAGES_GUIDE.md` for suggested sizes.

**Colours and theme:**

- `lib/config/app_colors.dart` holds the accent options (the first one is the default) and the light and dark palettes.
- `lib/config/app_theme.dart` builds the Material 3 themes and responsive text sizes.
- The font name is set in `lib/main.dart`.

## Project structure

```text
lib/
├── main.dart                  # App entry; holds theme mode + accent state, ScreenUtil setup
├── config/
│   ├── app_colors.dart        # Accent options and light/dark palettes
│   └── app_theme.dart         # Light/dark ThemeData, responsive text styles
├── data/
│   └── portfolio_data.dart    # All portfolio content (edit this first)
├── models/
│   ├── experience_model.dart  # Job entry: title, company, period, bullets
│   └── project_model.dart     # Project entry: links, tech, cover, screenshots
├── screens/
│   └── portfolio_screen.dart  # Page layout, section order, smooth scroll
└── widgets/
    ├── nav_bar.dart           # Top bar: section links, accent picker, theme toggle
    ├── hero_section.dart      # Avatar, name, role, contact chips
    ├── about_section.dart     # Summary card
    ├── skills_section.dart    # Skill grid, programming + spoken languages
    ├── experience_section.dart  # Timeline of roles
    ├── projects_section.dart  # Project cards and screenshot gallery
    ├── education_section.dart # Education cards
    ├── section_headline.dart  # Icon + title + underline
    ├── section_divider.dart   # Gradient divider between sections
    └── footer.dart            # Footer line
```

## Run & deploy

**Requirements:**

- The pubspec `environment` declares Dart SDK `^3.5.4`. The code uses `Color.withValues` and `toARGB32`, so use **Flutter 3.27 or newer** (stable).
- To deploy, you also need the Firebase CLI.

```bash
flutter pub get
mkdir -p assets/images/projects   # listed in pubspec.yaml but not tracked by git yet
flutter run -d chrome
```

**Build and deploy.** `firebase.json` serves `build/web`, rewrites every route to `index.html`, and adds basic security and cache headers.

```bash
flutter build web
firebase deploy --only hosting
```

The Firebase project is set in `.firebaserc` (`riyad-portfolio-f18db`). If you fork this repo, point it at your own project with `firebase use --add`.

## Author

Riyad Ahmed Sagor · [LinkedIn](https://www.linkedin.com/in/riyadfromspace/)
