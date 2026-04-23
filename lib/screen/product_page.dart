import 'package:flutter/material.dart';
import 'checkout_page.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int quantity = 1;
  final double price = 50.99;

  @override
  Widget build(BuildContext context) {
    double total = price * quantity;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    'https://www.pbtech.co.nz/imgprod/H/S/HSTJBL5748415.jpg?h=314109803',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.headphones, size: 100, color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Premium Wireless Headphones',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '₱${price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, color: Colors.blue[400]),
            ),
            const SizedBox(height: 16),
            const Text(
              'Experience high-quality sound with these premium wireless headphones. Features noise cancellation and 30-hour battery life.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    if (quantity > 1) setState(() => quantity--);
                  },
                  icon: const Icon(Icons.remove_circle_outline),
                ),
                Text('$quantity', style: const TextStyle(fontSize: 20)),
                IconButton(
                  onPressed: () => setState(() => quantity++),
                  icon: const Icon(Icons.add_circle_outline),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Center(
              child: Text(
                'Total: ₱${total.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 26,
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700],
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CheckoutPage(
                        productName: 'Premium Wireless Headphones',
                        price: price,
                        quantity: quantity,
                      ),
                    ),
                  );
                },
                child: const Text('Proceed to Checkout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
