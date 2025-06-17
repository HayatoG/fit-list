# FitList

Um aplicativo Flutter para gerenciamento de treinos de academia, com interface minimalista e funcionalidades práticas para acompanhamento do seu progresso.

## 🚀 Funcionalidades

- **Interface Minimalista**: Design clean em tons de preto, cinza e branco
- **Treinos Customizáveis**: Crie seus próprios treinos ou use um treino pré-definido
- **Organização por Dia**: Treinos separados por dia da semana
- **Exercícios Detalhados**: 
  - Nome do exercício
  - Exercício alternativo
  - Número de séries
  - Número de repetições
  - Tipo de exercício (máquina, halter, etc.)
  - Categoria muscular
  - Notas/instruções
- **Recursos Visuais**: Suporte para adicionar imagens e GIFs aos exercícios
- **Progresso**: Marque exercícios e dias como concluídos
- **Primeira Experiência**: Escolha entre começar do zero ou usar um treino pré-configurado

## 🛠️ Requisitos Técnicos

- Flutter SDK: >=3.0.0 <4.0.0
- FVM (Flutter Version Management) para versionamento do Flutter
- Dispositivo/Emulador com suporte para Flutter

## 📦 Dependências Principais

```yaml
dependencies:
  flutter: sdk: flutter
  mobx: ^2.2.0    # Gerenciamento de estado
  flutter_mobx: ^2.0.6+5
  google_fonts: ^5.1.0  # Fontes personalizadas
  image_picker: ^1.0.1  # Seleção de imagens
  cached_network_image: ^3.2.3  # Cache de imagens
  path_provider: ^2.0.15  # Manipulação de arquivos
  shared_preferences: ^2.2.0  # Armazenamento local
```

## 🏗️ Arquitetura

- **MobX** para gerenciamento de estado
- Arquitetura baseada em:
  - Models (Exercise, Workout)
  - Stores (WorkoutStore)
  - Services (PresetWorkouts, Preferences)
  - Screens (Welcome, Home)
  - Widgets (componentes reutilizáveis)

## 💻 Instalação

1. Certifique-se de ter o Flutter instalado (>=3.0.0)
2. Clone o repositório
3. Instale o FVM (opcional)
4. Execute:
   ```bash
   flutter pub get
   flutter run
   ```

## 📱 Compatibilidade

- Orientação: Apenas modo retrato
- Plataformas: Android e iOS
- Tema: Dark mode

## 🎯 Regras de Negócio

- Treinos são organizados por dia da semana
- Exercícios podem ter alternativas para quando o equipamento principal não está disponível
- Categorias predefinidas de músculos (peito, costas, pernas, ombros, bíceps, tríceps, abdômen, panturrilha)
- Tipos de exercício predefinidos (máquina, halter, barra, peso corporal, com peso, qualquer)
- Treinos podem ser criados do zero ou carregados de um preset
- A escolha de usar um treino pronto é persistida para futuras aberturas do app
- Exercícios e dias completos podem ser marcados como concluídos
- Suporte para adicionar peso customizado a cada exercício
- Possibilidade de adicionar notas e instruções aos exercícios

## 📝 Notas de Versão

### 1.0.0+1
- Implementação inicial do app
- Sistema de treinos customizáveis
- Suporte a treinos pré-definidos
- Interface minimalista em dark mode
- Gerenciamento de estado com MobX
- Persistência de dados local