import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const HomePage(),
      );
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen size with MediaQuery
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    // More detailed screen size categories for better precision
    final isExtraSmallScreen = width < 320;
    final isSmallScreen = width >= 320 && width < 375;
    final isMediumScreen = width >= 375 && width < 600;
    final isLargeScreen = width >= 600 && width < 900;
    final isExtraLargeScreen = width >= 900;

    // Safe area insets for notches and status bars
    final safePadding = MediaQuery.of(context).padding;

    // Calculate responsive dimensions with more precision
    final bannerHeight = height *
        (isExtraSmallScreen
            ? 0.22
            : (isSmallScreen ? 0.25 : (isLargeScreen ? 0.28 : 0.3)));
    final horizontalPadding = isExtraSmallScreen
        ? 8.0
        : (isSmallScreen ? 12.0 : (isLargeScreen ? 20.0 : 24.0));
    final sectionSpacing = isExtraSmallScreen
        ? 12.0
        : (isSmallScreen ? 16.0 : (isLargeScreen ? 24.0 : 28.0));

    // Text scaling is important - adjust based on both width and accessibility settings
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    final titleFontSize = (isExtraSmallScreen
            ? 18.0
            : (isSmallScreen ? 20.0 : (isLargeScreen ? 24.0 : 28.0))) /
        textScaleFactor;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight:
            isExtraSmallScreen ? 48 : null, // Smaller app bar for tiny screens
        title: Text(
          'Luxe',
          style: TextStyle(
            color: const Color(0xFFD4AF37), // Gold color
            fontWeight: FontWeight.bold,
            fontSize: isExtraSmallScreen ? 20.0 : (isSmallScreen ? 22.0 : 24.0),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite_border,
              color: const Color(0xFFD4AF37),
              size: isExtraSmallScreen ? 20 : (isSmallScreen ? 22 : 24),
            ),
            onPressed: () {},
            padding: EdgeInsets.all(isExtraSmallScreen ? 8.0 : 12.0),
            visualDensity: isExtraSmallScreen
                ? VisualDensity.compact
                : VisualDensity.standard,
            constraints: const BoxConstraints(), // Remove constraints
          ),
          IconButton(
            icon: Icon(
              Icons.person_outline,
              color: const Color(0xFFD4AF37),
              size: isExtraSmallScreen ? 20 : (isSmallScreen ? 22 : 24),
            ),
            onPressed: () {},
            padding: EdgeInsets.all(isExtraSmallScreen ? 8.0 : 12.0),
            visualDensity: isExtraSmallScreen
                ? VisualDensity.compact
                : VisualDensity.standard,
            constraints: const BoxConstraints(), // Remove constraints
          ),
        ],
      ),
      body: MediaQuery(
        // Prevent text scaling to avoid overflow
        data: MediaQuery.of(context).copyWith(
          textScaleFactor: 1.0,
        ),
        child: SafeArea(
          // Use SafeArea to handle notches and status bars
          minimum: EdgeInsets.only(
              bottom: safePadding.bottom > 0 ? safePadding.bottom : 0),
          child: LayoutBuilder(
              // LayoutBuilder captures the exact available space
              builder: (context, constraints) {
            final maxWidth = constraints.maxWidth;
            final maxHeight = constraints.maxHeight;

            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(), // Smoother scrolling
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: horizontalPadding / 2,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Exclusive Pre-booking Collection section
                    AspectRatio(
                      // AspectRatio maintains proportion across all devices
                      aspectRatio: isExtraSmallScreen
                          ? 1.2
                          : (isSmallScreen ? 1.4 : (isLargeScreen ? 1.8 : 2.0)),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Stack(
                          fit: StackFit
                              .expand, // Ensure stack fits its container
                          children: [
                            // Display image of luxury necklace
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                'https://images.unsplash.com/photo-1599643478518-a784e5dc4c8f?ixlib=rb-4.0.3',
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  // Fallback for network image errors
                                  return Container(
                                    color: Colors.grey.shade900,
                                    child: const Center(
                                      child: Icon(Icons.image_not_supported,
                                          color: Colors.white60, size: 40),
                                    ),
                                  );
                                },
                              ),
                            ),
                            // Overlay gradient
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withOpacity(0.7),
                                  ],
                                ),
                              ),
                            ),
                            // Text content
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Padding(
                                padding: EdgeInsets.all(isExtraSmallScreen
                                    ? 12.0
                                    : (isSmallScreen ? 16.0 : 20.0)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    FittedBox(
                                      // FittedBox prevents text overflow
                                      fit: BoxFit.scaleDown,
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Exclusive Pre-booking Collection 2025',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: titleFontSize,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                        height: isExtraSmallScreen
                                            ? 4
                                            : (isSmallScreen ? 6 : 8)),
                                    Text(
                                      'Reserve your masterpiece with privileged access',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: const Color(0xFFD4AF37)
                                            .withOpacity(0.8),
                                        fontSize: isExtraSmallScreen
                                            ? 10
                                            : (isSmallScreen ? 12 : 14),
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

                    SizedBox(height: sectionSpacing),

                    // Premium Pre-booking Collection section
                    Text(
                      'Premium Pre-booking Collection',
                      style: TextStyle(
                        color: const Color(0xFFD4AF37),
                        fontWeight: FontWeight.bold,
                        fontSize: isExtraSmallScreen
                            ? 14
                            : (isSmallScreen ? 16 : (isLargeScreen ? 20 : 22)),
                      ),
                    ),

                    SizedBox(height: isExtraSmallScreen ? 12 : 16),

                    // Horizontal scrolling items - Use adaptive item counts and sizes
                    SizedBox(
                      height: isExtraSmallScreen
                          ? 110.0
                          : (isSmallScreen
                              ? 125.0
                              : (isMediumScreen ? 140.0 : 160.0)),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            isExtraLargeScreen ? 5 : (isLargeScreen ? 4 : 3),
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          // Define items data programmatically for any number of items
                          final items = [
                            {
                              'title': 'Royal Celestial Necklace',
                              'price': '₹25,000',
                              'image':
                                  'https://images.unsplash.com/photo-1611652022419-a9419f74343d?ixlib=rb-4.0.3',
                              'charge': '8%',
                              'until': 'Reserve until March 2025'
                            },
                            {
                              'title': 'Ethereal Diamond Set',
                              'price': '₹35,000',
                              'image':
                                  'https://images.unsplash.com/photo-1535632787350-4e68ef0ac584?ixlib=rb-4.0.3',
                              'charge': '7%',
                              'until': 'Reserve until April 2025'
                            },
                            {
                              'title': 'Diamond Artisan Ring',
                              'price': '₹45,000',
                              'image':
                                  'https://images.unsplash.com/photo-1605100804763-247f67b3557e?ixlib=rb-4.0.3',
                              'charge': '6%',
                              'until': 'Reserve until May 2025'
                            },
                            {
                              'title': 'Sapphire Elegance Set',
                              'price': '₹55,000',
                              'image':
                                  'https://images.unsplash.com/photo-1583937443851-b75fb2d3be2c?ixlib=rb-4.0.3',
                              'charge': '5%',
                              'until': 'Reserve until June 2025'
                            },
                            {
                              'title': 'Platinum Empress Band',
                              'price': '₹65,000',
                              'image':
                                  'https://images.unsplash.com/photo-1515562141207-7a88fb7ce338?ixlib=rb-4.0.3',
                              'charge': '4%',
                              'until': 'Reserve until July 2025'
                            },
                          ];

                          // Show a subset of items based on index
                          if (index >= items.length) return const SizedBox();

                          // Calculate item width based on available space
                          final itemsPerView = isExtraLargeScreen
                              ? 4
                              : (isLargeScreen
                                  ? 3
                                  : (width > 400 ? 2 : 1.5).floor());

                          final itemWidth =
                              (maxWidth - ((itemsPerView - 1) * 12)) /
                                  itemsPerView;

                          return Padding(
                            padding: EdgeInsets.only(
                                right: index < items.length - 1
                                    ? (isExtraSmallScreen ? 8 : 12)
                                    : 0),
                            child: _buildPreBookingItem(
                              items[index]['title']!,
                              items[index]['price']!,
                              items[index]['image']!,
                              items[index]['charge']!,
                              items[index]['until']!,
                              itemWidth,
                              isExtraSmallScreen,
                              isSmallScreen,
                            ),
                          );
                        },
                      ),
                    ),

                    SizedBox(height: sectionSpacing),

                    // Curated Atelier Collection section
                    Text(
                      'Curated Atelier Collection',
                      style: TextStyle(
                        color: const Color(0xFFD4AF37),
                        fontWeight: FontWeight.bold,
                        fontSize: isExtraSmallScreen
                            ? 14
                            : (isSmallScreen ? 16 : (isLargeScreen ? 20 : 22)),
                      ),
                    ),

                    SizedBox(height: isExtraSmallScreen ? 12 : 16),

                    // Atelier card - responsive height with AspectRatio
                    AspectRatio(
                      aspectRatio: isExtraSmallScreen
                          ? 1.5
                          : (isSmallScreen ? 1.7 : (isLargeScreen ? 2.0 : 2.2)),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade800),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?ixlib=rb-4.0.3',
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: Colors.grey.shade900,
                                      child: const Center(
                                        child: Icon(Icons.image_not_supported,
                                            color: Colors.white60, size: 40),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: isExtraSmallScreen
                                      ? 6.0
                                      : (isSmallScreen ? 8.0 : 12.0),
                                  vertical: isExtraSmallScreen
                                      ? 3.0
                                      : (isSmallScreen ? 5.0 : 7.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                'House of Elegance',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: isExtraSmallScreen
                                                      ? 10
                                                      : (isSmallScreen
                                                          ? 12
                                                          : 14),
                                                ),
                                              ),
                                              SizedBox(height: 1),
                                              Text(
                                                'Est. 1987, Mumbai',
                                                style: TextStyle(
                                                  color: Colors.grey.shade400,
                                                  fontSize: isExtraSmallScreen
                                                      ? 7
                                                      : (isSmallScreen
                                                          ? 8
                                                          : 10),
                                                ),
                                              ),
                                              SizedBox(height: 1),
                                              if (!isExtraSmallScreen)
                                                Row(
                                                  children: List.generate(
                                                    5,
                                                    (index) => Icon(
                                                      Icons.star,
                                                      color: const Color(
                                                          0xFFD4AF37),
                                                      size: isExtraSmallScreen
                                                          ? 7
                                                          : (isSmallScreen
                                                              ? 9
                                                              : 11),
                                                    ),
                                                  ),
                                                )
                                              else
                                                Row(
                                                  children: List.generate(
                                                    3,
                                                    (index) => Icon(
                                                      Icons.star,
                                                      color: const Color(
                                                          0xFFD4AF37),
                                                      size: 7,
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: isExtraSmallScreen
                                                ? 4
                                                : (isSmallScreen ? 5 : 7),
                                            vertical: isExtraSmallScreen
                                                ? 1
                                                : (isSmallScreen ? 2 : 3),
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                                color: const Color(0xFFD4AF37),
                                                width: 0.5),
                                          ),
                                          child: Text(
                                            'Premium',
                                            style: TextStyle(
                                              color: const Color(0xFFD4AF37),
                                              fontSize: isExtraSmallScreen
                                                  ? 7
                                                  : (isSmallScreen ? 8 : 9),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: OutlinedButton(
                                        onPressed: () {},
                                        style: OutlinedButton.styleFrom(
                                          foregroundColor:
                                              const Color(0xFFD4AF37),
                                          side: BorderSide(
                                              color: const Color(0xFFD4AF37),
                                              width: isExtraSmallScreen
                                                  ? 0.5
                                                  : 0.8),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: isExtraSmallScreen
                                                ? 4
                                                : (isSmallScreen ? 5 : 7),
                                            vertical: isExtraSmallScreen
                                                ? 2
                                                : (isSmallScreen ? 3 : 5),
                                          ),
                                          minimumSize: Size.zero,
                                          tapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'View Collection',
                                              style: TextStyle(
                                                fontSize: isExtraSmallScreen
                                                    ? 7
                                                    : (isSmallScreen ? 9 : 10),
                                              ),
                                            ),
                                            SizedBox(
                                                width:
                                                    isExtraSmallScreen ? 1 : 2),
                                            Icon(
                                              Icons.arrow_forward,
                                              size: isExtraSmallScreen
                                                  ? 8
                                                  : (isSmallScreen ? 10 : 12),
                                            ),
                                          ],
                                        ),
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

                    // Add bottom space for scrolling past the navigation bar
                    SizedBox(
                        height: isExtraSmallScreen
                            ? 12
                            : (isSmallScreen ? 16 : 24)),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: const Color(0xFFD4AF37),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        selectedFontSize:
            isExtraSmallScreen ? 10 : 12, // Smaller font for small screens
        unselectedFontSize: isExtraSmallScreen ? 10 : 12,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
                size: isExtraSmallScreen ? 20 : (isSmallScreen ? 22 : 24)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore,
                size: isExtraSmallScreen ? 20 : (isSmallScreen ? 22 : 24)),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined,
                size: isExtraSmallScreen ? 20 : (isSmallScreen ? 22 : 24)),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline,
                size: isExtraSmallScreen ? 20 : (isSmallScreen ? 22 : 24)),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
      ),
    );
  }

  Widget _buildPreBookingItem(
    String title,
    String price,
    String imageUrl,
    String makingCharge,
    String reserveUntil,
    double width,
    bool isExtraSmallScreen,
    bool isSmallScreen,
  ) {
    return Container(
      width: width,
      height: isExtraSmallScreen
          ? 110
          : (isSmallScreen ? 125 : 140), // Fixed height to prevent overflow
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade800),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.network(
              imageUrl,
              height: isExtraSmallScreen
                  ? 55
                  : (isSmallScreen ? 65 : 75), // Reduced height
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                // Fallback for network image errors
                return Container(
                  height: isExtraSmallScreen ? 55 : (isSmallScreen ? 65 : 75),
                  color: Colors.grey.shade900,
                  child: const Center(
                    child: Icon(Icons.image_not_supported,
                        color: Colors.white60, size: 20),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal:
                    isExtraSmallScreen ? 4.0 : (isSmallScreen ? 5.0 : 6.0),
                vertical: isExtraSmallScreen
                    ? 2.0
                    : (isSmallScreen ? 3.0 : 4.0), // Reduced vertical padding
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min, // Minimize vertical space
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: isExtraSmallScreen
                          ? 9
                          : (isSmallScreen ? 10 : 11), // Reduced font size
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 1), // Minimal spacing
                  Text(
                    'Pre-book: $price',
                    style: TextStyle(
                      color: const Color(0xFFD4AF37),
                      fontSize: isExtraSmallScreen
                          ? 8
                          : (isSmallScreen ? 9 : 10), // Reduced font size
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  // Optional: Conditionally show these based on available space
                  if (isSmallScreen || !isExtraSmallScreen) ...[
                    Text(
                      'Making Charge: $makingCharge',
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: isExtraSmallScreen
                            ? 6
                            : (isSmallScreen ? 7 : 8), // Reduced font size
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  Text(
                    reserveUntil,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: isExtraSmallScreen
                          ? 5
                          : (isSmallScreen ? 6 : 7), // Reduced font size
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
