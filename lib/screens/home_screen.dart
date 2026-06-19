import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart' as carousel;
import '../providers/cart_provider.dart';
import '../providers/product_provider.dart';
import '../providers/auth_provider.dart';
import '../widgets/product_card.dart';
import '../widgets/app_drawer.dart';
import '../widgets/cart_hover_preview.dart';
import 'cart_screen.dart';
import 'products_screen.dart';
import 'admin_screen.dart';
import 'contact_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
        actions: [
          const CartHoverPreview(),
        ],
      ),
      drawer: const AppDrawer(),
      body: const HomeScreenBody(),
    );
  }
}

// Separate body widget for use in navigation
class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _carouselImages = [
    'https://www.nvidia.com/content/nvidiaGDC/us/en_US/geforce/laptops/_jcr_content/root/responsivegrid/nv_container/nv_container_454467679/nv_teaser_copy.coreimg.100.1070.jpeg/1737970047162/geforce-rtx-30-series-laptops-ari.jpeg',
    'https://media.macphun.com/img/uploads/customer/blog/1683618406/16836185656459fb05848b84.43421418.jpg?q=85&w=1680',
    'https://cdn.mos.cms.futurecdn.net/xhZ7qj7vf25Ep878LSVZpC-1200-80.jpg',
    'https://sc04.alicdn.com/kf/H27b876069ec74a4fa4eadaf2d959465bi.jpg',
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);

    final displayProducts = productProvider.products.take(6).toList();

    return RefreshIndicator(
      onRefresh: () async {
        setState(() {});
      },
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        children: [
          const SizedBox(height: 8),

          // Search Bar - ស្វែងរក
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search products...',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _searchController.clear();
                        setState(() {});
                      },
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
            onChanged: (value) {
              if (value.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductsScreen(searchQuery: value),
                  ),
                );
              }
            },
          ),
          const SizedBox(height: 16),

          // Carousel Slider - ផ្ទាំងស្លាយពាណិជ្ជកម្ម
          Container(
            height: 280,
            margin: const EdgeInsets.only(bottom: 8),
            child: carousel.CarouselSlider(
              options: carousel.CarouselOptions(
                height: 280,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                enlargeCenterPage: true,
                viewportFraction: 0.92,
                autoPlayCurve: Curves.easeInOutCubic,
                autoPlayAnimationDuration: const Duration(milliseconds: 1000),
              ),
              items: _carouselImages.map((imageUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 12,
                            spreadRadius: 2,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.network(
                              imageUrl,
                              fit: BoxFit.cover,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Container(
                                  color: Colors.grey.shade200,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      value: loadingProgress
                                                  .expectedTotalBytes !=
                                              null
                                          ? loadingProgress
                                                  .cumulativeBytesLoaded /
                                              loadingProgress
                                                  .expectedTotalBytes!
                                          : null,
                                      strokeWidth: 3,
                                      color: Colors.blue.shade600,
                                    ),
                                  ),
                                );
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Colors.blue.shade400,
                                        Colors.blue.shade700,
                                      ],
                                    ),
                                  ),
                                  child: const Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.image,
                                          size: 60,
                                          color: Colors.white70,
                                        ),
                                        SizedBox(height: 12),
                                        Text(
                                          'Cambodia Store',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 24),

          // Featured Products
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Featured Products',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductsScreen(),
                    ),
                  );
                },
                child: const Text('View All'),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Products Grid - តារាងផលិតផល
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.62,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: displayProducts.length,
            itemBuilder: (context, index) {
              return ProductCard(product: displayProducts[index]);
            },
          ),
          const SizedBox(height: 16),

          // Quick Links Section
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Quick Links',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ListTile(
                    leading: const Icon(Icons.shopping_bag, color: Colors.blue),
                    title: const Text('All Products'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProductsScreen(),
                        ),
                      );
                    },
                  ),
                  if (authProvider.isAdmin)
                    ListTile(
                      leading: const Icon(
                        Icons.admin_panel_settings,
                        color: Colors.blue,
                      ),
                      title: const Text('Admin Dashboard'),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AdminScreen(),
                          ),
                        );
                      },
                    ),
                  ListTile(
                    leading: const Icon(Icons.contact_mail, color: Colors.blue),
                    title: const Text('Contact Us'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ContactScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
