import 'package:flutter/material.dart';

class BackgroundImageBox extends StatelessWidget {
  const BackgroundImageBox({
    super.key,
    required this.child,
    required this.imageUrl,
  });

  final String imageUrl;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.grey,
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        child: child,
      ),
    );
  }
}
