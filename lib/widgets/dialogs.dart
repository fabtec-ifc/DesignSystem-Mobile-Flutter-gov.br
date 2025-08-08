import 'package:flutter/material.dart';

class GovDialogs {
  static Future<void> showTitleDialog(BuildContext context, {required String title, required Widget content, required List<Widget> actions}) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: content,
        actions: actions,
      ),
    );
  }

  static Future<void> showIconTitleDialog(BuildContext context, {required String title, required Widget content, required List<Widget> actions, required IconData icon}) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(icon, size: 24),
            const SizedBox(width: 12),
            Expanded(child: Text(title)),
          ],
        ),
        content: content,
        actions: actions,
      ),
    );
  }

  static Future<void> showSimpleDialog(BuildContext context, {required Widget content, required List<Widget> actions}) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: content,
        actions: actions,
      ),
    );
  }
}