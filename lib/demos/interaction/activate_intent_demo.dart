import 'package:flutter/material.dart';
import 'activate_action_demo.dart';

class ActivateIntentDemo extends StatelessWidget {
  const ActivateIntentDemo({super.key});

  @override
  Widget build(BuildContext context) {
    // Reuses the focus-based activation demo as it showcases both ActivateIntent and ActivateAction together
    return const ActivateActionDemo();
  }
}
