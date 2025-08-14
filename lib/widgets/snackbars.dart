import 'package:flutter/material.dart';
import 'package:govdesign_system/theme.dart';

/// Uma classe de utilidade para exibir SnackBars padronizados do Design System gov.br.
class GovSnackBar {
  // Construtor privado para impedir a instanciação.
  GovSnackBar._();

  /// Exibe um SnackBar para informações gerais.
  static void showInfo(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        // A cor padrão já é definida no SnackBarThemeData em theme.dart
      ),
    );
  }

  /// Exibe um SnackBar para mensagens de sucesso.
  ///
  /// Utiliza a cor secundária do tema.
  static void showSuccess(BuildContext context, String message) {
    final theme = Theme.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: theme.textMessage)),
        backgroundColor: theme.secondary10, // Cor de sucesso do tema
      ),
    );
  }

  /// Exibe um SnackBar para mensagens de erro.
  ///
  /// Utiliza a cor de erro do tema.
  static void showError(BuildContext context, String message) {
    final theme = Theme.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: theme.textMessage)),
        backgroundColor: theme.errorMessage, // Cor de erro do tema
      ),
    );
  }
}
