import 'package:flutter/material.dart';

import '../../../core/extensions/datetime_ext.dart';
import '../../../core/utils/form_validations.dart';

class AppDatePickerField extends StatefulWidget {
  const AppDatePickerField({
    super.key,
    this.initial,
    this.enabled = true,
    required this.label,
    required this.onChanged,
  });

  final String label;
  final bool enabled;
  final DateTime? initial;
  final void Function(DateTime date) onChanged;

  @override
  State<AppDatePickerField> createState() => _AppDatePickerFieldState();
}

class _AppDatePickerFieldState extends State<AppDatePickerField> {
  late final initialText =
      widget.initial == null ? null : '${widget.initial!.timeFormated}, ${widget.initial!.dateFormatedLong}';
  late final textController = TextEditingController(text: initialText);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: !widget.enabled
          ? null
          : () async {
              final selected = await showDateTimePicker(context: context, initialDate: widget.initial);
              if (selected == null) return;
              textController.text = '${selected.timeFormated}, ${selected.dateFormatedLong}';
              widget.onChanged(selected);
            },
      child: Opacity(
        opacity: widget.enabled ? 1 : 0.5,
        child: AbsorbPointer(
          absorbing: true,
          child: ExcludeFocus(
            child: widget.enabled
                ? TextFormField(
                    readOnly: true,
                    controller: textController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: FormValidations.required,
                    decoration: InputDecoration(labelText: widget.label),
                  )
                : TextField(
                    readOnly: true,
                    decoration: InputDecoration(labelText: widget.label),
                  ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}

Future<DateTime?> showDateTimePicker({
  required BuildContext context,
  DateTime? initialDate,
  DateTime? firstDate,
  DateTime? lastDate,
}) async {
  initialDate ??= DateTime.now();
  firstDate ??= initialDate.subtract(const Duration(days: 365 * 100));
  lastDate ??= firstDate.add(const Duration(days: 365 * 200));

  final DateTime? selectedDate = await showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: firstDate,
    lastDate: lastDate,
  );

  if (selectedDate == null) return null;

  // ignore: use_build_context_synchronously
  if (!context.mounted) return selectedDate;

  final TimeOfDay? selectedTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.fromDateTime(selectedDate),
  );

  return selectedTime == null
      ? selectedDate
      : DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
          selectedTime.hour,
          selectedTime.minute,
        );
}
