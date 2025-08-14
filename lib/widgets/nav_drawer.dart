import 'package:flutter/material.dart';

/// Widget para um item de navegação padrão do gov.br dentro de um [GovNavigationDrawer].
class GovDrawerItem extends StatelessWidget {
  /// Texto exibido no item.
  final String title;

  /// Ícone exibido antes do texto.
  final IconData icon;

  /// Callback chamado quando o item é tocado.
  final VoidCallback onTap;

  const GovDrawerItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      leading: Icon(icon, color: theme.primaryColor),
      title: Text(
        title,
        style: theme.textTheme.bodyLarge?.copyWith(color: theme.primaryColor),
      ),
      onTap: () {
        // Fecha o drawer antes de chamar o callback.
        Navigator.of(context).pop();
        onTap();
      },
      splashColor: theme.primaryColor.withOpacity(0.1),
    );
  }
}

/// Drawer (menu lateral) customizado baseado no Design System gov.br.
class GovNavigationDrawer extends StatelessWidget {
  /// Widget opcional para ser exibido no topo do drawer, como um cabeçalho.
  final Widget? header;

  /// A lista de widgets que serão exibidos como itens do drawer.
  ///
  /// Geralmente uma lista de [GovDrawerItem].
  final List<Widget> children;

  const GovNavigationDrawer({
    super.key,
    this.header,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (header != null)
            Container(
              padding: const EdgeInsets.all(16.0).add(const EdgeInsets.only(top: 24.0)),
              color: theme.primaryColor,
              child: header,
            ),
          Expanded(
            child: ListView(padding: EdgeInsets.zero, children: children),
          ),
        ],
      ),
    );
  }
}