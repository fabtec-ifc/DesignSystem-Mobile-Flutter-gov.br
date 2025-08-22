import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Um campo de texto customizado que encapsula o [TextFormField] do Material,
/// aplicando o estilo do Design System gov.br.
class GovTextField extends StatelessWidget {
  final String label;
  final String? hintText;
  final String? errorText;
  final TextEditingController? controller;
  final bool obscureText;
  final bool enabled;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;

  const GovTextField({
    super.key,
    required this.label,
    this.hintText,
    this.errorText,
    this.controller,
    this.obscureText = false,
    this.enabled = true,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.inputFormatters,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      enabled: enabled,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        errorText: errorText,
        suffixIcon: suffixIcon,
      ),
      onChanged: onChanged,
      validator: validator,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
