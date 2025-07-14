import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  String selectedAisle = '';

  // Store layout data with 4 aisles
  final Map<String, List<String>> storeLayout = {
    '1': [
      'Shampoo',
      'Soap',
      'Toilet Paper',
      'Detergent',
      'Deodorant',
      'Tampons',
      'Bar Soap',
      'Conditioner',
      'Hair Color',
    ],
    '2': [
      'Canned Vegetables',
      'Tomatoes',
      'Peas',
      'Mushroom',
      'Ratatouille',
      'Beans',
      'Ketchup',
      'Salsa',
    ],
    '3': [
      'Shampoo',
      'Soap',
      'Toilet Paper',
      'Detergent',
      'Deodorant',
      'Tampons',
      'Bar Soap',
      'Conditioner',
      'Hair Color',
    ],
    '4': [
      'Canned Vegetables',
      'Tomatoes',
      'Peas',
      'Mushroom',
      'Ratatouille',
      'Beans',
      'Ketchup',
      'Salsa',
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text(
          'Store Map',
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
          // Store info header
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF0071CE), Color(0xFFFFC220)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.store, color: Colors.white, size: 24),
                    SizedBox(width: 8),
                    Text(
                      'Walmart Supercenter',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.white70, size: 16),
                    SizedBox(width: 4),
                    Text(
                      'Store #1234 - Main Street',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Interactive store map
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
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
              child: Column(
                children: [
                  const Text(
                    'Store Layout',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0071CE),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Entrance
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFC220).withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.door_front_door, color: Color(0xFF0071CE)),
                          SizedBox(width: 8),
                          Text(
                            'ENTRANCE',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0071CE),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Aisles grid
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 40,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.3,
                          ),
                      itemCount: storeLayout.length,
                      itemBuilder: (context, index) {
                        final aisle = storeLayout.keys.elementAt(index);
                        final isSelected = selectedAisle == aisle;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedAisle = isSelected ? '' : aisle;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: isSelected
                                  ? const LinearGradient(
                                      colors: [
                                        Color(0xFF0071CE),
                                        Color(0xFFFFC220),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    )
                                  : null,
                              color: isSelected
                                  ? null
                                  : const Color(0xFFF5F5F5),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: isSelected
                                    ? Colors.transparent
                                    : const Color(0xFF0071CE).withOpacity(0.3),
                                width: 2,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Aisle',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: isSelected
                                        ? Colors.white
                                        : const Color(0xFF666666),
                                  ),
                                ),
                                Text(
                                  aisle,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: isSelected
                                        ? Colors.white
                                        : const Color(0xFF0071CE),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Checkout area
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0071CE).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_cart_checkout,
                            color: Color(0xFF0071CE),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'CHECKOUT',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0071CE),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Aisle information panel
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
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
            child: selectedAisle.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF0071CE), Color(0xFFFFC220)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              selectedAisle,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            'Aisle Information',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0071CE),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: storeLayout[selectedAisle]!.map((category) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFC220).withOpacity(0.2),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              category,
                              style: const TextStyle(
                                color: Color(0xFF0071CE),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Icon(
                        Icons.info_outline,
                        size: 48,
                        color: const Color(0xFF0071CE).withOpacity(0.5),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Click an aisle to view more information',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF666666),
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Tap any aisle above to see what products are available',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF999999),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
