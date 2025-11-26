import 'package:flutter/material.dart';
import 'package:workshop_4sim2_2526/entities/game.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final List<Game> _cartItems = [];
  int _totalPrice = 0;
  final String _description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ";

  @override
  void initState() {
    // Articles dans le panier (Devil May Cry 5, RE VIII, NFS Heat)
    _cartItems.add(Game("Devil May Cry 5", _description, "assets/images/dmc5.jpg", 200, 2000));
    _cartItems.add(Game("NFS Heat", _description, "assets/images/nfs.jpg", 100, 6000));
    _cartItems.add(Game("RE VIII", _description, "assets/images/re8.jpg", 200, 4000));
    
    _calculateTotal();
    super.initState();
  }

  void _calculateTotal() {
    _totalPrice = 0;
    for (var game in _cartItems) {
      _totalPrice += game. price;
    }
  }

  void _removeItem(int index) {
    setState(() {
      _cartItems.removeAt(index);
      _calculateTotal();
    });

    ScaffoldMessenger.of(context). showSnackBar(
      const SnackBar(
        content: Text("Article supprimé du panier"),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Panier"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Header avec le total
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: Colors.white,
            child: Text(
              "Total : $_totalPrice TND",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
              textAlign: TextAlign.right,
            ),
          ),
          const Divider(height: 1, thickness: 1, color: Colors.grey),
          // Liste des articles
          Expanded(
            child: _cartItems.isEmpty
                ? const Center(
                    child: Text(
                      "Votre panier est vide",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: _cartItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _buildCartItem(_cartItems[index], index);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem(Game game, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300, width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          // Icône de suppression (poubelle)
          GestureDetector(
            onTap: () => _removeItem(index),
            child: const Icon(
              Icons.delete_outline,
              color: Colors. black87,
              size: 32,
            ),
          ),
          const SizedBox(width: 20),
          // Image du jeu
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(
              game.image,
              width: 80,
              height: 45,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 80,
                  height: 45,
                  color: Colors.grey.shade300,
                  child: const Icon(Icons.image, color: Colors.grey),
                );
              },
            ),
          ),
          const SizedBox(width: 20),
          // Prix
          Text(
            "${game.price} TND",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}