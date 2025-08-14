import 'package:flutter/material.dart';

/// Uma classe de fábrica para criar botões padronizados do Design System gov.br.
///
/// Em vez de ter um widget para cada tipo de botão, esta classe fornece
/// construtores estáticos que retornam widgets de botão do Material já estilizados.
class GovBrButton {
  /// Cria um botão primário (preenchido).
  ///
  /// É o botão de maior destaque, usado para ações principais.
  ///
  /// [label] é o texto exibido no botão.
  /// [onPressed] é a função chamada quando o botão é tocado.
  /// [icon] é um widget opcional (geralmente um `Icon`) exibido antes do texto.
  /// [fullWidth] se `true`, o botão ocupa toda a largura disponível.
  static Widget primary({
    required String label,
    required VoidCallback? onPressed,
    Widget? icon,
    bool fullWidth = false,
  }) {
    final button = ElevatedButton(
      onPressed: onPressed,
      child: _buildButtonChild(label, icon),
    );

    return fullWidth ? SizedBox(width: double.infinity, child: button) : button;
  }

  /// Cria um botão secundário (contornado).
  ///
  /// Usado para ações secundárias que precisam de menos destaque que as primárias.
  ///
  /// [label] é o texto exibido no botão.
  /// [onPressed] é a função chamada quando o botão é tocado.
  /// [icon] é um widget opcional (geralmente um `Icon`) exibido antes do texto.
  /// [fullWidth] se `true`, o botão ocupa toda a largura disponível.
  static Widget secondary({
    required String label,
    required VoidCallback? onPressed,
    Widget? icon,
    bool fullWidth = false,
  }) {
    final button = OutlinedButton(
      onPressed: onPressed,
      child: _buildButtonChild(label, icon),
    );

    return fullWidth ? SizedBox(width: double.infinity, child: button) : button;
  }

  /// Cria um botão de texto.
  ///
  /// Usado para ações de menor prioridade, como links ou ações em diálogos.
  ///
  /// [label] é o texto exibido no botão.
  /// [onPressed] é a função chamada quando o botão é tocado.
  /// [icon] é um widget opcional (geralmente um `Icon`) exibido antes do texto.
  /// [fullWidth] se `true`, o botão ocupa toda a largura disponível.
  static Widget text({
    required String label,
    required VoidCallback? onPressed,
    Widget? icon,
    bool fullWidth = false,
  }) {
    final button = TextButton(
      onPressed: onPressed,
      child: _buildButtonChild(label, icon),
    );

    return fullWidth ? SizedBox(width: double.infinity, child: button) : button;
  }

  /// Cria um botão de ícone.
  ///
  /// Usado para ações comuns em barras de ferramentas ou espaços compactos.
  ///
  /// [icon] é o `Icon` a ser exibido.
  /// [onPressed] é a função chamada quando o botão é tocado.
  static Widget icon({
    required Icon icon,
    required VoidCallback? onPressed,
    String? tooltip,
  }) {
    return IconButton(
      icon: icon,
      onPressed: onPressed,
      tooltip: tooltip,
    );
  }

  /// Constrói o conteúdo interno do botão (ícone + texto).
  static Widget _buildButtonChild(String label, Widget? icon) {
    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(width: 8),
          Text(label),
        ],
      );
    }
    return Text(label);
  }
}