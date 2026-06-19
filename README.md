# Cambodia Store - Flutter E-commerce App

A full-featured e-commerce mobile application built with Flutter, converted from an HTML/JavaScript prototype. This app includes user authentication, product management, shopping cart functionality, and an admin dashboard.

## Features

### User Features
- ✅ **Splash Screen** - Beautiful loading screen with Cambodia flag
- ✅ **Login/Register** - Admin authentication system
- ✅ **Home Screen** - Featured products with image carousel
- ✅ **Product Browsing** - Grid view of all products with search
- ✅ **Product Details** - Detailed view in modal dialog
- ✅ **Shopping Cart** - Add/remove items, adjust quantities
- ✅ **Checkout** - Simple checkout process
- ✅ **Contact Page** - Contact form and information
- ✅ **Profile Screen** - User profile management
- ✅ **Settings Screen** - App settings and preferences
- ✅ **Navigation Drawer** - Easy navigation between screens

### Admin Features
- ✅ **Admin Dashboard** - Product management interface
- ✅ **Add Products** - Create new products with form validation
- ✅ **Edit Products** - Update existing product information
- ✅ **Delete Products** - Remove products with confirmation
- ✅ **Persistent Storage** - Products saved to local storage

### Technical Features
- 🎨 Clean, modern Material Design UI
- 📱 Responsive layout for mobile and web
- 💾 SharedPreferences for data persistence
- 🔄 Provider state management
- 🎭 Image carousel with auto-play
- 🔍 Real-time product search
- 🛒 Shopping cart with badge counter
- 🔐 Simple authentication system

## Project Structure

```
lib/
├── main.dart                     # App entry point
├── models/
│   ├── product.dart              # Product data model
│   └── cart_item.dart            # Cart item model
├── providers/
│   ├── auth_provider.dart        # Authentication state
│   ├── product_provider.dart     # Product management
│   └── cart_provider.dart        # Shopping cart state
├── screens/
│   ├── splash_screen.dart        # Initial loading screen
│   ├── login_screen.dart         # Admin login
│   ├── home_screen.dart          # Main home page
│   ├── products_screen.dart      # All products view
│   ├── cart_screen.dart          # Shopping cart
│   ├── admin_screen.dart         # Admin dashboard
│   ├── contact_screen.dart       # Contact form
│   ├── profile_screen.dart       # User profile
│   └── settings_screen.dart      # App settings
└── widgets/
    ├── product_card.dart         # Product card widget
    ├── product_detail_dialog.dart # Product details dialog
    └── app_drawer.dart           # Navigation drawer
```

## Installation

### Prerequisites
- Flutter SDK (3.11.4 or higher)
- Dart SDK
- Chrome, Android Studio, or iOS Simulator for testing

### Setup Steps

1. **Clone or download the project**
   ```bash
   cd "d:\Lessons_and_Codes\MAF-I\my_project_mobile_app - Copy"
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Clean build (if needed)**
   ```bash
   flutter clean
   flutter pub get
   ```

4. **Run on Chrome**
   ```bash
   flutter run -d chrome
   ```

5. **Run on Android Emulator**
   ```bash
   flutter run -d emulator-5554
   ```

6. **Run on Physical Device**
   ```bash
   flutter run
   ```

## Default Admin Credentials

For testing the admin features, use these credentials:

- **Username:** `admin_narith`
- **Password:** `admin123`

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  google_fonts: ^8.1.0
  http: ^1.6.0
  shared_preferences: ^2.2.2
  provider: ^6.1.1
  carousel_slider: ^5.0.0
  badges: ^3.1.2
  url_launcher: ^6.2.4
```

## Initial Products

The app comes pre-loaded with 12 sample products:
1. Bicycle - $150.00
2. Camera - $4,999.50
3. Bag - $22.75
4. Tie - $16.99
5. iPhone - $1,350.00
6. Headphones - $150.00
7. Tennis Shoes - $69.99
8. Laptop - $999.50
9. GYM Equipment - $999.00
10. Boots - $76.50
11. Belt - $9.50
12. Sample Book - $15.00

## Screens Overview

### 1. Splash Screen
- Shows Cambodia flag logo
- Auto-navigates to Login or Home based on auth state

### 2. Login Screen
- Clean login form with validation
- Shows demo credentials for easy access
- Gradient background design

### 3. Home Screen
- App bar with cart badge
- Search functionality
- Auto-playing image carousel
- Featured products grid (first 6 products)
- Quick links section
- Navigation drawer access

### 4. Products Screen
- Full product catalog
- Search bar at top
- Grid layout with 2 columns
- Real-time search filtering

### 5. Cart Screen
- List of cart items with images
- Quantity adjustment buttons
- Remove item functionality
- Total price calculation
- Checkout button

### 6. Admin Dashboard
- Add/Edit product form
- Product management grid
- Edit and delete buttons for each product
- Form validation
- Success/error messages

### 7. Contact Screen
- Contact information cards (phone, email, address)
- Contact form with validation
- Map location placeholder
- Clickable phone and email links

### 8. Profile Screen
- User avatar
- User information display
- Quick links to orders, wishlist, addresses
- Login button for guests

### 9. Settings Screen
- Notification toggles
- App preferences
- About section
- Account management options

## State Management

The app uses **Provider** for state management with three main providers:

1. **AuthProvider** - Manages login/logout state
2. **ProductProvider** - Handles product CRUD operations
3. **CartProvider** - Manages shopping cart state

## Data Persistence

- **SharedPreferences** stores:
  - User authentication state
  - Product list
  - Admin status

Data persists across app restarts.

## Key Features Explained

### Shopping Cart
- Add products from any screen
- Visual feedback with snackbar
- Badge shows total item count
- Quantity controls in cart view
- Real-time total calculation

### Admin Panel
- Only accessible to authenticated admins
- Full CRUD operations on products
- Form validation
- Confirmation dialogs for deletions
- Auto-generated product IDs

### Search Functionality
- Real-time filtering as you type
- Searches product name and description
- Auto-navigates to products page
- Clear button to reset search

### Image Carousel
- Auto-plays promotional images
- 5-second interval
- Smooth transitions
- Error handling for failed images

## Troubleshooting

### Carousel Slider Error
If you encounter a `CarouselController` conflict error:
```bash
flutter clean
flutter pub get
```

### Missing Directory Error
Ensure these directories exist:
- `assets/data/`
- `assets/images/`

### Build Errors
Try these steps:
```bash
flutter clean
flutter pub cache repair
flutter pub get
flutter run
```

## Future Enhancements

Potential features to add:
- [ ] User registration system
- [ ] Product categories and filtering
- [ ] Order history
- [ ] Payment integration
- [ ] Product reviews and ratings
- [ ] Wishlist functionality
- [ ] Push notifications
- [ ] Dark mode theme
- [ ] Multi-language support
- [ ] Product image upload
- [ ] Advanced search filters

## Testing

Run on different platforms:

```bash
# Web
flutter run -d chrome

# Android
flutter run -d android

# iOS (Mac only)
flutter run -d ios

# Windows
flutter run -d windows
```

## Contact Information

- **Email:** narithby225@gmail.com
- **Phone:** +855 968421774
- **Location:** Phnom Penh, Cambodia

## License

This project is created for educational purposes.

## Credits

- Original HTML design converted to Flutter
- Cambodia flag image from Wikimedia Commons
- Product images from various online sources
- Built with Flutter and Material Design

---

**Version:** 1.0.0  
**Last Updated:** June 2026
