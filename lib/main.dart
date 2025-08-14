import 'package:flutter/material.dart';
import 'package:govdesign_system/gov_design_system.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DS Gov.br Demo',
      theme: GovBrTheme.themeData,
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GovAppBar(
        title: 'Design System Gov.br',
        actions: [
          GovBrButton.icon(
            icon: const Icon(Icons.search),
            onPressed: () => GovSnackBar.showInfo(context, 'Busca ativada!'),
            tooltip: 'Buscar',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Botões', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                GovBrButton.primary(
                  label: 'Sucesso',
                  icon: const Icon(Icons.check_circle, size: 18),
                  onPressed: () => GovSnackBar.showSuccess(context, 'Ação concluída com sucesso!'),
                ),
                GovBrButton.secondary(
                  label: 'Informação',
                  onPressed: () => GovDialogs.showIcon(
                    context,
                    icon: Icons.info,
                    title: 'Diálogo de Informação',
                    content: const Text('Este é um exemplo de diálogo do sistema.'),
                    actions: [
                      GovBrButton.text(label: 'Fechar', onPressed: () => Navigator.of(context).pop()),
                    ],
                  ),
                ),
                GovBrButton.text(
                  label: 'Erro',
                  onPressed: () => GovSnackBar.showError(context, 'Ocorreu um erro inesperado.'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text('Campos de Texto', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            const GovTextField(
              label: 'Nome Completo',
              hintText: 'Digite seu nome...',
            ),
            const SizedBox(height: 16),
            const GovTextField(
              label: 'Senha',
              obscureText: true,
            ),
            const SizedBox(height: 16),
            const GovTextField(
              label: 'Campo com Erro',
              errorText: 'Este campo é obrigatório.',
            ),
            const SizedBox(height: 24),
            Text('Indicadores de Progresso', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GovProgressIndicator(), // Circular
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: LinearProgressIndicator(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: GovBottomNavBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      drawer: GovNavigationDrawer(
        header: const Text(
          'Menu Principal',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        children: [
          GovDrawerItem(
            icon: Icons.message,
            title: 'Mensagens',
            onTap: () {},
          ),
          GovDrawerItem(
            icon: Icons.account_circle,
            title: 'Meu Perfil',
            onTap: () {},
          ),
          const Divider(),
          GovDrawerItem(
            icon: Icons.settings,
            title: 'Configurações',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
