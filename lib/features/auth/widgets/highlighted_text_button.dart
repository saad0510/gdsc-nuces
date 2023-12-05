import 'package:flutter/material.dart';

class HighlightedTextButton extends StatelessWidget {
  const HighlightedTextButton({
    super.key,
    required this.text,
    required this.highlight,
    this.underline = true,
    required this.onPressed,
  });

  final String text;
  final String highlight;
  final bool underline;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final texts = text.split(highlight);

    return TextButton(
      onPressed: onPressed,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: Theme.of(context).textTheme.bodyMedium,
          children: [
            TextSpan(text: texts.first),
            if (texts.length != 1)
              TextSpan(
                text: highlight,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.primary,
                  decoration: underline ? TextDecoration.underline : null,
                ),
              ),
            if (texts.length != 1) //
              TextSpan(text: texts.last),
          ],
        ),
      ),
    );
  }
}
