# JERMAN COMPANY - Business Website

A professional, responsive Flutter Web business website for JERMAN COMPANY built with Material 3 and go_router.

## Features

- **Responsive Design**: Looks great on mobile, tablet, and desktop
- **Material 3**: Modern design system with emerald/green theme
- **go_router Navigation**: Clean URLs (/, /about, /services, /contact) with browser history support
- **4 Pages**: Home, About, Services, Contact
- **Contact Form**: Ready-to-use form (requires backend integration for submission)

## Project Structure

```
lib/
├── main.dart              # Entry point
├── app.dart               # MaterialApp with theme and router
├── router/
│   └── app_router.dart    # go_router configuration
├── theme/
│   └── app_theme.dart     # Material 3 theme (emerald green)
├── pages/
│   ├── home_page.dart     # Home page with all sections
│   ├── about_page.dart    # About us page
│   ├── services_page.dart # Services listing page
│   └── contact_page.dart  # Contact form page
└── widgets/
    ├── site_scaffold.dart       # Shared layout wrapper
    ├── top_nav.dart             # Responsive navigation bar
    ├── footer.dart              # Site footer
    ├── hero_section.dart        # Hero banner section
    ├── services_section.dart    # Services preview cards
    ├── why_choose_us_section.dart # Why choose us section
    └── contact_section.dart     # Contact info preview
```

## Setup Instructions

### Prerequisites
- Flutter SDK (stable channel)
- Chrome browser (for web development)

### 1. Clone/Download the Project

```bash
cd jerman_company_web
```

### 2. Add Your Images

Create the assets folder and add your images:

```bash
mkdir -p assets/images
```

Place these files in `assets/images/`:
- `logo.png` - Your company logo (recommended: 200x200px or similar)
- `hero.png` - Hero/banner background image (recommended: 1920x1080px or larger)

**Note**: The app will show fallback placeholder icons if images are missing.

### 3. Install Dependencies

```bash
flutter pub get
```

### 4. Run Locally

```bash
flutter run -d chrome
```

The app will open in Chrome. Navigate between pages using the navigation bar.

## Build for Production

```bash
flutter build web --release
```

The production build will be in `build/web/` folder.

## Deployment Options

### Option 1: Netlify (Easy Drag & Drop)

1. Build the project: `flutter build web --release`
2. Go to [Netlify Drop](https://app.netlify.com/drop)
3. Drag and drop the `build/web` folder
4. Your site is live!

### Option 2: Firebase Hosting

1. Install Firebase CLI: `npm install -g firebase-tools`
2. Login: `firebase login`
3. Initialize: `firebase init hosting`
   - Select your Firebase project
   - Set public directory to `build/web`
   - Configure as single-page app: Yes
4. Build: `flutter build web --release`
5. Deploy: `firebase deploy`

### Option 3: GitHub Pages

1. Build: `flutter build web --release --base-href "/your-repo-name/"`
2. Push `build/web` contents to `gh-pages` branch
3. Enable GitHub Pages in repository settings

### Option 4: Any Static Host

Upload the contents of `build/web/` to any static file hosting service:
- Vercel
- AWS S3 + CloudFront
- DigitalOcean Spaces
- Cloudflare Pages

## Customization

### Change Theme Color
Edit `lib/theme/app_theme.dart`:
```dart
static const Color primaryColor = Color(0xFF059669); // Change this hex color
```

### Update Contact Information
Edit the following files:
- `lib/widgets/contact_section.dart` - Home page contact preview
- `lib/pages/contact_page.dart` - Contact page details

### Add/Modify Services
Edit:
- `lib/widgets/services_section.dart` - Home page service cards
- `lib/pages/services_page.dart` - Services page details

## License

© 2026 JERMAN COMPANY. All rights reserved.
