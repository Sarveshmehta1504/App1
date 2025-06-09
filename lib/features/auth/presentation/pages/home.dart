import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();

  List<bool> isFavorite = List.generate(6, (index) => false);

  final categories = [
    {"name": "Necklace", "image": "assets/images.jpeg"},
    {"name": "Rings", "image": "assets/ringsjpg.jpg"},
    {"name": "Earrings", "image": "assets/Earrings.jpeg"},
    {"name": "Bracelets", "image": "assets/Bracelets.png"},
  ];

  final recommendations = [
    {
      "title": "Pearl and beads necklace",
      "brand": "Zaverat, Sanand",
      "image": "assets/necklace1.png"
    },
    {
      "title": "Floral Grace Diamond Pendant",
      "brand": "Mk Jewellery",
      "image": "assets/necklace2.png"
    },
  ];

  final shops = [
    {"name": "Golden Sparkle"},
    {"name": "Royal Shine"},
    {"name": "Elegant Gems"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.redAccent,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Jewellery'),
          BottomNavigationBarItem(icon: Icon(Icons.storefront), label: 'Store'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //top section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.home, color: Colors.red),
                        SizedBox(width: 4),
                        Text("Home",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                          decoration: BoxDecoration(
                            color: Color(0xFFFFF3CD),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.orangeAccent),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.amber.withOpacity(0.4),
                                blurRadius: 6,
                                spreadRadius: 1,
                              )
                            ],
                          ),
                          child: Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.center,
                            children: [

                              Positioned(
                                top: -25,
                                child: Icon(
                                  LucideIcons.crown,
                                  color: Colors.amber[800],
                                  size: 28,
                                ),
                              ),


                              Positioned(
                                left: -20,
                                top: 18,
                                child: Icon(Icons.auto_awesome,
                                    size: 20, color: Colors.amber),
                              ),


                              Positioned(
                                right: -20,
                                top: -15,
                                child: Icon(Icons.auto_awesome,
                                    size: 20, color: Colors.amber),
                              ),
                              // Center Text
                              Text(
                                "Membership",
                                style: TextStyle(
                                  color: Colors.orange[900],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        /*Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.yellow[100],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Icon(LucideIcons.crown, color: Colors.orange, size: 16),
                              SizedBox(width: 4),
                              Text("Membership", style: TextStyle(color: Colors.brown)),
                            ],
                          ),
                        ),*/

                        SizedBox(width: 10),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.black12,
                            child: Icon(Icons.person, color: Colors.black),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: 8),
                Text("E-108 High Apartments, Nr. HP...",
                    style: TextStyle(color: Colors.grey)),
                SizedBox(height: 12),

                Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    if (_controller.text.isEmpty)

                      Padding(
                        padding: const EdgeInsets.only(
                          left: 48,
                          right: 12,
                          top: 14,
                          bottom: 14,
                        ),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Search for ",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                              TextSpan(
                                text: "'Necklace'",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: Icon(Icons.mic),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: EdgeInsets.all(
                            14),

                      ),
                      style: TextStyle(fontSize: 16),
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ],
                ),

                SizedBox(height: 16),


                Container(
                  height: 160,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                SizedBox(height: 20),

                Text("Categories",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                SizedBox(height: 8),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(categories[index]["image"]!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(categories[index]["name"]!,
                              style: TextStyle(fontSize: 12))
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Recommendation
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Recommendation",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    Text("See all", style: TextStyle(color: Colors.red))
                  ],
                ),
                SizedBox(height: 12),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) {
                    final rec = recommendations[index % 2];
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(12)),
                                child: Image.asset(
                                  rec["image"]!,
                                  height: 120,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 8,
                                right: 8,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isFavorite[index] = !isFavorite[index];
                                    });
                                  },
                                  child: Icon(
                                    isFavorite[index]
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: isFavorite[index]
                                        ? Colors.red
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(rec["title"]!,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                SizedBox(height: 4),
                                Text(
                                  "By ${rec["brand"]}",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),

                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Shops",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    Text("See all", style: TextStyle(color: Colors.red))
                  ],
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 80,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children:
                        shops.map((shop) => shopCircle(shop["name"]!)).toList(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget shopCircle(String name) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[300],
            ),
          ),
          SizedBox(height: 4),
          SizedBox(
            width: 80,
            child: Text(
              name,
              style: TextStyle(fontSize: 10),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}