# Flutter Widgets Learning Tracker — Feature Roadmap

> **Current Coverage:** 35 / 937 API classes (3.7%)  
> **Target:** 100% coverage of all Flutter widgets & supporting classes  
> **Audience:** React Native developers transitioning to Flutter

## Guiding Principles

1. **Highest-value first** — prioritize widgets RN devs encounter daily (layout, navigation, input)
2. **Batch by category** — implement all remaining widgets within a category before moving on
3. **Three-file pattern** — every widget gets a `demo`, an `explanation` (RN equivalent), and a `registry` entry
4. **Test alongside implementation** — each phase adds widget tests for the newly added demos

---

## Completed

Widgets already implemented (35 total):

### Layout
- [x] Align (`View` with alignment)
- [x] AbstractLayoutBuilder
- [x] AndroidView
- [x] AndroidViewSurface

### Interaction
- [x] AbsorbPointer (like `pointerEvents: 'none'` on parent)
- [x] Action\<T extends Intent\>
- [x] ActionDispatcher
- [x] ActionListener
- [x] Actions
- [x] ActivateAction
- [x] ActivateIntent

### Painting
- [x] Accumulator
- [x] Alignment
- [x] AlignmentDirectional
- [x] AlignmentGeometry

### Scrolling
- [x] AlwaysScrollableScrollPhysics

### Animation
- [x] AlignTransition
- [x] AlignmentGeometryTween
- [x] AlignmentTween
- [x] AlwaysStoppedAnimation
- [x] Animatable
- [x] AnimatedAlign
- [x] AnimatedBuilder
- [x] AnimatedContainer
- [x] AnimatedCrossFade
- [x] AnimatedDefaultTextStyle
- [x] AnimatedFractionallySizedBox
- [x] AnimatedGrid
- [x] AnimatedGridState
- [x] AnimatedList
- [x] AnimatedModalBarrier
- [x] AnimatedSize
- [x] AnimatedSlide
- [x] AnimatedSwitcher
- [x] AnimatedWidget

---

## Phase 1 — Foundation: Core Layout & Interaction (Q3 2026)

**Goal:** Ship the 20 most-used Flutter layout/interaction widgets that every RN dev reaches for on Day 1.

### Layout
- [ ] Container (`View` with `style`)
- [ ] Row (`Flex` with `flexDirection: 'row'`)
- [ ] Column (`Flex` with `flexDirection: 'column'`)
- [ ] Stack (`View` with absolute positioning)
- [ ] Center (`View` with `justifyContent/alignItems: 'center'`)
- [ ] Padding (`View` with `padding`)
- [ ] SizedBox (fixed `width`/`height` on a `View`)
- [ ] Expanded (`flex: 1`)
- [ ] Flexible (`flex: <n>`)
- [ ] Spacer (empty flex child)
- [ ] ConstrainedBox (`minWidth/maxWidth`)
- [ ] LimitedBox (constrained sizing)
- [ ] FractionallySizedBox (percentage-based sizing)
- [ ] AspectRatio (`aspectRatio` prop)
- [ ] FittedBox (`resizeMode: 'contain'`)
- [ ] Baseline (`baseline` alignment)
- [ ] Offstage (`display: 'none'`)
- [ ] SafeArea (`SafeAreaView`)
- [ ] Builder (inline render callback)

### Painting & Styling
- [ ] Opacity (`opacity` prop)
- [ ] Transform (`transform` style)
- [ ] ClipRRect (`borderRadius` + `overflow: 'hidden'`)

### Interaction
- [ ] GestureDetector (`Pressable` / `TouchableOpacity`)
- [ ] IgnorePointer (`pointerEvents: 'none'`)

### Deliverables
- [ ] 24 new demo files, 24 new explanation files, 24 new registry entries
- [ ] Widget tests for all 24 demos
- [ ] Category filter badges show live count per category
- [ ] Catalog grid supports list view toggle (compact vs. card)
- [ ] CI test gate: GitHub Actions `flutter analyze` + `flutter test` on PR
- [ ] Search filters + category counts — live counts in filter chips

---

## Phase 2 — Scrolling, Navigation & Theming (Q4 2026)

**Goal:** Enable real-app patterns — scrolling lists, navigation, theming, text.

### Scrolling
- [ ] ListView (`FlatList` equivalent)
- [ ] GridView (`FlatList` with `numColumns`)
- [ ] SingleChildScrollView (`ScrollView`)
- [ ] PageView (pager / carousel)
- [ ] Scrollbar (native scroll indicator)

### Interaction
- [ ] Navigator (`NavigationContainer`)

### Animation
- [ ] Hero (shared element transition)
- [ ] HeroControllerScope
- [ ] HeroMode

### Text & Typography
- [ ] DefaultTextStyle (`defaultTextStyle`)

### Painting & Styling
- [ ] Icon (icon component)
- [ ] IconTheme

### Material Design
- [ ] MaterialApp / WidgetsApp (`AppRegistry.registerComponent`)
- [ ] Theme / InheritedTheme (`ThemeProvider`)

### Layout
- [ ] MediaQuery (`Dimensions` API)

### Input & Forms
- [ ] Form (form state management)
- [ ] TextFormField / TextField (`TextInput`)
- [ ] DropdownButton / Dropdown (`Picker`)

