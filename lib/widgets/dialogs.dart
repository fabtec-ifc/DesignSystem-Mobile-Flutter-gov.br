import 'package:flutter/material.dart';

/// Uma classe de utilidade para exibir diálogos padronizados do Design System gov.br.
class GovDialogs {
  /// Exibe um diálogo padrão com título, conteúdo e ações.
  ///
  /// A aparência é definida pelo `dialogTheme` no `theme.dart`.
  static Future<T?> show<T>(BuildContext context, {
    required String title,
    required Widget content,
    required List<Widget> actions,
  }) {
    return showDialog<T>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: content,
        actions: actions,
        actionsPadding: const EdgeInsets.all(16.0),
      ),
    );
  }

  /// Exibe um diálogo que inclui um ícone ao lado do título.
  static Future<T?> showIcon<T>(BuildContext context, {
    required IconData icon,
    required String title,
    required Widget content,
    required List<Widget> actions,
    Color? iconColor,
  }) {
    final theme = Theme.of(context);
    return showDialog<T>(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(icon, color: iconColor ?? theme.primaryColor, size: 28),
            const SizedBox(width: 12),
            Expanded(child: Text(title)),
          ],
        ),
        content: content,
        actions: actions,
        actionsPadding: const EdgeInsets.all(16.0),
      ),
    );
  }
}
