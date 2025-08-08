import 'package:flutter/material.dart';

/// Botões padrão do Design System gov.br

/// Botão principal (filled)
class GovPrimaryButton extends StatelessWidget {
  /// Conteúdo do botão (texto, ícone, etc.)
  final Widget child;

  /// Callback de clique
  final VoidCallback onPressed;

  /// Estado desabilitado
  final bool disabled;

  /// Preenche a largura disponível
  final bool fullWidth;

  const GovPrimaryButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.disabled = false,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton(
      onPressed: disabled ? null : onPressed,
      child: child,
    );

    return fullWidth
        ? SizedBox(width: double.infinity, child: button)
        : button;
  }
}

/// Botão secundário (outlined)
class GovSecondaryButton extends StatelessWidget {
  /// Conteúdo do botão 
  final Widget child;

  /// Callback de clique
  final VoidCallback onPressed;

  /// Estado desabilitado
  final bool disabled;

  /// Preenche a largura disponível
  final bool fullWidth;

  const GovSecondaryButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.disabled = false,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    final button = OutlinedButton(
      onPressed: disabled ? null : onPressed,
      child: child,
    );

    return fullWidth
        ? SizedBox(width: double.infinity, child: button)
        : button;
  }
}

/// Botão de texto (text button)
class GovTextButton extends StatelessWidget {
  /// Conteúdo do botão 
  final Widget child;

  /// Callback de clique
  final VoidCallback onPressed;

  /// Estado desabilitado
  final bool disabled;

  /// Preenche a largura disponível
  final bool fullWidth;

  const GovTextButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.disabled = false,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    final button = TextButton(
      onPressed: disabled ? null : onPressed,
      child: child,
    );

    return fullWidth
        ? SizedBox(width: double.infinity, child: button)
        : button;
  }
}

/// Botão de ícone (icon button)
class GovIconButton extends StatelessWidget {
  /// Ícone do botão
  final IconData icon;

  /// Callback de clique
  final VoidCallback onPressed;

  /// Estado desabilitado
  final bool disabled;

  const GovIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: disabled ? null : onPressed,
      icon: Icon(icon),
    );
  }
}
