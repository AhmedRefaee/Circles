import 'package:flutter/material.dart';
import 'package:circles/features/settings/switch_locale/presentation/view/switch_locale_button.dart';
import 'package:circles/features/settings/switch_theme/presentation/view/switch_theme_button.dart';

class TestingRow extends StatefulWidget {
  const TestingRow({super.key});

  @override
  State<TestingRow> createState() => _TestingRowState();
}

class _TestingRowState extends State<TestingRow> {
  Offset _position = Offset(0, 0);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _position.dy,
      left: _position.dx,
      child: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            _position += details.delta;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.8),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [SwitchThemeButton(), SwitchLocaleButton()],
          ),
        ),
      ),
    );
  }
}
