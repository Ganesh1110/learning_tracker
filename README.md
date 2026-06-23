# Flutter Widgets Learning Tracker

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?style=flat&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-^3.10.8-0175C2?style=flat&logo=dart&logoColor=white)
![License](https://img.shields.io/badge/License-TODO-lightgrey?style=flat)
![Coverage](https://img.shields.io/badge/Widget%20Coverage-35%20%2F%20937-orange?style=flat)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Web%20%7C%20Desktop-blue?style=flat)

> A specialized interactive catalog helping **React Native developers transition smoothly to Flutter** — one widget at a time.

---

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Running Locally](#running-locally)
- [API Documentation](#api-documentation)
- [Database](#database)
- [Testing](#testing)
- [Deployment](#deployment)
- [Adding a New Widget](#adding-a-new-widget)
- [Implementation Guidelines](#implementation-guidelines)
- [Troubleshooting](#troubleshooting)
- [Future Improvements](#future-improvements)
- [Contributing](#contributing)
- [License](#license)

---

## Overview

**Flutter Widgets Learning Tracker** is an interactive Flutter application designed to bridge the knowledge gap for developers coming from a React Native background. The app provides an alphabetical, searchable catalog of Flutter widgets — each entry paired with:

- A **live, interactive demo** with configurable options (colors, alignments, curves, etc.)
- A **React Native equivalency guide** showing side-by-side code translations and paradigm explanations
- A **clean Dart code snippet** ready to copy and use

The problem it solves: Flutter's widget surface area is enormous (~937 API classes). This tracker makes that landscape navigable for developers who already think in React Native primitives, by anchoring each Flutter concept to something they already know.

**Current coverage:** 35 / 937 Flutter API classes (3.7%), with a phased roadmap targeting 100%.

---

## Features

- **Interactive Widget Demos** — Hands-on sandbox for each widget with live-configurable options (colors, alignments, animation curves, etc.)
- **React Native Equivalency Guide** — Code-to-code translations showing how React Native components map to Flutter widgets, with paradigm difference explanations
- **Alphabetical Widget Catalog** — Index-based layout with full searchability for easy navigation
- **Material 3 Design** — Clean, responsive UI built to M3 guidelines with full Light/Dark mode support
- **Category Filtering** — Widgets grouped by category: Animation, Interaction, Layout, Painting, Scrolling
- **Registry-Driven Architecture** — Single source of truth (`widget_registry.dart`) dynamically generates catalog and detail pages — no manual wiring
- **Dart Code Snippets** — Copy-ready code block displayed alongside each widget demo
- **Multi-Platform Support** — Targets Android, iOS, Web, Linux, macOS, and Windows from a single codebase

---

## Tech Stack

| Layer            | Technology                               | Version         |
| ---------------- | ---------------------------------------- | --------------- |
| Language         | Dart                                     | `^3.10.8` (SDK) |
| Framework        | Flutter                                  | 3.x             |
| Routing          | go_router                                | `^17.3.0`       |
| UI Design System | Material Design 3                        | —               |
| Icons            | cupertino_icons                          | `^1.0.8`        |
| Linting          | flutter_lints                            | `^6.0.0`        |
| Testing          | flutter_test (SDK)                       | —               |
| Platform Targets | Android, iOS, Web, Linux, macOS, Windows | —               |

---

## Project Structure

```
learning_tracker/
├── android/                  # Android platform shell
├── ios/                      # iOS platform shell
├── linux/                    # Linux desktop platform shell
├── macos/                    # macOS desktop platform shell
├── windows/                  # Windows desktop platform shell
├── web/                      # Web platform shell
├── test/                     # Widget and unit tests
├── lib/
│   ├── core/
│   │   ├── models/           # Shared data models (WidgetInfo, WidgetCategory)
│   │   └── registry/
│   │       └── widget_registry.dart   # Single source of truth — all widgets registered here
│   ├── demos/                # Interactive demo implementations, grouped by category
│   │   ├── animation/        # e.g. animated_container_demo.dart
│   │   ├── interaction/      # e.g. absorb_pointer_demo.dart
│   │   ├── layout/           # e.g. align_demo.dart
│   │   ├── painting/         # e.g. alignment_demo.dart
│   │   └── scrolling/        # e.g. always_scrollable_demo.dart
│   ├── explanations/         # React Native equivalency strings, grouped by category
│   │   ├── animation/
│   │   ├── interaction/
│   │   ├── layout/
│   │   ├── painting/
│   │   └── scrolling/
│   ├── features/
│   │   ├── catalog/          # Catalog screen — lists all widgets from the registry
│   │   └── detail/
│   │       └── screens/
│   │           └── widget_detail_screen.dart  # Resolves widget, renders demo + RN comparison + code
│   ├── app.dart              # Root app widget & MaterialApp definition
│   ├── main.dart             # App entry point
│   └── router.dart           # GoRouter routing configuration
├── pubspec.yaml              # Dependencies & Flutter configuration
├── pubspec.lock              # Locked dependency versions
├── analysis_options.yaml     # Dart lint rules
├── FEATURE_ROADMAP.md        # Phased development plan (35 → 937 widgets)
└── widget_analysis_report.md # Coverage analysis vs. official Flutter API docs
```

### Key Files

| File                                                    | Responsibility                                                                             |
| ------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| `lib/core/registry/widget_registry.dart`                | Single source of truth — registers all demos, explanations, and metadata                   |
| `lib/features/detail/screens/widget_detail_screen.dart` | Dynamically resolves and renders the selected widget's demo, RN comparison, and code block |
| `lib/app.dart`                                          | Root `MaterialApp` with M3 theming and Light/Dark mode setup                               |
| `lib/router.dart`                                       | GoRouter configuration for navigation between catalog and detail screens                   |

---

## Prerequisites

Ensure the following are installed on your system before proceeding:

| Tool                           | Minimum Version | Notes                                               |
| ------------------------------ | --------------- | --------------------------------------------------- |
| Flutter SDK                    | 3.x             | Includes Dart SDK                                   |
| Dart SDK                       | ^3.10.8         | Bundled with Flutter                                |
| Git                            | Any             | For cloning the repository                          |
| Android Studio / Xcode         | Latest stable   | Required for mobile targets                         |
| A connected device or emulator | —               | Android emulator, iOS Simulator, or physical device |

To verify your Flutter installation is ready:

```bash
flutter doctor
```

All checks should pass (or show only non-critical warnings) before proceeding.

---

## Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/Ganesh1110/learning_tracker.git
   cd learning_tracker
   ```

2. **Install Flutter dependencies**

   ```bash
   flutter pub get
   ```

3. **Verify the setup**

   ```bash
   flutter analyze
   flutter test
   ```

   Both commands should complete without errors.

---

## Configuration

This project has **no external services, API keys, or environment variables** required. There are no `.env` files or secrets to configure.

The only configuration files are standard Flutter/Dart tooling files:

| File                     | Purpose                                                            |
| ------------------------ | ------------------------------------------------------------------ |
| `pubspec.yaml`           | Declares dependencies, app version, and Flutter settings           |
| `analysis_options.yaml`  | Dart static analysis and lint rules (extends `flutter_lints`)      |
| `android/`, `ios/`, etc. | Platform-specific build configuration (managed by Flutter tooling) |

> **TODO:** Information on any planned remote configuration (e.g., feature flags, analytics) not found in the repository.

---

## Running Locally

### Run on a connected device or emulator

```bash
flutter run
```

Flutter will prompt you to select a device if multiple are available. To target a specific platform:

```bash
# Android
flutter run -d android

# iOS (macOS only)
flutter run -d ios

# Web
flutter run -d chrome

# macOS desktop (macOS only)
flutter run -d macos

# Linux desktop
flutter run -d linux

# Windows desktop
flutter run -d windows
```

### Run with verbose logging (for debugging)

```bash
flutter run -v
```

---

## API Documentation

This is a **fully client-side Flutter application** with no backend API, REST endpoints, HTTP calls, authentication, or database connections.

The internal "API" is the widget registry — a Dart code-level interface:

### `WidgetInfo` Model

Each widget in the catalog is described by a `WidgetInfo` object registered in `widget_registry.dart`:

```dart
WidgetInfo(
  name: 'AnimatedContainer',        // Display name
  category: WidgetCategory.animation, // Enum: animation | interaction | layout | painting | scrolling
  description: 'Animated version of Container.',  // Short description shown on catalog card
  rnEquivalent: animatedContainerRnEquivalent,    // String constant from explanations/
  demoBuilder: (_) => const AnimatedContainerDemo(), // Widget builder for the demo tab
  dartCode: '''AnimatedContainer(
  duration: Duration(milliseconds: 300),
  color: Colors.blue,
)''',
)
```

### Navigation Routes (GoRouter)

| Route Pattern   | Screen         | Description                                               |
| --------------- | -------------- | --------------------------------------------------------- |
| `/`             | Catalog Screen | Lists all registered widgets alphabetically               |
| `/widget/:name` | Detail Screen  | Shows demo, RN equivalent, and code for a specific widget |

> **TODO:** Exact route parameter names and full GoRouter configuration not inspected from source — verify in `lib/router.dart`.

---

## Database

This application uses **no database**. All widget data (demos, explanations, code snippets) is **compiled into the app** via the `widget_registry.dart` file.

There is no local storage, SQLite, SharedPreferences, or remote database in the current implementation.

> **Planned** (per `FEATURE_ROADMAP.md` Phase 2): A "recently viewed widgets" feature backed by **SharedPreferences** is planned for Q4 2026. Phase 3 also plans local-persistence bookmark/favorites functionality.

---

## Testing

### Run all tests

```bash
flutter test
```

### Run static analysis

```bash
flutter analyze
```

### Run a specific test file

```bash
flutter test test/widget_test.dart
```

### Important testing constraints

- **Do NOT use `tester.pumpAndSettle()`** when a demo contains a repeating animation (`AnimationController.repeat()`) or an indefinite `CircularProgressIndicator`. This causes a timeout.
- **Use `tester.pump(const Duration(milliseconds: N))`** instead for demos with continuous animations:

  ```dart
  // ✅ Correct
  await tester.pump(const Duration(milliseconds: 500));

  // ❌ Will timeout with looping animations
  await tester.pumpAndSettle();
  ```

> **TODO:** Test coverage metrics and CI configuration not found in the repository (GitHub Actions CI is planned per the roadmap but not yet implemented).

---

## Deployment

This is a learning/reference app with no production deployment pipeline currently configured. To build release artifacts for each platform:

### Android APK

```bash
flutter build apk --release
# Output: build/app/outputs/flutter-apk/app-release.apk
```

### Android App Bundle (Play Store)

```bash
flutter build appbundle --release
```

### iOS (macOS only)

```bash
flutter build ios --release
# Then archive and distribute via Xcode or fastlane
```

### Web

```bash
flutter build web --release
# Output: build/web/ — deploy to any static hosting (Firebase Hosting, Netlify, etc.)
```

### macOS

```bash
flutter build macos --release
```

### Linux

```bash
flutter build linux --release
```

### Windows

```bash
flutter build windows --release
```

> **TODO:** CI/CD pipeline (GitHub Actions) is listed in the roadmap as a Phase 1 deliverable but is not yet present in the repository.

---

## Adding a New Widget

Follow this three-file pattern for every new widget:

### Step 1 — Create the Demo File

Create `lib/demos/<category>/<widget_name>_demo.dart`:

```dart
import 'package:flutter/material.dart';

class MyNewWidgetDemo extends StatefulWidget {
  const MyNewWidgetDemo({super.key});

  @override
  State<MyNewWidgetDemo> createState() => _MyNewWidgetDemoState();
}

class _MyNewWidgetDemoState extends State<MyNewWidgetDemo> {
  @override
  Widget build(BuildContext context) {
    return Wrap( // Always use Wrap for controls — never Row (prevents mobile overflow)
      children: [
        // Interactive controls and the widget demo
      ],
    );
  }
}
```

**Requirements:**

- Use Material 3 components
- Use `Wrap` (never `Row`) for interactive controls to prevent horizontal overflow on mobile
- Support Light and Dark mode

### Step 2 — Create the Explanation File

Create `lib/explanations/<category>/<widget_name>_explanation.dart`:

```dart
const String myNewWidgetRnEquivalent = '''
// React Native equivalent:
// <View style={{ ... }} />

// Flutter:
// MyNewWidget(property: value)

// Key difference: explain the Flutter paradigm shift here.
''';
```

### Step 3 — Register the Widget

Import your files and add an entry in `lib/core/registry/widget_registry.dart`:

```dart
WidgetInfo(
  name: 'MyNewWidget',
  category: WidgetCategory.layout,
  description: 'Short description of what the widget does.',
  rnEquivalent: myNewWidgetRnEquivalent,
  demoBuilder: (_) => const MyNewWidgetDemo(),
  dartCode: '''MyNewWidget(
  property: value,
)''',
),
```

### Step 4 — Verify

```bash
flutter analyze
flutter test
```

---

## Implementation Guidelines

These constraints are critical for stability and mobile responsiveness:

| Rule                                                                        | Reason                                                                     |
| --------------------------------------------------------------------------- | -------------------------------------------------------------------------- |
| Use `Wrap` for selection controls, chips, and segment buttons — never `Row` | Prevents horizontal overflow crashes on narrow viewports                   |
| Fix dropdown width inside `Row` with a `SizedBox(width: 160)`               | Prevents infinite layout constraint assertion errors from `InputDecorator` |
| Never use `tester.pumpAndSettle()` with looping animations in tests         | Causes test timeout; use `tester.pump(Duration(...))` instead              |
| Use M3 components and support Light/Dark mode in all demos                  | Ensures visual consistency with the app shell                              |

---

## Troubleshooting

### `flutter pub get` fails

Ensure your Flutter SDK is correctly installed and `flutter` is in your `PATH`:

```bash
flutter --version
flutter doctor
```

### Horizontal overflow in demo controls

If you see a yellow/black overflow stripe on mobile, replace `Row` with `Wrap` for the control bar in your demo widget.

### Test times out / hangs

Your widget test is likely calling `pumpAndSettle()` while a looping animation or indefinite progress indicator is active. Replace with:

```bash
await tester.pump(const Duration(milliseconds: 500));
```

### `flutter analyze` reports errors on a new widget

Check that:

1. Your demo file is imported in `widget_registry.dart`
2. Your explanation constant name matches what you passed to `rnEquivalent:`
3. You are not using deprecated Flutter APIs

### App fails to build on a specific platform

Run `flutter doctor` and ensure the relevant platform toolchain (Xcode for iOS/macOS, Android SDK for Android) is correctly installed and configured.

---

## Future Improvements

Based on `FEATURE_ROADMAP.md` and the widget analysis report:

**Phase 1 — Core Layout & Interaction (Q3 2026)**

- Add the 20 most-used Flutter layout widgets (`Container`, `Row`, `Column`, `Stack`, `SafeArea`, `GestureDetector`, etc.)
- Category filter badges with live widget counts
- List/grid view toggle on catalog screen
- GitHub Actions CI gate (`flutter analyze` + `flutter test` on every PR)

**Phase 2 — Scrolling, Navigation & Theming (Q4 2026)**

- `ListView`, `GridView`, `PageView`, `Navigator`, `TextField`, Material widgets
- Recently viewed widgets section (SharedPreferences persistence)
- Dark mode preview toggle inside demo cards
- Scroll-to-top FAB on catalog

**Phase 3 — Visual Effects & Advanced Animations (Q1 2027)**

- `CustomPaint`, `BackdropFilter`, `ClipRRect`, animation transitions
- Fuzzy-matching search
- Bookmark/favorites with local persistence
- "Flutter vs RN" paradigm explainer pages

**Phase 4 — Full Coverage (Q2 2027)**

- Cupertino widgets, Semantics, Sliver family, remaining ~670 classes
- Category progress dashboard with per-letter completion percentage
- Random widget explorer ("Surprise me" button)
- Export progress stats as JSON

> See [`FEATURE_ROADMAP.md`](FEATURE_ROADMAP.md) for the full phased plan with effort estimates.

---

## Contributing

Contributions are welcome! The primary workflow for adding widgets is documented in [Adding a New Widget](#adding-a-new-widget). For the current priority list, see [`FEATURE_ROADMAP.md`](FEATURE_ROADMAP.md).

### General Guidelines

1. **Fork** the repository and create a feature branch:

   ```bash
   git checkout -b feat/add-container-widget
   ```

2. **Follow the three-file pattern**: every new widget needs a `demo`, an `explanation`, and a `registry` entry.

3. **Use `Wrap` for controls** in all demo widgets — never `Row`.

4. **Ensure M3 + Light/Dark compatibility** in your demo.

5. **Run analysis and tests** before opening a PR:

   ```bash
   flutter analyze
   flutter test
   ```

6. **Mark the widget as completed** in `FEATURE_ROADMAP.md` (`[ ]` → `[x]`).

7. **Open a Pull Request** with a clear description of what widget(s) you added.

> **TODO:** A formal `CONTRIBUTING.md`, code of conduct, and PR template are not present in the repository. Consider adding them.

---

## License

> **TODO:** No `LICENSE` file was found in the repository. The `pubspec.yaml` sets `publish_to: 'none'`, indicating this is a private/personal project. Please add an appropriate license (e.g., MIT, Apache 2.0) to clarify usage rights for contributors.

---

## Acknowledgements

Built to help React Native developers navigate Flutter's expansive widget ecosystem. Widget descriptions sourced from the [official Flutter API documentation](https://api.flutter.dev/flutter/widgets/).
