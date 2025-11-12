import 'package:flutter/material.dart';
import 'product_details.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      {
        'image': 'assets/images/dmc5.jpg',
        'name': 'Devil May Cry 5',
        'price': 200
      },
      {
        'image': 'assets/images/fifa.jpg',
        'name': 'FIFA 22',
        'price': 100
      },
      {
        'image': 'assets/images/re8.jpg',
        'name': 'Resident Evil VIII',
        'price': 200
      },
      {
        'image': 'assets/images/rdr2.jpg',
        'name': 'RDR 2',
        'price': 150
      },
      {
        'image': 'assets/images/nfs.jpg',
        'name': 'Need For Speed Heat',
        'price': 100
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("G-STORE ESPRIT"),
        backgroundColor: Colors.blue, // design bleu
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () {
              // Navigation vers ProductDetails
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetails(
                    imagePath: product['image'] as String,
                    title: product['name'] as String,
                    price: product['price'] as int,
                  ),
                ),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Image.asset(
                  product['image'] as String,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  product['name'] as String,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("${product['price']} DT"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              ),
            ),
          );
        },
      ),
    );
  }
}
