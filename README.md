# Flutter Widgets Learning Tracker for React Native Developers

A specialized learning tool and interactive catalog designed to help React Native developers transition smoothly to Flutter. The app catalogs Flutter widgets alphabetically, pairing each with live interactive demos, clean Dart snippets, and side-by-side React Native equivalency documentation.

---

## 🚀 Key Features

* **Interactive Demos**: Hands-on sandbox environments for each widget with configurable options (colors, alignments, curves, etc.).
* **React Native Equivalency Guide**: Code-to-code translations showing how React Native components map to Flutter widgets, along with explanations of paradigm differences.
* **M3 Design**: Clean, responsive layout supporting Light/Dark modes, built using Material 3 guidelines.
* **Alphabetical Catalog**: Fully searchable alphabetically, index-based layout for easy navigation.

---

## 🛠️ Architecture & Structure

The repository follows a clean, modular structure split by functionality:

```
lib/
├── core/
│   ├── models/            # Shared data models (WidgetInfo, Category)
│   └── registry/          # Single source of truth (widget_registry.dart)
├── demos/                 # Interactive demo implementations grouped by category
│   ├── animation/
│   ├── interaction/
│   ├── layout/
│   ├── painting/
│   └── scrolling/
├── explanations/          # React Native equivalent code and conceptual explanations
│   ├── animation/
│   ├── interaction/
│   ├── layout/
│   ├── painting/
│   └── scrolling/
├── features/              # App shells, screens (catalog, details) and components
│   ├── catalog/
│   └── detail/
├── app.dart               # App widget & main MaterialApp definition
├── main.dart              # App entry point
└── router.dart            # Routing logic (GoRouter integration)
```

### Main Files:
* **Registry** (`lib/core/registry/widget_registry.dart`): Registers all imported demos and explanations to dynamically generate the catalog and details pages.
* **Detail Screen** (`lib/features/detail/screens/widget_detail_screen.dart`): Dynamically resolves the selected widget from the registry and renders the demo tab, React Native comparison, and Dart code block.

---

## ⚙️ Getting Started

### Prerequisites

Make sure you have [Flutter](https://docs.flutter.dev/get-started/install) installed on your system.

### Running the App

1. Clone this repository.
2. Fetch dependencies:
   ```bash
   flutter pub get
   ```
3. Run the development server or build on a simulator/device:
   ```bash
   flutter run
   ```

### Running Tests & Verification

Verify the code is free of linting issues and all unit/widget tests pass:

```bash
# Run tests
flutter test

# Run static analysis
flutter analyze
```

---

## ➕ Adding a New Widget

To add a new Flutter widget to the learning tracker, follow these steps:

### 1. Create the Demo File
Create a new file in `lib/demos/<category>/<widget_name>_demo.dart`.
* Ensure it uses Material 3 components.
* Ensure all interactive controllers (sliders, chips, dropdowns) are wrap-compatible using **`Wrap`** (do not use `Row` for controls as it causes horizontal overflow on mobile viewports).
* Make it light/dark mode compatible.

### 2. Create the Explanation File
Create a new file in `lib/explanations/<category>/<widget_name>_explanation.dart`.
* Export a string (e.g., `const String widgetNameRnEquivalent = '''...''';`).
* Use React Native JSX syntax inside markdown blocks, followed by a concise description explaining how Flutter's approach differs and why it provides advantages (e.g. layout constraints flow, painting performance, state lifecycle).

### 3. Register the Widget
Import your files and add a new `WidgetInfo` item in `lib/core/registry/widget_registry.dart`:
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
)
```

---

## ⚠️ Important Implementation Guidelines

* **No `pumpAndSettle` with Loop Animations**: In widget tests, never use `tester.pumpAndSettle()` if there is an active repeating animation (`AnimationController.repeat()`) or indefinite progress indicators on screen, as it will time out. Use `tester.pump(const Duration(milliseconds: N))` instead.
* **Dropdown constraints inside Rows**: Wrap any `InputDecorator`-wrapped dropdown (e.g., curves selector, alignment selection) inside a `Row` with a fixed-width `SizedBox` (typically `width: 160` or `200`) to prevent infinite layout constraint assertion crashes.
* **Layout Overflow Protection**: Always prioritize `Wrap` over `Row` for selection controls, chips, and segment buttons to guarantee mobile responsiveness.
