import 'package:flutter/material.dart';

class GovTextField extends StatelessWidget {
  final String label;
  final bool hasError;
  final bool isDisabled;
  final String? errorText;
  final TextEditingController? controller;
  final bool obscureText;
  final ValueChanged<String>? onChanged;

  const GovTextField({
    super.key,
    required this.label,
    this.hasError = false,
    this.isDisabled = false,
    this.errorText,
    this.controller,
    this.obscureText = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      enabled: !isDisabled,
      decoration: InputDecoration(
        labelText: label,
        errorText: hasError ? errorText ?? 'Campo obrigatório' : null,
      ),
      onChanged: onChanged,
    );
  }
}