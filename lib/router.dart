import 'package:go_router/go_router.dart';
import 'package:learning_tracker/core/models/widget_info.dart';
import 'package:learning_tracker/features/catalog/screens/catalog_screen.dart';
import 'package:learning_tracker/features/detail/screens/widget_detail_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (_, _) => const CatalogScreen()),
    GoRoute(
      path: '/widget/:name',
      builder: (_, state) {
        final name = Uri.decodeComponent(state.pathParameters['name'] ?? '');
        final extraInfo = state.extra as WidgetInfo?;
        return WidgetDetailScreen(
          widgetName: name,
          extraInfo: extraInfo,
        );
      },
    ),
  ],
);
