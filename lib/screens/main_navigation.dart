import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import '../providers/cart_provider.dart';
import '../providers/auth_provider.dart';
import '../widgets/app_drawer.dart';
import 'home_screen.dart';
import 'products_screen.dart';
import 'cart_screen.dart';
import 'profile_screen.dart';
import 'admin_screen.dart';

class MainNavigation extends StatefulWidget {
  final int initialIndex;

  const MainNavigation({super.key, this.initialIndex = 0});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);

    // Define navigation items based on user role
    final List<_NavigationItem> navigationItems = [
      _NavigationItem(
        icon: Icons.home,
        label: 'Home',
        screen: const HomeScreenContent(),
      ),
      _NavigationItem(
        icon: Icons.shopping_bag,
        label: 'Products',
        screen: const ProductsScreenContent(),
      ),
      _NavigationItem(
        icon: Icons.shopping_cart,
        label: 'Cart',
        screen: const CartScreen(),
        badge: cartProvider.itemCount > 0 ? cartProvider.itemCount : null,
      ),
      if (authProvider.isAdmin)
        _NavigationItem(
          icon: Icons.admin_panel_settings,
          label: 'Admin',
          screen: const AdminScreen(),
        ),
      _NavigationItem(
        icon: Icons.person,
        label: 'Profile',
        screen: const ProfileScreen(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/e/e9/Flag_map_of_Cambodia.svg',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.store, color: Colors.white);
                  },
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Text('Cambodia Store'),
          ],
        ),
      ),
      drawer: const AppDrawer(),
      body: IndexedStack(
        index: _currentIndex,
        children: navigationItems.map((item) => item.screen).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: navigationItems.map((item) {
          return BottomNavigationBarItem(
            icon: item.badge != null
                ? badges.Badge(
                    badgeContent: Text(
                      '${item.badge}',
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                    child: Icon(item.icon),
                  )
                : Icon(item.icon),
            label: item.label,
          );
        }).toList(),
      ),
    );
  }
}

class _NavigationItem {
  final IconData icon;
  final String label;
  final Widget screen;
  final int? badge;

  _NavigationItem({
    required this.icon,
    required this.label,
    required this.screen,
    this.badge,
  });
}

// Wrapper widgets to remove individual AppBars since we have a global one
class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    // Use the existing HomeScreenBody which has the carousel
    return const HomeScreenBody();
  }
}

class ProductsScreenContent extends StatelessWidget {
  const ProductsScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    // Use the existing ProductsScreenBody
    return const ProductsScreenBody();
  }
}
