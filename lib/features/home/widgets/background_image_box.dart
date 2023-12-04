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
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.grey,
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
      ),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black45,
              Colors.transparent,
              Colors.transparent,
            ],
          ),
        ),
        child: child,
      ),
    );
  }
}
