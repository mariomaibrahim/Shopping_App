import 'package:flutter/material.dart';
import 'package:cosmatics_shopping/screens/home_screen.dart';
import 'details.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width < 600 ? 2 : (width < 900 ? 3 : 4);
    final childAspectRatio = width < 600 ? 0.68 : 0.75;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.laptop, color: Colors.black),
            Text(
              " Tech",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              " Shop",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: favouriteProducts.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: width < 600 ? 100 : 120,
                    color: Colors.grey[400],
                  ),
                  SizedBox(height: width < 600 ? 10 : 20),
                  Text(
                    "No favorites yet !",
                    style: TextStyle(
                      fontSize: width < 600 ? 20 : 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[500],
                    ),
                  ),
                  SizedBox(height: width < 600 ? 10 : 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Start adding products to your favorites",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: width < 600 ? 14 : 16,
                        color: Colors.grey[500],
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Padding(
              padding: EdgeInsets.all(width < 600 ? 12 : 20),
              child: GridView.builder(
                itemCount: favouriteProducts.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: width < 600 ? 12 : 16,
                  mainAxisSpacing: width < 600 ? 12 : 16,
                  childAspectRatio: childAspectRatio,
                ),
                itemBuilder: (context, index) {
                  final product = favouriteProducts[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ItemsDetails(product: product),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: width < 600 ? 140 : 160,
                                width: double.infinity,
                                padding: EdgeInsets.all(width < 600 ? 12 : 16),
                                decoration: const BoxDecoration(
                                  color: Color(0xFFE0E0E0),
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(12),
                                  ),
                                ),
                                child: Image.asset(
                                  product.image,
                                  fit: BoxFit.contain,
                                ),
                              ),

                              Positioned(
                                top: 8,
                                right: 8,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      product.isFavorite = false;
                                      favouriteProducts.remove(product);
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Row(
                                          children: [
                                            const Icon(
                                              Icons.info_outline,
                                              color: Colors.orange,
                                            ),
                                            const SizedBox(width: 12),
                                            Expanded(
                                              child: Text(
                                                "${product.name} removed from favorites",
                                              ),
                                            ),
                                          ],
                                        ),
                                        duration: const Duration(seconds: 2),
                                        backgroundColor: Colors.black87,
                                      ),
                                    );
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(
                                      width < 600 ? 6 : 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 4,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                      size: width < 600 ? 20 : 24,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(width < 600 ? 8 : 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: width < 600 ? 14 : 16,
                                        ),
                                      ),
                                      SizedBox(height: width < 600 ? 4 : 6),
                                      Text(
                                        product.subtitle,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: width < 600 ? 11 : 13,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: width < 600 ? 6 : 10),

                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "\$${product.price}",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: width < 600 ? 16 : 18,
                                        ),
                                      ),

                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => ItemsDetails(
                                                product: product,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: width < 600 ? 12 : 16,
                                            vertical: width < 600 ? 6 : 8,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.red[700],
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                          child: Text(
                                            "Details",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: width < 600 ? 12 : 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
