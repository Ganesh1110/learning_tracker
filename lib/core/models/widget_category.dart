import 'package:flutter/material.dart';

enum WidgetCategory {
  layout('Layout'),
  animation('Animation'),
  input('Input & Forms'),
  scrolling('Scrolling'),
  painting('Painting & Styling'),
  text('Text & Typography'),
  material('Material Design'),
  cupertino('Cupertino (iOS)'),
  interaction('Interaction Models'),
  async('Async & Streams');

  final String displayName;
  const WidgetCategory(this.displayName);

  IconData get icon {
    switch (this) {
      case WidgetCategory.layout:
        return Icons.dashboard_customize_outlined;
      case WidgetCategory.animation:
        return Icons.animation_outlined;
      case WidgetCategory.input:
        return Icons.edit_note_outlined;
      case WidgetCategory.scrolling:
        return Icons.unfold_more_double_outlined;
      case WidgetCategory.painting:
        return Icons.palette_outlined;
      case WidgetCategory.text:
        return Icons.text_fields_outlined;
      case WidgetCategory.material:
        return Icons.android_outlined;
      case WidgetCategory.cupertino:
        return Icons.phone_iphone_outlined;
      case WidgetCategory.interaction:
        return Icons.touch_app_outlined;
      case WidgetCategory.async:
        return Icons.sync_alt_outlined;
    }
  }

  Color get color {
    switch (this) {
      case WidgetCategory.layout:
        return Colors.blue;
      case WidgetCategory.animation:
        return Colors.deepPurple;
      case WidgetCategory.input:
        return Colors.amber;
      case WidgetCategory.scrolling:
        return Colors.orange;
      case WidgetCategory.painting:
        return Colors.pink;
      case WidgetCategory.text:
        return Colors.teal;
      case WidgetCategory.material:
        return Colors.indigo;
      case WidgetCategory.cupertino:
        return Colors.grey;
      case WidgetCategory.interaction:
        return Colors.green;
      case WidgetCategory.async:
        return Colors.red;
    }
  }
}