### Deliverables
- [ ] ~22 new widgets
- [ ] Scroll-to-top FAB on catalog when list exceeds screen height
- [ ] Recently viewed widgets section (persisted locally via SharedPreferences)
- [ ] Dark mode preview toggle inside demo cards

---

## Phase 3 — Visual Effects, Painting & Advanced Animations (Q1 2027)

**Goal:** Cover Flutter's unique differentiators — custom painting, explicit animations, platform views.

### Painting & Styling
- [ ] CustomPaint (Canvas drawing — no RN equivalent, teach paradigm)
- [ ] CustomPainter
- [ ] DecoratedBox (background + foreground decoration)
- [ ] ClipOval / ClipPath / ClipRect (clip shapes)
- [ ] ShaderMask (gradient mask)
- [ ] BackdropFilter (`blur` backdrop — no direct RN equivalent)
- [ ] Banner (debug overlay)
- [ ] PhysicalModel (elevation / material surface)
- [ ] PhysicalShape

### Animation
- [ ] SlideTransition
- [ ] FadeTransition
- [ ] ScaleTransition
- [ ] RotationTransition
- [ ] SizeTransition
- [ ] TweenAnimationBuilder

### Layout
- [ ] Positioned (absolute positioning in Stack)
- [ ] PositionedDirectional

### Interaction
- [ ] InteractiveViewer (pinch-to-zoom, pan)

### Deliverables
- [ ] ~24 new widgets
- [ ] "Flutter vs RN" paradigm explainer pages (Canvas, Constraints, Widget Tree)
- [ ] Speed search: fuzzy-matching on widget names
- [ ] Bookmark / favorite widgets (local persistence)

---

## Phase 4 — Platform, Accessibility & Remaining Categories (Q2 2027)

**Goal:** Cover Cupertino widgets, platform channels, accessibility, and all remaining supporting classes.

- [ ] Cupertino widgets (~30) — iOS-style equivalents
- [ ] Semantics / ExcludeSemantics (~5) — accessibility
- [ ] Focus / FocusableActionDetector (~6) — keyboard focus management
- [ ] Shortcuts / Actions / Intent remaining (~60) — keyboard shortcuts system
- [ ] Raw* widgets (~5) — RawImage, RawKeyboard, etc.
- [ ] Sliver* family remaining (~40) — advanced scroll effects
- [ ] TreeSliver / TwoDimensional* (~5) — tree/2D scrolling
- [ ] Animation/Tween/Curve remaining (~42) — all tween types
- [ ] Border/Radius remaining (~19) — border helpers
- [ ] Controller remaining (~18) — scroll/tab controllers
- [ ] Painter/Painting remaining (~9)
- [ ] State remaining (~10) — state lifecycle
- [ ] Other / Supporting (~407) — remaining utility classes

### Deliverables
- [ ] Bulk-add all remaining ~670 classes
- [ ] Category progress dashboard with completion % per letter
- [ ] Random widget explorer ("Surprise me" button)
- [ ] Export progress stats (JSON)
- [ ] In-app changelog showing recently added widgets

---

## Platform & Quality Milestones

- [ ] Phase 1: Widget tests for all demos — ensure every demo builds without error
- [ ] Phase 1: Search filters + category counts — live counts in filter chips
- [ ] Phase 1: List / grid view toggle — compact list alternative for dense screens
- [ ] Phase 1: CI test gate — GitHub Actions `flutter analyze` + `flutter test` on PR
- [ ] Phase 2: Scroll-to-top on catalog — FAB when list > 1 page
- [ ] Phase 2: Recently viewed — SharedPreferences-backed history
- [ ] Phase 2: Dark mode preview — toggle inside demo for instant check
- [ ] Phase 3: Fuzzy search — typo-tolerant search
- [ ] Phase 3: Bookmarks / favorites — local persistence
- [ ] Phase 4: Random widget explorer — "Surprise me" feature
- [ ] Phase 4: Category progress dashboard — per-letter % completion
- [ ] Phase 4: Export progress stats — JSON download of progress
- [ ] Phase 4: In-app changelog — recent additions feed

---

## Effort Estimation

| Phase | New Widgets | New Files | Estimated Effort |
| :--- | :---: | :---: | :--- |
| Phase 1 — Core Layout | 19 | 57 files | 3-4 weeks |
| Phase 2 — Navigation & Scrolling | 17 | 51 files | 3-4 weeks |
| Phase 3 — Visual & Animation | 15 | 45 files | 3-4 weeks |
| Phase 4 — Remaining ~670 | ~670 | ~2000 files | 8-12 weeks |
| **Total** | **~720+** | **~2150+** | **16-24 weeks** |

> *Estimates assume 1 widget/day for Phase 1-3 (demos + explanations) and batch scripts/procedural generation for the bulk of Phase 4.*

---

## How to Contribute

See [`README.md`](./README.md#-adding-a-new-widget) for the per-widget contribution workflow.

1. Pick a widget from the current phase
2. Create `lib/demos/<category>/<widget>_demo.dart`
3. Create `lib/explanations/<category>/<widget>_explanation.dart`
4. Register in `lib/core/registry/widget_registry.dart`
5. Run `flutter analyze` and `flutter test`
6. Mark as completed in this roadmap (`[ ]` → `[x]`)

---

**Last updated:** 2026-06-19
