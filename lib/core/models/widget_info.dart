import 'package:flutter/material.dart';
import 'widget_category.dart';

class WidgetInfo {
  final String name;
  final WidgetCategory category;
  final String description;
  final String rnEquivalent;
  final WidgetBuilder demoBuilder;
  final String dartCode;

  const WidgetInfo({
    required this.name,
    required this.category,
    required this.description,
    required this.rnEquivalent,
    required this.demoBuilder,
    required this.dartCode,
  });
}
