import 'package:flutter/material.dart';
import '../models/user.dart';
import '../models/cart_item.dart';
import '../constants/constants.dart';
import '../widgets/item_card.dart';

class DashboardScreen extends StatefulWidget {
  final User user;
  final List<CartItem> cartItems;
  final ValueChanged<Map<String, dynamic>> onAddToCart;
  final VoidCallback onViewCart;
  final VoidCallback onOpenAIChat;
  final VoidCallback onLogout;

  const DashboardScreen({
    super.key,
    required this.user,
    required this.cartItems,
    required this.onAddToCart,
    required this.onViewCart,
    required this.onOpenAIChat,
    required this.onLogout,
  });

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String _selectedCategory = AppConstants.categories[0];

  @override
  Widget build(BuildContext context) {
    final filteredItems = AppConstants.sampleItems
        .where((item) => item['category'] == _selectedCategory)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            SizedBox(width: 4),
            Text('AlterX'),
          ],
        ),
        actions: [
          // AI Chat Button
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: ElevatedButton.icon(
              onPressed: widget.onOpenAIChat,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1C1917),
                foregroundColor: const Color(0xFFDABB7E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(color: Color(0xFF44403C)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
              icon: const Icon(Icons.auto_awesome, size: 14),
              label: const Text(
                'Ask AI',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          
          // Cart Icon
          Stack(
            children: [
              IconButton(
                onPressed: widget.onViewCart,
                icon: const Icon(Icons.shopping_bag, color: Colors.white),
              ),
              if (widget.cartItems.isNotEmpty)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFF0C0A09), width: 2),
                    ),
                    child: Center(
                      child: Text(
                        widget.cartItems.length.toString(),
                        style: const TextStyle(
                          fontSize: 8,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          
          // Logout Button
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onSelected: (value) {
              if (value == 'logout') {
                widget.onLogout();
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'logout',
                  child: Row(
                    children: [
                      Icon(Icons.logout, size: 18),
                      SizedBox(width: 8),
                      Text('Logout'),
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Hero Image
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const NetworkImage(
                  'https://images.unsplash.com/photo-1552526338-085e791b5853?ixlib=rb-1.2.1&auto=format&fit=crop&w=1200&q=80',
                ),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6),
                  BlendMode.darken,
                ),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    const Color(0xFF0C0A09),
                    Colors.transparent,
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Select Services',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Choose items for pickup',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Categories
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              itemCount: AppConstants.categories.length,
              itemBuilder: (context, index) {
                final category = AppConstants.categories[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(category),
                    selected: _selectedCategory == category,
                    onSelected: (selected) {
                      setState(() {
                        _selectedCategory = category;
                      });
                    },
                    backgroundColor: const Color(0xFF1C1917),
                    selectedColor: const Color(0xFFDABB7E),
                    labelStyle: TextStyle(
                      color: _selectedCategory == category 
                          ? const Color(0xFF0C0A09) 
                          : Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: _selectedCategory == category 
                            ? Colors.transparent 
                            : const Color(0xFF44403C),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          
          // Items Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.8,
              ),
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                return ItemCard(
                  item: item,
                  onAddToCart: () => widget.onAddToCart(item),
                );
              },
            ),
          ),
        ],
      ),
      
      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF0C0A09),
        selectedItemColor: const Color(0xFFDABB7E),
        unselectedItemColor: const Color(0xFF78716C),
        currentIndex: 0,
        onTap: (index) {
          if (index == 2) widget.onViewCart();
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_awesome),
            label: 'AI',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Bag',
          ),
        ],
      ),
    );
  }
}