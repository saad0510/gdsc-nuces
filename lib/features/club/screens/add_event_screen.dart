import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../../../app/theme/colors.dart';
import '../../../core/extensions/context_ext.dart';
import '../../auth/widgets/app_date_picker_field.dart';
import '../../auth/widgets/app_text_field.dart';
import '../entities/event.dart';
import '../repositories/event_repo.dart';
import '../widgets/background_picker.dart';

class AddEventScreen extends ConsumerStatefulWidget {
  const AddEventScreen({
    super.key,
    this.clubId,
    this.event,
  });

  final String? clubId;
  final Event? event;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddClubScreenState();
}

class _AddClubScreenState extends ConsumerState<AddEventScreen> {
  final formKey = GlobalKey<FormState>();
  late final shouldEdit = widget.event != null;
  late var event = widget.event ?? Event.empty().copyWith(clubId: widget.clubId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: shouldEdit ? const Text('Edit Event') : const Text('New Event'),
      ),
      body: SingleChildScrollView(
        padding: AppPaddings.normal,
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BackgroundPicker(
                initialUrl: event.coverImgUrl,
                onChanged: (url) => event = event.copyWith(coverImgUrl: url),
              ),
              AppSizes.normalY,
              AppTextField.name(
                label: 'Title',
                hint: 'A nice title or name of the event',
                initialValue: shouldEdit ? event.title : null,
                onSubmit: (x) => event = event.copyWith(title: x),
              ),
              AppSizes.normalY,
              AppTextField.name(
                label: 'Description',
                hint: 'Briefly describe the purpose of this event',
                initialValue: shouldEdit ? event.description : null,
                maxLines: 2,
                onSubmit: (x) => event = event.copyWith(description: x),
              ),
              AppSizes.normalY,
              AppTextField.name(
                label: 'Venue',
                hint: 'The location of the event',
                initialValue: shouldEdit ? event.venue : null,
                onSubmit: (x) => event = event.copyWith(venue: x),
              ),
              AppSizes.normalY,
              AppDatePickerField(
                label: 'Start Date & Time',
                initial: shouldEdit ? event.startAt : null,
                onChanged: (x) => event = event.copyWith(startAt: x),
              ),
              AppSizes.normalY,
              AppDatePickerField(
                label: 'End Date & Time',
                initial: shouldEdit ? event.endAt : null,
                onChanged: (x) => event = event.copyWith(endAt: x),
              ),
              AppSizes.largeY,
            ],
          ),
        ),
      ),
      bottomSheet: const Divider(height: 0),
      bottomNavigationBar: Padding(
        padding: AppPaddings.normal,
        child: ElevatedButton(
          onPressed: save,
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.green),
          child: shouldEdit ? const Text('Save') : const Text('Create'),
        ),
      ),
    );
  }

  void save() {
    final isValid = formKey.currentState?.validate() ?? false;
    if (isValid == false) return;
    formKey.currentState?.save();

    final repo = ref.read(eventRepoProvider);
    context.showLoadingUntil(
      shouldEdit ? repo.updateEvent(event) : repo.addEvent(event),
      then: (_) {
        if (shouldEdit) context.pop();
        context.pop();
      },
    );
  }
}
