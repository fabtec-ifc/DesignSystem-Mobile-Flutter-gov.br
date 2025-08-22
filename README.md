# Design System Gov.br para Flutter

![Logo Gov.br](https://www.gov.br/governodigital/pt-br/estrategias-e-governanca-digital/rede-nacional-de-governo-digital/10passos/biblioteca/logo-govbr.png/@@images/image)

Este pacote é uma implementação em Flutter dos componentes de interface e diretrizes visuais do **Design System do Governo Federal do Brasil**. O objetivo é fornecer um conjunto de widgets reutilizáveis e padronizados para facilitar o desenvolvimento de aplicativos móveis consistentes e alinhados à identidade visual do Gov.br.

## Tabela de Conteúdos

- [Instalação](#instalação)
- [Como Usar](#como-usar)
  - [1. Configurando as Fontes](#1-configurando-as-fontes)
  - [2. Aplicando o Tema Principal](#2-aplicando-o-tema-principal)
  - [3. Utilizando os Widgets](#3-utilizando-os-widgets)
- [Componentes Disponíveis](#componentes-disponíveis)
- [Executando os Testes](#executando-os-testes)
- [Como Contribuir](#como-contribuir)
- [Licença](#licença)

## Instalação

Para utilizar este Design System em seu projeto Flutter, adicione a dependência diretamente do repositório do GitHub.

No seu arquivo `pubspec.yaml`, adicione o seguinte:

```yaml
dependencies:
  flutter:
    sdk: flutter
  
  govdesign_system:
    git:
      url: https://github.com/fabtec-ifc/DesignSystem-Mobile-Flutter-gov.br.git
      # Opcional: você pode travar uma versão específica usando uma tag ou commit
      # ref: v1.0.0
```

Depois, execute o comando para instalar os pacotes:

```sh
flutter pub get
```

## Como Usar

Siga os passos abaixo para configurar e utilizar o Design System em seu aplicativo.

### 1. Configurando as Fontes

O Design System utiliza a família de fontes "Rawline". Para garantir que ela seja carregada em seu aplicativo, certifique-se de que a seguinte configuração de `assets` e `fonts` está presente no seu `pubspec.yaml`:

```yaml
flutter:
  uses-material-design: true

  assets:
    # Adicione o caminho para as fontes, caso as copie para seu projeto
    - assets/fonts/

  fonts:
    - family: Rawline
      fonts:
        - asset: assets/fonts/rawline-100.ttf
          weight: 100
        - asset: assets/fonts/rawline-400.ttf
          weight: 400
        - asset: assets/fonts/rawline-600.ttf
          weight: 600
        - asset: assets/fonts/rawline-700.ttf
          weight: 700
```
*Nota: Ao usar o pacote via GitHub, as fontes já estão inclusas. A configuração acima é recomendada para garantir que o Flutter as reconheça corretamente.*

### 2. Aplicando o Tema Principal

Para aplicar o estilo visual do Gov.br em todo o seu aplicativo, importe o tema e o defina na propriedade `theme` do seu `MaterialApp`.

```dart
import 'package:flutter/material.dart';
import 'package:govdesign_system/theme.dart'; // Importe o tema

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Gov.br',
      theme: GovBrTheme.themeData, // Aplique o tema aqui
      home: const MyHomePage(),
    );
  }
}
```

### 3. Utilizando os Widgets

Após configurar o tema, você pode importar e usar qualquer widget do Design System conforme o exemplo em main.dart, ou pode utilizar os widgets normais do material conforme o exemplo no teste.dart.

**Exemplo de uso de um botão:**

```dart
import 'package:flutter/material.dart';
import 'package:govdesign_system/gov_design_system.dart'; // Import único para todos os componentes implementados no Design System

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página Inicial'),
      ),
      body: Center(
        child: GovBrButton.primary(
          label: 'Clique Aqui',
          onPressed: () {
            print('Botão primário pressionado!');
          },
        ),
      ),
    );
  }
}
```

## Componentes Disponíveis

Abaixo está a lista de componentes atualmente disponíveis no pacote:

- **AppBar:** Barra de aplicativo superior.
- **BottomNavBar:** Barra de navegação inferior.
- **Buttons:** Botões primários, secundários e outros.
- **Dialogs:** Caixas de diálogo e modais.
- **NavDrawer:** Menu de navegação lateral (drawer).
- **ProgressIndicator:** Indicadores de progresso.
- **Snackbars:** Notificações temporárias.
- **TextFields:** Campos de entrada de texto.

## Executando os Testes

Para garantir a integridade e o funcionamento correto dos componentes, execute a suíte de testes do projeto:

```sh
flutter test
```

## Licença

Este projeto é distribuído sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.