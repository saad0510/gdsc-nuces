
import 'package:flutter/material.dart';

import '../../../app/constants.dart';
import '../../../app/sizer.dart';
import 'background_image_box.dart';

class BackgroundPicker extends StatefulWidget {
  const BackgroundPicker({
    super.key,
    this.initialUrl,
    required this.onChanged,
  });

  final String? initialUrl;
  final void Function(String url) onChanged;

  @override
  State<BackgroundPicker> createState() => _BackgroundPickerState();
}

class _BackgroundPickerState extends State<BackgroundPicker> {
  int imageIndex = 0;
  late final images = {
    if (widget.initialUrl != null) widget.initialUrl!,
    ...AppConstants.coverImages,
  };

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: BackgroundImageBox(
        imageUrl: images.elementAt(imageIndex),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () {
              setState(() {
                imageIndex = (imageIndex + 1) % images.length;
                widget.onChanged(images.elementAt(imageIndex));
              });
            },
            child: Container(
              padding: AppPaddings.normal,
              child: const Text(
                'Tap To Change',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
