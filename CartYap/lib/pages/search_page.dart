import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<String> searchResults = [];
  bool isSearching = false;

  // Updated product data for 4-aisle store
  final List<Map<String, dynamic>> _products = [
    // Aisle 1 - Personal Care & Hygiene
    {
      'name': 'Shampoo',
      'category': 'Personal Care',
      'aisle': '1',
      'price': '\$8.97',
      'inStock': true,
    },
    {
      'name': 'Soap',
      'category': 'Personal Care',
      'aisle': '1',
      'price': '\$3.48',
      'inStock': true,
    },
    {
      'name': 'Toilet Paper',
      'category': 'Personal Care',
      'aisle': '1',
      'price': '\$12.98',
      'inStock': true,
    },
    {
      'name': 'Detergent',
      'category': 'Personal Care',
      'aisle': '1',
      'price': '\$15.97',
      'inStock': true,
    },
    {
      'name': 'Deodorant',
      'category': 'Personal Care',
      'aisle': '1',
      'price': '\$4.97',
      'inStock': false,
    },
    {
      'name': 'Tampons',
      'category': 'Personal Care',
      'aisle': '1',
      'price': '\$7.48',
      'inStock': true,
    },
    {
      'name': 'Bar Soap',
      'category': 'Personal Care',
      'aisle': '1',
      'price': '\$2.97',
      'inStock': true,
    },
    {
      'name': 'Conditioner',
      'category': 'Personal Care',
      'aisle': '1',
      'price': '\$9.47',
      'inStock': true,
    },
    {
      'name': 'Hair Color',
      'category': 'Personal Care',
      'aisle': '1',
      'price': '\$6.98',
      'inStock': false,
    },

    // Aisle 2 - Canned Goods & Condiments
    {
      'name': 'Canned Vegetables',
      'category': 'Canned Goods',
      'aisle': '2',
      'price': '\$1.98',
      'inStock': true,
    },
    {
      'name': 'Tomatoes',
      'category': 'Canned Goods',
      'aisle': '2',
      'price': '\$1.48',
      'inStock': true,
    },
    {
      'name': 'Peas',
      'category': 'Canned Goods',
      'aisle': '2',
      'price': '\$1.68',
      'inStock': true,
    },
    {
      'name': 'Mushroom',
      'category': 'Canned Goods',
      'aisle': '2',
      'price': '\$2.28',
      'inStock': true,
    },
    {
      'name': 'Ratatouille',
      'category': 'Canned Goods',
      'aisle': '2',
      'price': '\$3.48',
      'inStock': true,
    },
    {
      'name': 'Beans',
      'category': 'Canned Goods',
      'aisle': '2',
      'price': '\$1.78',
      'inStock': true,
    },
    {
      'name': 'Ketchup',
      'category': 'Condiments',
      'aisle': '2',
      'price': '\$2.98',
      'inStock': true,
    },
    {
      'name': 'Salsa',
      'category': 'Condiments',
      'aisle': '2',
      'price': '\$3.78',
      'inStock': true,
    },

    // Aisle 3 - Personal Care & Hygiene (duplicate of Aisle 1)
    {
      'name': 'Shampoo',
      'category': 'Personal Care',
      'aisle': '3',
      'price': '\$8.97',
      'inStock': true,
    },
    {
      'name': 'Soap',
      'category': 'Personal Care',
      'aisle': '3',
      'price': '\$3.48',
      'inStock': true,
    },
    {
      'name': 'Toilet Paper',
      'category': 'Personal Care',
      'aisle': '3',
      'price': '\$12.98',
      'inStock': true,
    },
    {
      'name': 'Detergent',
      'category': 'Personal Care',
      'aisle': '3',
      'price': '\$15.97',
      'inStock': true,
    },
    {
      'name': 'Deodorant',
      'category': 'Personal Care',
      'aisle': '3',
      'price': '\$4.97',
      'inStock': true,
    },
    {
      'name': 'Tampons',
      'category': 'Personal Care',
      'aisle': '3',
      'price': '\$7.48',
      'inStock': true,
    },
    {
      'name': 'Bar Soap',
      'category': 'Personal Care',
      'aisle': '3',
      'price': '\$2.97',
      'inStock': true,
    },
    {
      'name': 'Conditioner',
      'category': 'Personal Care',
      'aisle': '3',
      'price': '\$9.47',
      'inStock': true,
    },
    {
      'name': 'Hair Color',
      'category': 'Personal Care',
      'aisle': '3',
      'price': '\$6.98',
      'inStock': true,
    },

    // Aisle 4 - Canned Goods & Condiments (duplicate of Aisle 2)
    {
      'name': 'Canned Vegetables',
      'category': 'Canned Goods',
      'aisle': '4',
      'price': '\$1.98',
      'inStock': true,
    },
    {
      'name': 'Tomatoes',
      'category': 'Canned Goods',
      'aisle': '4',
      'price': '\$1.48',
      'inStock': true,
    },
    {
      'name': 'Peas',
      'category': 'Canned Goods',
      'aisle': '4',
      'price': '\$1.68',
      'inStock': true,
    },
    {
      'name': 'Mushroom',
      'category': 'Canned Goods',
      'aisle': '4',
      'price': '\$2.28',
      'inStock': false,
    },
    {
      'name': 'Ratatouille',
      'category': 'Canned Goods',
      'aisle': '4',
      'price': '\$3.48',
      'inStock': true,
    },
    {
      'name': 'Beans',
      'category': 'Canned Goods',
      'aisle': '4',
      'price': '\$1.78',
      'inStock': true,
    },
    {
      'name': 'Ketchup',
      'category': 'Condiments',
      'aisle': '4',
      'price': '\$2.98',
      'inStock': true,
    },
    {
      'name': 'Salsa',
      'category': 'Condiments',
      'aisle': '4',
      'price': '\$3.78',
      'inStock': true,
    },
  ];

  List<Map<String, dynamic>> _filteredProducts = [];

  @override
  void initState() {
    super.initState();
    _filteredProducts = _products;
  }

  void _performSearch(String query) {
    setState(() {
      isSearching = true;
    });

    // Simulate search delay
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        if (query.isEmpty) {
          _filteredProducts = _products;
        } else {
          _filteredProducts = _products.where((product) {
            return product['name'].toLowerCase().contains(
                  query.toLowerCase(),
                ) ||
                product['category'].toLowerCase().contains(query.toLowerCase());
          }).toList();
        }
        isSearching = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text(
          'Search Products',
          style: TextStyle(
            color: Color(0xFF0071CE),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 2,
        shadowColor: Colors.black12,
        iconTheme: const IconThemeData(color: Color(0xFF0071CE)),
      ),
      body: Column(
        children: [
          // Search bar
          Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              controller: _searchController,
              onChanged: _performSearch,
              decoration: InputDecoration(
                hintText: 'Search for products...',
                prefixIcon: const Icon(Icons.search, color: Color(0xFF0071CE)),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          _performSearch('');
                        },
                      )
                    : null,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
              ),
            ),
          ),

          // Search results
          Expanded(
            child: isSearching
                ? const Center(
                    child: CircularProgressIndicator(color: Color(0xFF0071CE)),
                  )
                : _filteredProducts.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search_off, size: 64, color: Colors.grey),
                        SizedBox(height: 16),
                        Text(
                          'No products found',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _filteredProducts.length,
                    itemBuilder: (context, index) {
                      final product = _filteredProducts[index];
                      return _buildProductCard(product);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF0071CE), Color(0xFFFFC220)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.inventory_2, color: Colors.white),
        ),
        title: Text(
          product['name'],
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              product['category'],
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 16,
                  color: product['inStock']
                      ? const Color(0xFF0071CE)
                      : Colors.red,
                ),
                const SizedBox(width: 4),
                Text(
                  'Aisle ${product['aisle']}',
                  style: TextStyle(
                    color: product['inStock']
                        ? const Color(0xFF0071CE)
                        : Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              product['price'],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xFF0071CE),
              ),
            ),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: product['inStock']
                    ? const Color(0xFFFFC220).withOpacity(0.2)
                    : Colors.red.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                product['inStock'] ? 'In Stock' : 'Out of Stock',
                style: TextStyle(
                  fontSize: 12,
                  color: product['inStock']
                      ? const Color(0xFF0071CE)
                      : Colors.red,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        onTap: () {
          // Navigate to product details or show more info
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Navigate to ${product['name']} in aisle ${product['aisle']}',
              ),
              backgroundColor: const Color(0xFF0071CE),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
