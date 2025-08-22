import 'package:flutter/material.dart';
import 'package:govdesign_system_govbr/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gov.br Design System Demo',
      theme: GovBrTheme.themeData,
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
  bool _switchValue = true;
  bool _checkboxValue = true;
  int? _radioValue = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemplo Material'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Headline Large',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Headline Medium',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Headline Small',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Body Large: Este é um texto de exemplo para demonstrar o corpo do texto no aplicativo.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Body Medium: Este é um texto de exemplo menor.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            const Text('Botões com SnackBar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Ação concluída com sucesso!', style: TextStyle(color: Colors.black),),
                        backgroundColor: Theme.of(context).secondary10,
                      ),
                    );
                  },
                  child: const Text('Sucesso'),
                ),
                OutlinedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Esta é uma mensagem de informação.'),
                      ),
                    );
                  },
                  child: const Text('Informação'),
                ),
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Ocorreu um erro.', style: TextStyle(color: Colors.black),),
                        backgroundColor: Theme.of(context).errorMessage,
                      ),
                    );
                  },
                  child: const Text('Erro'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text('Campo de Texto', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Label',
                hintText: 'Digite algo aqui...',
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Com erro',
                errorText: 'Este campo é obrigatório.',
              ),
            ),
            const SizedBox(height: 24),
            const Text('Indicador de Progresso', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const Center(child: CircularProgressIndicator()),
            const SizedBox(height: 16),
            const LinearProgressIndicator(),
            const SizedBox(height: 24),
            const Text('Outros Controles', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            SwitchListTile(
              title: const Text('Switch'),
              value: _switchValue,
              onChanged: (bool value) {
                setState(() {
                  _switchValue = value;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Checkbox'),
              value: _checkboxValue,
              onChanged: (bool? value) {
                setState(() {
                  _checkboxValue = value ?? false;
                });
              },
            ),
            RadioListTile<int>(
              title: const Text('Radio 1'),
              value: 1,
              groupValue: _radioValue,
              onChanged: (int? value) {
                setState(() {
                  _radioValue = value;
                });
              },
            ),
            RadioListTile<int>(
              title: const Text('Radio 2'),
              value: 2,
              groupValue: _radioValue,
              onChanged: (int? value) {
                setState(() {
                  _radioValue = value;
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Negócios',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Escola',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: GovBrTheme.primaryColor,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.message),
              title: Text(
                'Mensagens',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: Text(
                'Perfil',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: Text(
                'Configurações',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}