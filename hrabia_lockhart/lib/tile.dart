import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hrabia_lockhart/app_state.dart';
import 'package:hrabia_lockhart/fonts.dart';

class Tile extends StatelessWidget {
  final Widget body;
  final String title;
  final VoidCallback onPressed;
  final bool active;

  const Tile({
    super.key,
    required this.body,
    required this.title,
    required this.onPressed,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: onPressed,
          child: Text(
            title,
            style: TextStyle(
                fontFamily: Fonts.fancyFont, color: Colors.white, fontSize: 32),
          ),
        ),
        active
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    const Divider(
                      color: Colors.white,
                    ),
                    body,
                  ],
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
