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
      title: 'Teste Design System Gov.br',
      theme: AppTheme.themeData,
      home: const MyHomePage(),
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
    if (index == 2) {
      GovSnackBar.showInfo(context, 'Você tocou no ícone de informações!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Design System Gov.br'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Botões', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            GovPrimaryButton(
              onPressed: () {},
              child: const Text('Botão Primário'),
            ),
            const SizedBox(height: 16),
            GovSecondaryButton(
              onPressed: () {},
              child: const Text('Botão Secundário'),
            ),
            const SizedBox(height: 16),
            GovTextButton(
              onPressed: () {},
              child: const Text('Botão de Texto'),
            ),
            const SizedBox(height: 24),
            const Text('Campo de Texto', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const GovTextField(
              label: 'Label do Campo',
            ),
            const SizedBox(height: 16),
            const GovTextField(
              label: 'Campo com Erro',
              hasError: true,
            ),
            const SizedBox(height: 24),
            const Text('Outros Componentes', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const GovProgressIndicator(),
            const SizedBox(height: 16),
            GovPrimaryButton(
              onPressed: () => GovDialogs.showIconTitleDialog(
                context,
                title: 'Diálogo de Teste',
                content: const Text('Este é um diálogo de exemplo.'),
                actions: [
                  TextButton(onPressed: () => Navigator.pop(context), child: const Text('FECHAR'))
                ],
                icon: Icons.info_outline,
              ),
              child: const Text('Abrir Diálogo'),
            ),
             const SizedBox(height: 16),
            GovPrimaryButton(
              onPressed: () => GovSnackBar.showSuccess(context, 'Operação realizada com sucesso!'),
              child: const Text('Mostrar SnackBar'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GovBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Busca',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
        ],
      ),
    );
  }
}