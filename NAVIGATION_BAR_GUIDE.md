# Bottom Navigation Bar - Implementation Guide

## ✅ What Was Added

A **bottom navigation bar** has been added to your Cambodia Store app, providing quick access to the main sections of the app.

## 🎯 Features

### Navigation Tabs

The bottom navigation bar includes these tabs:

1. **Home** 🏠
   - Featured products
   - Carousel slideshow
   - Quick links
   - Search functionality

2. **Products** 🛍️
   - All products catalog
   - Search and filter
   - Grid view

3. **Cart** 🛒
   - Shopping cart items
   - Badge shows item count
   - Quantity management
   - Checkout

4. **Admin** ⚙️ (Only for admins)
   - Product management
   - Add/edit/delete products
   - Admin dashboard

5. **Profile** 👤
   - User information
   - Order history
   - Settings access

### Dynamic Badge

The Cart tab shows a **badge** with the number of items in the cart, updating in real-time as you add or remove products.

### Admin-Specific Tab

The Admin tab only appears when logged in as an admin, providing role-based access control.

## 📁 Files Created/Modified

### New Files:
- `lib/screens/main_navigation.dart` - Main navigation wrapper with bottom bar

### Modified Files:
- `lib/screens/home_screen.dart` - Split into HomeScreen and HomeScreenBody
- `lib/screens/products_screen.dart` - Added ProductsScreenBody
- `lib/screens/splash_screen.dart` - Navigate to MainNavigation
- `lib/screens/login_screen.dart` - Navigate to MainNavigation
- `lib/widgets/app_drawer.dart` - Updated home navigation

## 🔧 How It Works

### IndexedStack
The navigation uses `IndexedStack` which:
- Keeps all screens in memory
- Preserves scroll positions
- Provides instant tab switching
- No rebuild on tab change

### State Management
- Cart badge updates automatically via Provider
- Admin tab visibility based on AuthProvider
- Each tab maintains its own state

## 🎨 Design Details

### Appearance:
- **Type**: Fixed bottom navigation (always visible)
- **Style**: Material Design
- **Selected Color**: Blue
- **Unselected Color**: Grey
- **Badge Color**: Red with white text

### Layout:
- Icons with labels
- Even spacing
- Active tab highlighted
- Smooth transitions

## 📱 User Experience

### Benefits:
✅ **Quick Access** - One tap to any main section
✅ **Visual Feedback** - Active tab clearly indicated
✅ **Cart Counter** - Always visible item count
✅ **State Preservation** - Screens don't reload
✅ **Intuitive** - Standard mobile app pattern

### Navigation Flow:
```
Splash Screen
    ↓
Login Screen (if not logged in)
    ↓
Main Navigation (with bottom bar)
    ├─ Home Tab
    ├─ Products Tab
    ├─ Cart Tab
    ├─ Admin Tab (if admin)
    └─ Profile Tab
```

## 🔄 Integration Points

### HomeScreen
- Now uses `HomeScreenBody` for content
- Global AppBar with cart button
- Works with bottom navigation

### ProductsScreen
- Added `ProductsScreenBody` for tab use
- Standalone screen still available
- Search functionality preserved

### CartScreen
- Accessible from both:
  - Bottom navigation tab
  - AppBar cart icon
- Badge updates automatically

## 💡 Usage Examples

### Navigate to Specific Tab Programmatically:

```dart
// Navigate to Home tab
Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => const MainNavigation(initialIndex: 0),
  ),
);

// Navigate to Products tab
Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => const MainNavigation(initialIndex: 1),
  ),
);

// Navigate to Cart tab
Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => const MainNavigation(initialIndex: 2),
  ),
);
```

### Check Current Tab:

```dart
class _MainNavigationState extends State<MainNavigation> {
  late int _currentIndex;
  
  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex; // 0 = Home, 1 = Products, etc.
  }
}
```

## 🎯 Tab Index Reference

| Index | Tab Name | Icon | Admin Only |
|-------|----------|------|------------|
| 0 | Home | home | No |
| 1 | Products | shopping_bag | No |
| 2 | Cart | shopping_cart | No |
| 3 | Admin | admin_panel_settings | Yes |
| 3/4 | Profile | person | No |

*Note: Profile index is 3 for regular users, 4 for admins*

## 🚀 Running the App

```bash
# Run on Chrome
flutter run -d chrome

# Run on Android
flutter run -d android

# Run on iOS
flutter run -d ios
```

## 🎨 Customization Options

### Change Colors:

Edit `main_navigation.dart`:

```dart
bottomNavigationBar: BottomNavigationBar(
  selectedItemColor: Colors.blue, // Change active color
  unselectedItemColor: Colors.grey, // Change inactive color
  backgroundColor: Colors.white, // Background color
)
```

### Change Icons:

```dart
_NavigationItem(
  icon: Icons.home, // Change to any Material icon
  label: 'Home',
  screen: const HomeScreenContent(),
)
```

### Add New Tab:

```dart
_NavigationItem(
  icon: Icons.favorite, // Wishlist icon
  label: 'Wishlist',
  screen: const WishlistScreen(),
)
```

## 🔍 Troubleshooting

### Badge Not Showing?
- Ensure CartProvider is properly set up
- Check that items are being added to cart
- Verify badge condition: `cartProvider.itemCount > 0`

### Admin Tab Not Appearing?
- Log in with admin credentials
- Check AuthProvider.isAdmin status
- Verify conditional rendering logic

### Tab Not Switching?
- Check IndexedStack implementation
- Verify _currentIndex state updates
- Ensure all screens are in the list

## 📊 Performance

### Benefits:
✅ **Fast Switching** - IndexedStack keeps screens alive
✅ **No Rebuilds** - State preserved between tabs
✅ **Smooth Animations** - Material Design transitions
✅ **Low Memory** - Only active widgets rendered

### Considerations:
- All tab screens stay in memory
- Good for 3-5 tabs (optimal)
- Cart updates are real-time

## 🎓 Best Practices

1. ✅ Keep navigation simple (3-5 tabs)
2. ✅ Use clear, recognizable icons
3. ✅ Provide visual feedback (badges, colors)
4. ✅ Maintain consistent tab order
5. ✅ Consider role-based tabs (admin)

## 📝 Summary

The bottom navigation bar provides:
- ✅ **Easy navigation** between main screens
- ✅ **Visual cart counter** with badge
- ✅ **Role-based access** (admin tab)
- ✅ **State preservation** across tabs
- ✅ **Professional mobile UX**

Your app now follows standard mobile app patterns with intuitive, thumb-friendly navigation! 📱✨

---

**Created:** June 19, 2026  
**Feature:** Bottom Navigation Bar  
**Status:** ✅ Fully Implemented
