// ignore_for_file: deprecated_member_use

import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'pages/search_page.dart';
import 'pages/map_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CartYap',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(
              seedColor: const Color(0xFF0071CE), // Walmart blue
              brightness: Brightness.light,
            ).copyWith(
              primary: const Color(0xFF0071CE), // Walmart blue
              secondary: const Color(0xFFFFC220), // Walmart yellow
            ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const MyHomePage(title: 'CartYap'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  late final AnimationController _lottieController;
  late final AnimationController _siriController;
  int micState = 0; // 0: default, 1: animated, 2: siri lines
  bool isLottieLoaded = false;

  @override
  void initState() {
    super.initState();
    _lottieController = AnimationController(vsync: this);
    _siriController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _lottieController.dispose();
    _siriController.dispose();
    super.dispose();
  }

  void toggleListening() {
    setState(() {
      micState = (micState + 1) % 3; // Cycle through 0, 1, 2
    });

    // Stop all animations first
    _lottieController.stop();
    _siriController.stop();

    switch (micState) {
      case 0: // Default state
        // Do nothing, just show static mic icon
        break;
      case 1: // Animated mic state
        if (isLottieLoaded) {
          _lottieController.repeat();
        }
        break;
      case 2: // Siri lines state
        _siriController.repeat();
        break;
    }
  }

  Widget _buildCurrentPage() {
    switch (_selectedIndex) {
      case 0:
        return _buildHomePage();
      case 1:
        return const SearchPage();
      case 2:
        return const MapPage();
      default:
        return _buildHomePage();
    }
  }

  Widget _buildHomePage() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF0071CE),
                    Color(0xFF004C91),
                    Color(0xFFFFC220),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 0.7, 1.0],
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome to Walmart',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Navigate your store with ease',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.location_on, color: Colors.white, size: 16),
                        SizedBox(width: 4),
                        Text(
                          'Store #1234 - Main Street',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Quick actions section
            const Text(
              'Quick Actions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333),
              ),
            ),
            const SizedBox(height: 16),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 1,
                children: [
                  _buildActionCard(
                    icon: Icons.shopping_basket,
                    title: 'Find Products',
                    subtitle: 'Search & locate items',
                    color: const Color(0xFF0071CE),
                    onTap: () {
                      setState(() {
                        _selectedIndex = 1;
                      });
                    },
                  ),
                  _buildActionCard(
                    icon: Icons.map,
                    title: 'Store Map',
                    subtitle: 'Navigate aisles',
                    color: const Color(0xFFFFC220),
                    onTap: () {
                      setState(() {
                        _selectedIndex = 2;
                      });
                    },
                  ),
                  _buildActionCard(
                    icon: Icons.local_offer,
                    title: 'Deals & Offers',
                    subtitle: 'Today\'s specials',
                    color: const Color(0xFF0071CE),
                    onTap: () {},
                  ),
                  _buildActionCard(
                    icon: Icons.receipt_long,
                    title: 'Shopping List',
                    subtitle: 'Manage your list',
                    color: const Color(0xFFFFC220),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: _selectedIndex == 0
          ? AppBar(
              title: Row(
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
                    child: const Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    widget.title,
                    style: const TextStyle(
                      color: Color(0xFF0071CE),
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              backgroundColor: Colors.white,
              elevation: 2,
              shadowColor: Colors.black12,
            )
          : null,
      body: _buildCurrentPage(),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF0071CE), Color(0xFFFFC220)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF0071CE).withOpacity(0.3),
              blurRadius: 15,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: FloatingActionButton(
          heroTag: 'voiceChatButton',
          backgroundColor: Colors.transparent,
          elevation: 0,
          onPressed: toggleListening,
          child: _buildMicWidget(),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SalomonBottomBar(
          itemPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          currentIndex: _selectedIndex,
          selectedItemColor: const Color(0xFF0071CE),
          unselectedItemColor: const Color(0xFF757575),
          backgroundColor: Colors.transparent,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: _navBarItems,
        ),
      ),
    );
  }

  Widget _buildActionCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: color == const Color(0xFFFFC220)
                      ? const Color(0xFF0071CE)
                      : color,
                  size: 32,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 12, color: Color(0xFF666666)),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMicWidget() {
    switch (micState) {
      case 0: // Default mic icon
        return const Icon(Icons.mic, color: Colors.white, size: 28);
      case 1: // Animated Lottie
        return Lottie.asset(
          'assets/voice-chat.json',
          controller: _lottieController,
          onLoaded: (composition) {
            _lottieController.duration = composition.duration;
            isLottieLoaded = true;
            if (micState == 1) {
              _lottieController.repeat();
            }
          },
        );
      case 2: // Siri-like lines
        return _buildSiriLines();
      default:
        return const Icon(Icons.mic, color: Colors.white, size: 28);
    }
  }

  Widget _buildSiriLines() {
    return AnimatedBuilder(
      animation: _siriController,
      builder: (context, child) {
        return CustomPaint(
          size: const Size(40, 40),
          painter: SiriLinesPainter(_siriController.value),
        );
      },
    );
  }
}

final _navBarItems = [
  SalomonBottomBarItem(
    icon: const Icon(Icons.home),
    title: const Text("Home"),
    selectedColor: const Color(0xFF0071CE),
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.search),
    title: const Text("Search"),
    selectedColor: const Color(0xFFFFC220),
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.map),
    title: const Text("Map"),
    selectedColor: const Color(0xFF0071CE),
  ),
];

class SiriLinesPainter extends CustomPainter {
  final double animationValue;

  SiriLinesPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    final centerY = size.height / 2;
    final baseHeight = size.height * 0.3;

    // Create 5 vertical lines with different animations
    final lineCount = 5;
    final lineSpacing = size.width / (lineCount + 1);

    for (int i = 0; i < lineCount; i++) {
      final x = lineSpacing * (i + 1);

      // Create wave effect with different phases for each line
      final phase = (i * 0.5) + (animationValue * 6);
      final amplitude = (1.0 + math.sin(phase)) * 0.5;
      final lineHeight = baseHeight + (amplitude * baseHeight * 0.8);

      final startY = centerY - (lineHeight / 2);
      final endY = centerY + (lineHeight / 2);

      canvas.drawLine(Offset(x, startY), Offset(x, endY), paint);
    }
  }

  @override
  bool shouldRepaint(SiriLinesPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}
