import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../../../app/theme/colors.dart';
import '../../../core/extensions/context_ext.dart';

class ValuePickerDialog<Type> extends ConsumerWidget {
  const ValuePickerDialog({
    super.key,
    required this.values,
    required this.onPicked,
  });

  final List<Type> values;
  final void Function(Type x) onPicked;

  void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => this,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SimpleDialog(
      insetPadding: AppPaddings.normal,
      titlePadding: AppPaddings.normal,
      contentPadding: AppPaddings.normal,
      children: List.generate(
        values.length,
        (i) => Padding(
          padding: AppPaddings.tiny,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: Material(
              color: AppColors.values[i],
              child: InkWell(
                onTap: () {
                  context.pop();
                  onPicked(values[i]);
                },
                child: Padding(
                  padding: AppPaddings.small,
                  child: Text(
                    values[i].toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
