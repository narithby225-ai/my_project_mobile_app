# 🛒 Cambodia Store - Flutter E-commerce App

A complete, modern e-commerce mobile application built with Flutter. Features include product browsing, shopping cart with hover preview, admin dashboard, and user authentication.

![Flutter](https://img.shields.io/badge/Flutter-3.41.6-blue.svg)
![Dart](https://img.shields.io/badge/Dart-3.0+-blue.svg)
![Platform](https://img.shields.io/badge/platform-Android%20%7C%20iOS%20%7C%20Web-lightgrey.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)

## 📱 Screenshots

### Home Screen
- Beautiful carousel slider with product images
- Featured products in grid layout
- Search functionality
- Clean and modern UI

### Shopping Cart
- Hover preview popup on cart icon
- Real-time cart updates
- Quantity management
- Total price calculation

### Admin Dashboard
- Product CRUD operations
- Image URL management
- Real-time product updates

## ✨ Features

### 🏪 **E-commerce Core**
- ✅ Product catalog with 12+ products
- ✅ Product detail view with dialog
- ✅ Shopping cart functionality
- ✅ Cart hover preview (web)
- ✅ Search products
- ✅ Real-time cart updates

### 👤 **User Features**
- ✅ User authentication (login/logout)
- ✅ Profile management
- ✅ Settings screen
- ✅ Contact page with map
- ✅ Splash screen

### 🔧 **Admin Features**
- ✅ Admin dashboard
- ✅ Add/Edit/Delete products
- ✅ Product management
- ✅ Image URL upload

### 🎨 **UI/UX**
- ✅ Modern, clean design
- ✅ Bottom navigation bar (5 tabs)
- ✅ Carousel slider
- ✅ Responsive grid layout
- ✅ Cart hover preview
- ✅ Loading indicators
- ✅ Error handling
- ✅ Animations and transitions

### 📱 **Navigation**
- ✅ Home
- ✅ Products
- ✅ Cart (with badge)
- ✅ Admin (admin only)
- ✅ Profile

## 🏗️ Architecture

### **State Management**
- Provider pattern
- Reactive UI updates
- Efficient rebuilds

### **Project Structure**
```
lib/
├── main.dart
├── models/
│   ├── product.dart
│   └── cart_item.dart
├── providers/
│   ├── auth_provider.dart
│   ├── product_provider.dart
│   └── cart_provider.dart
├── screens/
│   ├── splash_screen.dart
│   ├── login_screen.dart
│   ├── home_screen.dart
│   ├── products_screen.dart
│   ├── cart_screen.dart
│   ├── admin_screen.dart
│   ├── profile_screen.dart
│   ├── settings_screen.dart
│   ├── contact_screen.dart
│   └── main_navigation.dart
└── widgets/
    ├── product_card.dart
    ├── product_detail_dialog.dart
    ├── cart_hover_preview.dart
    ├── hoverable_product_card.dart
    └── app_drawer.dart
```

## 🚀 Getting Started

### **Prerequisites**
- Flutter SDK 3.41.6 or higher
- Dart 3.0 or higher
- Android Studio / VS Code
- Git

### **Installation**

1. **Clone the repository**
```bash
git clone https://github.com/narithby225-ai/my_project_mobile_app.git
cd my_project_mobile_app
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Run the app**
```bash
# For web
flutter run -d chrome

# For Android
flutter run -d android

# For iOS
flutter run -d ios
```

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  
  # State Management
  provider: ^6.1.2
  
  # UI Components
  carousel_slider: ^4.2.1
  badges: ^3.1.2
  
  # Storage
  shared_preferences: ^2.3.4
  
  # Utilities
  url_launcher: ^6.3.1
  intl: ^0.19.0
```

## 🔐 Admin Credentials

To access the admin dashboard:
- **Username**: `admin_narith`
- **Password**: `admin123`

## 🎯 Key Implementations

### **1. Cart Hover Preview**
Hover over the cart icon to see a preview of cart contents without navigation.

```dart
// Features:
- Shows up to 3 items
- Real-time updates
- Total price display
- "View Cart" button
- Compact design (280px width)
```

### **2. Product Management**
Admin can manage products with full CRUD operations.

```dart
// Capabilities:
- Add new products
- Edit existing products
- Delete products
- Upload image URLs
- Real-time updates
```

### **3. State Management**
Uses Provider for efficient state management.

```dart
// Providers:
- AuthProvider: User authentication
- ProductProvider: Product data
- CartProvider: Shopping cart
```

## 🎨 Design System

### **Colors**
- Primary Blue: `#2563EB`
- Background: `#F8FAFC`
- Text Primary: `#1E293B`
- Text Secondary: `#64748B`

### **Typography**
- Font Family: Inter
- Title: 18-20px, Bold
- Body: 13-14px, Regular
- Caption: 10-12px, Regular

### **Spacing**
- Grid spacing: 16px
- Card padding: 16px
- Section margin: 24px

## 📄 Documentation

Additional documentation files included:
- `FEATURES.md` - Complete feature list
- `QUICKSTART.md` - Quick start guide
- `DESIGN_UPDATE.md` - Design system details
- `CART_HOVER_FEATURE.md` - Cart hover implementation
- `CART_IMPROVEMENTS_KH.md` - Cart improvements (Khmer)
- `NAVIGATION_BAR_GUIDE.md` - Navigation setup

## 🔨 Build & Deploy

### **Build for Web**
```bash
flutter build web --release
```

### **Build for Android**
```bash
flutter build apk --release
```

### **Build for iOS**
```bash
flutter build ios --release
```

## 🐛 Troubleshooting

### **Common Issues**

1. **Dependency conflicts**
```bash
flutter pub upgrade
flutter pub get
```

2. **Build cache issues**
```bash
flutter clean
flutter pub get
```

3. **Platform-specific issues**
```bash
cd android && ./gradlew clean
cd ios && pod install
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 👨‍💻 Author

**Narith**
- GitHub: [@narithby225-ai](https://github.com/narithby225-ai)
- Project: [my_project_mobile_app](https://github.com/narithby225-ai/my_project_mobile_app)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Provider package for state management
- Carousel Slider for the image slider
- All open-source contributors

## 📞 Contact

For questions or support, please open an issue on GitHub.

---

**Built with ❤️ using Flutter**

🌟 If you like this project, please give it a star!
