import 'package:flutter/material.dart';

import '../../../../core/utils/form_validations.dart';
import '../../../app/constants.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.onSubmit,
    this.initialValue,
    this.prefix,
    this.suffix,
    this.maxLines,
    this.obscure = false,
    this.enabled = true,
    this.listenChanges = false,
    this.validator,
    this.keyboardType = TextInputType.name,
    this.textCapitalization = TextCapitalization.none,
  });

  const AppTextField.name({
    super.key,
    required this.label,
    required this.hint,
    required this.onSubmit,
    this.initialValue,
    this.suffix,
    this.maxLines,
    this.listenChanges = false,
  })  : prefix = null,
        obscure = false,
        enabled = true,
        validator = FormValidations.longInput,
        keyboardType = TextInputType.name,
        textCapitalization = TextCapitalization.words;

  const AppTextField.email({
    super.key,
    required this.label,
    required this.hint,
    required this.onSubmit,
    this.initialValue,
    this.suffix,
    this.listenChanges = false,
  })  : maxLines = null,
        prefix = null,
        obscure = false,
        enabled = true,
        validator = FormValidations.email,
        keyboardType = TextInputType.emailAddress,
        textCapitalization = TextCapitalization.none;

  const AppTextField.password({
    super.key,
    required this.label,
    required this.hint,
    required this.onSubmit,
    this.initialValue,
    this.suffix,
    this.listenChanges = false,
    this.validator = FormValidations.password,
  })  : maxLines = 1,
        prefix = null,
        obscure = true,
        enabled = true,
        keyboardType = TextInputType.visiblePassword,
        textCapitalization = TextCapitalization.words;

  const AppTextField.phone({
    super.key,
    required this.label,
    required this.hint,
    required this.onSubmit,
    this.initialValue,
    this.suffix,
    this.listenChanges = false,
  })  : maxLines = null,
        prefix = AppConstants.phoneCode,
        obscure = false,
        enabled = true,
        validator = FormValidations.phone,
        keyboardType = TextInputType.phone,
        textCapitalization = TextCapitalization.none;

  const AppTextField.number({
    super.key,
    required this.label,
    required this.hint,
    required this.onSubmit,
    this.initialValue,
    this.suffix,
    this.listenChanges = false,
  })  : maxLines = null,
        prefix = null,
        obscure = false,
        enabled = true,
        validator = FormValidations.number,
        keyboardType = TextInputType.number,
        textCapitalization = TextCapitalization.none;

  const AppTextField.readonly({
    super.key,
    required this.label,
    required this.initialValue,
    this.suffix,
  })  : onSubmit = null,
        hint = '',
        listenChanges = false,
        maxLines = null,
        prefix = null,
        obscure = false,
        enabled = false,
        validator = FormValidations.number,
        keyboardType = TextInputType.number,
        textCapitalization = TextCapitalization.none;

  final String label;
  final String hint;
  final String? initialValue;
  final String? prefix;
  final String? suffix;
  final void Function(String)? onSubmit;
  final int? maxLines;
  final bool obscure;
  final bool enabled;
  final bool listenChanges;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool hideText = widget.obscure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      obscureText: hideText,
      maxLines: widget.maxLines,
      initialValue: widget.initialValue,
      style: Theme.of(context).textTheme.bodyLarge,
      keyboardType: widget.keyboardType,
      textCapitalization: widget.textCapitalization,
      onChanged: widget.listenChanges ? widget.onSubmit : null,
      validator: widget.validator,
      onSaved: (x) => widget.onSubmit != null ? widget.onSubmit!(x?.trim() ?? '') : null,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      onEditingComplete: () => FocusManager.instance.primaryFocus?.nextFocus(),
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
        suffixIcon: togglePasswordWidget,
        prefixText: widget.prefix != null ? '${widget.prefix}  ' : null,
        suffixText: widget.suffix,
      ),
    );
  }

  Widget? get togglePasswordWidget {
    if (widget.obscure == false) return null;
    return ExcludeFocus(
      child: TextButton(
        onPressed: () => setState(() => hideText = !hideText),
        child: hideText ? const Text('Show') : const Text('Hide'),
      ),
    );
  }
}
