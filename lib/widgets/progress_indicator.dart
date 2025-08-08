import 'package:flutter/material.dart';

class GovProgressIndicator extends StatelessWidget {
  final double? value;

  const GovProgressIndicator({super.key, this.value});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(value: value);
  }
}