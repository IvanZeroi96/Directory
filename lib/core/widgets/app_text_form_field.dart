import 'package:directory/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final Function(String)? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final void Function(String)? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final String? labelText;
  final TextInputType? keyboardType;
  final int? max;
  final int? maxLine;
  final bool enabled;
  final bool filled;
  final String? suffixText;
  final String? prefixText;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final TextEditingController? controller;

  const AppTextFormField({
    super.key,
    this.obscureText = false,
    this.validator,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.labelText,
    this.keyboardType,
    this.onFieldSubmitted,
    this.controller,
    this.max = 0,
    this.enabled = true,
    this.filled = true,
    this.maxLine = 1,
    this.suffixText,
    this.prefixText,
    this.floatingLabelBehavior = FloatingLabelBehavior.always,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: PageStorageKey(labelText),
      autocorrect: false,
      obscureText: obscureText,
      controller: controller,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(color: enabled ? AppColors.textColor : Colors.black54),
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      maxLength: (max != 0) ? max : null,
      maxLines: maxLine,
      onSaved: onSaved,
      cursorColor: AppColors.primaryColor,
      textCapitalization: TextCapitalization.characters,
      decoration: InputDecoration(
          prefixIcon: prefixIcon,
          labelText: labelText,
          contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          labelStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: enabled ? AppColors.textColor : Colors.black54,
                fontSize: 20,
              ),
          focusColor: Colors.amber,
          filled: filled,
          isDense: false,
          enabled: enabled,
          floatingLabelBehavior: floatingLabelBehavior,
          fillColor: AppColors.backgroundScaffold,
          border: _buildBorder(Colors.black45),
          disabledBorder: _buildBorder(Colors.black26),
          enabledBorder: _buildBorder(Colors.black38),
          focusedBorder: _buildBorder(AppColors.primaryColor),
          errorBorder: _buildBorder(AppColors.red),
          suffixText: suffixText,
          prefixText: prefixText,
          focusedErrorBorder: _buildBorder(AppColors.red),
          suffixIcon: suffixIcon,
          counterText: '',
          hoverColor: AppColors.primaryColor),
    );
  }

  InputBorder _buildBorder(Color color) {
    return InputBorder.none;
  }
}
