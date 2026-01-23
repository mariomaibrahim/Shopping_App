import 'package:flutter/material.dart';
import 'cart_screen.dart';
import 'home_screen.dart';

class ItemsDetails extends StatelessWidget {
  final Product product;

  const ItemsDetails({super.key, required, required this.product});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

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

      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        decoration: BoxDecoration(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Row(
            children: [
              Text(
                "\$${product.price}",
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Row(
                        children: [

                          Icon(
                            Icons.check_circle_outline,
                            color: Colors.green,
                          ),
                          SizedBox(width: 20,),
                          Expanded(
                            child: Text(
                              "The product ${product.name} add sucssefully",
                            ),
                          ),
                        ],
                      ),
                      backgroundColor: Colors.black87,
                      duration: Duration(seconds: 4),
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[700],
                  foregroundColor: Colors.white,
                  minimumSize: const Size(180, 55),
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.shopping_cart_outlined),
                    SizedBox(width: 10),
                    Text(
                      "Add to Cart",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.only(bottom: 20),
        children: [
          SizedBox(
            height: height * 0.4,
            child: Image.asset(product.image, fit: BoxFit.contain),
          ),
          const SizedBox(height: 10),
          Text(
            product.name,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(
            product.subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Color : ",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              _colorDot(Colors.black),
              const Text(" Black"),
              const SizedBox(width: 10),
              _colorDot(Colors.grey),
              const Text(" Grey"),
              const SizedBox(width: 10),
              _colorDot(Colors.white),
              const Text(" White"),
            ],
          ),

          const SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.08),
            child: Text(
              "Description ",
              style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.08),

            child: Text(
              product.description,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 14,
                height: 1.5,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _colorDot(Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 18,
      width: 18,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.red),
      ),
    );
  }
}
