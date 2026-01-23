import 'dart:async';
import 'package:cosmatics_shopping/screens/details.dart';
import 'package:flutter/material.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;
  Timer? timer;

  final List<String> images = [
    "assets/image/image_ads.png",
    "assets/image/image22_ads.png",
    "assets/image/image3_ads.png",
  ];

  final List<Product> products = const [
    Product(
      name: "MacBook Pro 16-inch",
      subtitle: "Apple M2 Pro • 16GB RAM • 512GB SSD",
      price: 2499,
      image: "assets/image/image1.png",
      description:
      "The MacBook Pro 16-inch features the powerful Apple M2 Pro chip with 12-core CPU and 19-core GPU, delivering outstanding performance for programming, video editing, 3D rendering, and professional tasks. The stunning 16.2-inch Liquid Retina XDR display offers 3456x2234 resolution with 120Hz ProMotion technology and 1600 nits peak brightness.\n\n"
          "Equipped with 16GB unified memory and 512GB ultra-fast SSD storage with read speeds up to 7.4GB/s. The laptop features three Thunderbolt 4 ports, HDMI port, SDXC card slot, and MagSafe 3 charging for versatile connectivity.\n\n"
          "Battery life reaches up to 22 hours of video playback with fast charging support. The six-speaker sound system with Spatial Audio, studio-quality three-mic array, and 1080p FaceTime HD camera ensure premium experience. Additional features include backlit Magic Keyboard with Touch ID and Wi-Fi 6E connectivity.",
    ),
    Product(
      name: "HP Spectre x360",
      subtitle: "Intel Core i7 • 16GB RAM • 1TB SSD",
      price: 1899,
      image: "assets/image/image2.png",
      description:
      "The HP Spectre x360 is a premium 2-in-1 convertible laptop featuring Intel 13th Gen Core i7-1355U processor with 10 cores running up to 5.0 GHz. The 13.5-inch OLED touchscreen displays stunning 3000x2000 resolution with 100% DCI-P3 color gamut and includes an HP Rechargeable MPP2.0 Tilt Pen.\n\n"
          "Equipped with 16GB LPDDR4x-4266 RAM and 1TB PCIe Gen4 NVMe SSD for lightning-fast performance. The gem-cut aluminum chassis in Nightfall Black weighs only 1.34 kg with 16.5mm thin profile and features a 360-degree hinge for versatile usage modes.\n\n"
          "Security features include IR camera for Windows Hello, fingerprint reader, and privacy camera shutter. Connectivity includes two Thunderbolt 4 ports, USB-A 3.2, microSD reader, and quad Bang & Olufsen speakers. Battery provides up to 16 hours with fast charging capability.",
    ),
    Product(
      name: "HP Pavilion 15",
      subtitle: "Intel Core i5 • 8GB RAM • 512GB SSD",
      price: 1099,
      image: "assets/image/image3.png",
      description:
      "The HP Pavilion 15 offers excellent value with Intel 12th Gen Core i5-1235U processor featuring 10 cores running up to 4.4 GHz. The 15.6-inch Full HD IPS display with anti-glare coating and 82% screen-to-body ratio provides immersive viewing for students and everyday users.\n\n"
          "It features 8GB DDR4-3200 RAM (upgradable to 16GB) and 512GB PCIe NVMe SSD for smooth multitasking. Intel Iris Xe Graphics supports casual gaming and photo editing. The sleek design is available in Natural Silver or Fog Blue, weighing 1.75 kg.\n\n"
          "Connectivity includes two USB-A 3.2 ports, USB-C 3.2, HDMI 2.1, SD card reader, and 3.5mm audio jack. Dual B&O tuned speakers, 720p HD camera, and 41Wh battery with HP Fast Charge complete the package with Windows 11 Home.",
    ),
    Product(
      name: "Dell Inspiron 15",
      subtitle: "AMD Ryzen 7 • 16GB RAM • 512GB SSD",
      price: 1299,
      image: "assets/image/image4.png",
      description:
      "The Dell Inspiron 15 is powered by AMD Ryzen 7 5825U processor with 8 cores and 16 threads running up to 4.5 GHz on Zen 3 architecture. The 15.6-inch Full HD WVA display features ComfortView technology to reduce blue light with anti-glare coating and narrow bezels.\n\n"
          "Equipped with 16GB DDR4-3200 dual-channel RAM and 512GB M.2 PCIe NVMe SSD with expansion slot available. AMD Radeon Graphics with 8 compute units handles light gaming and video editing. The Carbon Black or Platinum Silver design includes lift hinge for comfortable typing, weighing 1.65 kg.\n\n"
          "Comprehensive connectivity includes USB-A ports, USB-C with power delivery, HDMI 1.4, SD card reader, and RJ-45 Ethernet. Stereo speakers with Waves MaxxAudio Pro, 720p webcam with privacy shutter, and 54Wh battery with ExpressCharge are included with Windows 11 Home.",
    ),
    Product(
      name: "iPhone 13 Pro Max",
      subtitle: "256GB • Sierra Blue",
      price: 1199,
      image: "assets/image/image5.png",
      description:
      "The iPhone 13 Pro Max features the A15 Bionic chip with 5-core GPU, 6-core CPU, and 16-core Neural Engine performing 15.8 trillion operations per second. The massive 6.7-inch Super Retina XDR display with ProMotion technology offers adaptive 10-120Hz refresh rate and 2778x1284 resolution at 458 ppi.\n\n"
          "Triple 12MP Pro camera system includes Wide (ƒ/1.5, sensor-shift OIS), Ultra Wide (ƒ/1.8, 120° field of view), and Telephoto (ƒ/2.8, 3x optical zoom). Features include Night mode, ProRes video recording up to 4K/30fps, Cinematic mode, and Macro photography with 256GB storage.\n\n"
          "All-day battery life provides up to 28 hours video playback with MagSafe wireless charging up to 15W and fast charging support. Surgical-grade stainless steel frame in Sierra Blue with IP68 water resistance. Includes Face ID security, 5G connectivity, and iOS with latest features.",
    ),
    Product(
      name: "iPhone 16",
      subtitle: "128GB • Black",
      price: 1399,
      image: "assets/image/image6.png",
      description:
      "The iPhone 16 introduces groundbreaking innovations with the powerful A18 chip built on 3nm process technology featuring 6-core CPU (30% faster) and 5-core GPU (40% faster graphics). The 6.1-inch Super Retina XDR display offers 2556x1179 pixels resolution with Dynamic Island and 2000 nits peak brightness.\n\n"
          "Advanced dual-camera system with 48MP Main (ƒ/1.6 aperture, sensor-shift OIS) and 12MP Ultra Wide (ƒ/2.4). New Camera Control button provides instant access to camera features with touch gestures. Features include 4K Dolby Vision HDR recording, Photonic Engine, Night mode, and Smart HDR 5.\n\n"
          "Battery delivers up to 22 hours video playback with MagSafe wireless charging up to 25W and fast charging support. Customizable Action button replaces Ring/Silent switch. Aerospace-grade aluminum frame in Black with latest Ceramic Shield and IP68 water resistance. Includes iOS 18 with Apple Intelligence features.",
    ),
    Product(
      name: "iPhone 12",
      subtitle: "64GB • Blue",
      price: 799,
      image: "assets/image/image7.png",
      description:
      "The iPhone 12 marked a major leap forward with 5G technology and stunning new design. Powered by the A14 Bionic chip built on 5-nanometer process featuring 6-core CPU, 4-core GPU, and 16-core Neural Engine performing 11 trillion operations per second.\n\n"
          "Beautiful 6.1-inch Super Retina XDR OLED display with 2532x1170 pixels resolution (460 ppi), HDR support, and Ceramic Shield front cover for 4x better drop performance. Dual-camera system with 12MP Wide (ƒ/1.6, OIS) and 12MP Ultra Wide (ƒ/2.4, 120° field of view) with Night mode and 4K Dolby Vision HDR recording.\n\n"
          "Battery provides up to 17 hours video playback with MagSafe wireless charging up to 15W. Flat-edge aerospace-grade aluminum design in Blue with IP68 water resistance. Includes Face ID security, 5G connectivity, Wi-Fi 6, Bluetooth 5.0, and upgradable to latest iOS version.",
    ),
    Product(
      name: "iPhone 14",
      subtitle: "128GB • White",
      price: 999,
      image: "assets/image/image8.png",
      description:
      "The iPhone 14 introduces vital safety features with the proven A15 Bionic chip featuring 6-core CPU, 5-core GPU, and 16-core Neural Engine. The gorgeous 6.1-inch Super Retina XDR OLED display offers 2532x1170 pixels resolution with HDR support, True Tone, and Ceramic Shield protection.\n\n"
          "Advanced dual-camera system with 12MP Main (ƒ/1.5 aperture, sensor-shift OIS) and 12MP Ultra Wide (ƒ/2.4). Revolutionary Photonic Engine for incredible low-light performance, Action mode for smooth stabilized video, and Cinematic mode in 4K. Front camera features autofocus for improved selfies.\n\n"
          "All-day battery life up to 20 hours video playback with MagSafe and fast charging support. Crash Detection automatically calls emergency services in severe accidents. Emergency SOS via satellite for help when cellular isn't available. Aerospace-grade aluminum frame in White with IP68 water resistance and iOS 16 features.",
    ),
    Product(
      name: "iPhone 14 Pro",
      subtitle: "256GB • Gold",
      price: 1299,
      image: "assets/image/image9.png",
      description:
      "The iPhone 14 Pro sets a new standard with the A16 Bionic chip - the fastest chip in a smartphone - built on 4nm process with 6-core CPU, 5-core GPU, and 16-core Neural Engine capable of 17 trillion operations per second. Revolutionary 6.1-inch Super Retina XDR display with ProMotion (1-120Hz adaptive refresh) and Always-On display.\n\n"
          "Dynamic Island transforms notifications into interactive experiences. Pro camera system with 48MP Main (ƒ/1.78, sensor-shift OIS), 12MP Ultra Wide (ƒ/2.2, macro), and 12MP Telephoto (ƒ/2.8, 3x zoom). Features 48MP ProRAW, Photonic Engine, Night mode on all cameras, and ProRes video recording up to 4K/30fps.\n\n"
          "Professional battery life up to 23 hours video playback with MagSafe charging. Surgical-grade stainless steel frame in luxurious Gold finish with textured matte glass back and IP68 water resistance. Includes Face ID security, 5G connectivity, Crash Detection, and Emergency SOS via satellite with iOS 16 Pro features.",
    ),
  ];

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (currentIndex < images.length - 1) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }
      _pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width < 600 ? 2 : 3;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        iconSize: 28,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: "Settings",
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.grey),
              child: Center(
                child: Text(
                  "Tech Shop",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(leading: Icon(Icons.home), title: Text("Home")),
            ListTile(leading: Icon(Icons.shopping_cart), title: Text("Cart")),
            ListTile(leading: Icon(Icons.settings), title: Text("Settings")),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
          child: ListView(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: "Search",
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Builder(
                    builder: (context) => IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              
              Container(
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[300],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: images.length,
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Image.asset(images[index], fit: BoxFit.cover);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),

              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  images.length,
                      (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: currentIndex == index ? 24 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: currentIndex == index ? Colors.red : Colors.grey[400],
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
              const Text("Categories", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),

              SizedBox(
                height: 110,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    CategoryItem(icon: Icons.laptop, title: "Laptop"),
                    CategoryItem(icon: Icons.phone_android, title: "Mobile"),
                    CategoryItem(icon: Icons.headset, title: "Headphone"),
                    CategoryItem(icon: Icons.watch, title: "Watch"),
                    CategoryItem(icon: Icons.card_giftcard, title: "Gifts"),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text("Best Selling", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),

              
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.72,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => ItemsDetails(product: product)),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 100,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Color(0xFFE0E0E0),
                              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                            ),
                            child: Image.asset(product.image, fit: BoxFit.contain),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  product.subtitle,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    Text(
                                      "\$${product.price}",
                                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 15),
                                    ),
                                   SizedBox(width: 55,),
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.red[700],
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Row(
                                                children: [
                                                  const Icon(Icons.check_circle_outline, color: Colors.green),
                                                  const SizedBox(width: 20),
                                                  Expanded(child: Text("The product ${product.name} added successfully")),
                                                ],
                                              ),
                                              backgroundColor: Colors.black87,
                                              duration: const Duration(seconds: 4),
                                              behavior: SnackBarBehavior.fixed,
                                              action: SnackBarAction(
                                                textColor: Colors.green,
                                                label: "Show",
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (_) => CartScreen()),
                                                  );
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                        child: const Icon(Icons.add_shopping_cart, color: Colors.white, size: 18),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
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
      ),
    );
  }
}

class Product {
  final String name;
  final String subtitle;
  final double price;
  final String image;
  final String description;

  const Product({
    required this.name,
    required this.subtitle,
    required this.price,
    required this.image,
    required this.description,
  });
}

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const CategoryItem({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 30),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}
