# 🛒 CartYap - AI Walmart Navigator

<div align="center">
  <img src="CartYap/assets/logo.png" alt="CartYap Logo" width="120" height="120">
  
  **Hands-free conversational AI bot for voice-guided shopping navigation in Walmart stores**
  
  [![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
  [![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
  [![License](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](LICENSE)
  
  ### 🎥 [**Watch Demo Video**](https://youtu.be/dIYaWUeynFg)
  
  [![Demo Video](https://img.shields.io/badge/YouTube-FF0000?style=for-the-badge&logo=youtube&logoColor=white)](https://youtu.be/dIYaWUeynFg)
  
</div>

---

## 📱 About CartYap

CartYap revolutionizes the in-store shopping experience by providing an intelligent, voice-activated navigation system specifically designed for Walmart stores. With its beautiful Material Design 3 interface and advanced voice recognition capabilities, CartYap makes shopping more efficient, accessible, and enjoyable.

### ✨ Key Features

- 🎤 **Voice-Activated Navigation** - Hands-free product search and store navigation
- 🗺️ **Interactive Store Map** - Visual representation of store layout with 4 main aisles
- 🔍 **Smart Product Search** - Find products quickly with real-time search results
- 📍 **Aisle Location** - Get precise aisle numbers and product locations
- 🛍️ **Product Information** - View prices, availability, and category details
- 🎨 **Beautiful UI** - Modern Material Design 3 with Walmart branding
- 🌟 **Animated Interactions** - Lottie animations and custom visual feedback

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.8.1 or higher)
- Dart SDK
- Android Studio / Xcode for mobile development
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/FakePickle/AI-Walmart-Navigator.git
   cd AI-Walmart-Navigator/CartYap
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run
   ```

### 📱 Platform Support

CartYap supports multiple platforms:

- ✅ **Android** - Full feature support
- ✅ **iOS** - Full feature support  
- ✅ **Web** - Responsive web application
- ✅ **Linux** - Desktop application
- ✅ **macOS** - Native macOS support
- ✅ **Windows** - Native Windows support

## 🏗️ Architecture

### Project Structure

```
CartYap/
├── lib/
│   ├── main.dart              # App entry point and main navigation
│   └── pages/
│       ├── search_page.dart   # Product search functionality
│       └── map_page.dart      # Interactive store map
├── assets/
│   ├── logo.png              # App logo
│   └── voice-chat.json       # Lottie animation for voice chat
├── android/                  # Android-specific files
├── ios/                     # iOS-specific files
├── web/                     # Web deployment files
├── linux/                   # Linux desktop files
├── macos/                   # macOS desktop files
└── windows/                 # Windows desktop files
```

### Core Components

#### 🏠 Main Application (`main.dart`)
- **MyApp**: Root application widget with Material Design 3 theming
- **MyHomePage**: Main navigation hub with bottom navigation bar
- **Voice Assistant**: Interactive floating action button with multiple states
- **Custom Animations**: Siri-like wave animations and Lottie integrations

#### 🔍 Search Page (`search_page.dart`)
- Real-time product search functionality
- Comprehensive product database with 4-aisle store layout
- Category-based filtering and sorting
- Product details with pricing and availability

#### 🗺️ Map Page (`map_page.dart`)
- Interactive store layout visualization
- Aisle-based navigation system
- Product location mapping
- Visual store representation

## 🎨 Design System

### Color Palette

CartYap uses Walmart's official brand colors:

- **Primary Blue**: `#0071CE` - Main brand color for primary actions
- **Walmart Yellow**: `#FFC220` - Secondary color for highlights and accents
- **Background**: `#F5F5F5` - Clean, accessible background
- **Text Primary**: `#333333` - High contrast text
- **Text Secondary**: `#666666` - Supporting text elements

### Typography

- **Font Family**: Roboto (Material Design standard)
- **Weights**: Regular (400), Bold (700)
- **Accessibility**: High contrast ratios for readability

## 🔧 Dependencies

### Core Dependencies

```yaml
dependencies:
  flutter: sdk
  cupertino_icons: ^1.0.8
  lottie: ^3.3.1                    # Animation support
  salomon_bottom_bar: ^3.3.2        # Beautiful bottom navigation
  webview_flutter: ^4.13.0          # Web view integration
  flutter_speed_dial: ^7.0.0        # Floating action button menu
  flutter_svg: ^2.2.0               # SVG support
```

### Development Dependencies

```yaml
dev_dependencies:
  flutter_test: sdk
  flutter_launcher_icons: ^0.13.1   # App icon generation
```

## 🎯 Features in Detail

### Voice Navigation System

The voice assistant features three distinct states:

1. **Default State** - Static microphone icon
2. **Listening State** - Animated Lottie voice visualization
3. **Processing State** - Siri-like wave animation with custom painter

### Store Layout

CartYap models a comprehensive 4-aisle Walmart store:

- **Aisle 1**: Personal Care & Hygiene
- **Aisle 2**: Canned Goods & Pantry Items
- **Aisle 3**: Dairy & Refrigerated Products
- **Aisle 4**: Fresh Produce & Bakery Items

### Search Functionality

- **Real-time Search**: Instant results as you type
- **Category Filtering**: Filter by product categories
- **Stock Status**: Real-time inventory information
- **Price Display**: Current pricing with Walmart styling

### Development Guidelines

- Follow Flutter's official style guide
- Maintain consistent code formatting with `dart format`
- Add tests for new features
- Update documentation as needed
- Ensure accessibility standards are met

## 📊 Project Status

- ✅ **Core Navigation**: Complete
- ✅ **Product Search**: Complete
- ✅ **Store Mapping**: Complete
- ✅ **Voice Interface**: Complete
- 🚧 **AI Integration**: In Progress
- 🚧 **Backend Services**: Planned
- 🚧 **User Accounts**: Planned

## 🐛 Known Issues

- Voice recognition requires device microphone permissions
- Some animations may not display properly on older devices
- Web version has limited voice functionality

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **Walmart** for brand guidelines and inspiration
- **Flutter Team** for the amazing framework
- **Lottie** for beautiful animations
- **Material Design** for design system guidance

---

<div align="center">
  
  **Made with ❤️ and Flutter**
  
  *Transforming the shopping experience, one voice command at a time*
  
</div>
