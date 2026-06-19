import 'package:flutter/material.dart';

class AbsorbPointerDemo extends StatefulWidget {
  const AbsorbPointerDemo({super.key});

  @override
  State<AbsorbPointerDemo> createState() => _AbsorbPointerDemoState();
}

class _AbsorbPointerDemoState extends State<AbsorbPointerDemo> {
  bool _absorbing = true;
  int _tapCount = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SwitchListTile(
          title: const Text('Absorbing'),
          subtitle: Text(_absorbing ? 'Taps blocked' : 'Taps allowed'),
          value: _absorbing,
          onChanged: (v) => setState(() => _absorbing = v),
        ),
        const SizedBox(height: 16),
        AbsorbPointer(
          absorbing: _absorbing,
          child: ElevatedButton(
            onPressed: () => setState(() => _tapCount++),
            child: const Text('Tap me'),
          ),
        ),
        const SizedBox(height: 16),
        Text('Button tapped $_tapCount times'),
      ],
    );
  }
}
