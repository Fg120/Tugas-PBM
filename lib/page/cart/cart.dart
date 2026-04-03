import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  final List<Map<String, dynamic>> cartItems = const [
    {'nama': "Tolak Angin Flu", 'harga': 'Rp 22.000', 'jumlah': 2, 'subtotal': 'Rp 44.000'},
    {'nama': "Fresh Care Matcha", 'harga': 'Rp 13.000', 'jumlah': 1, 'subtotal': 'Rp 13.000'},
    {'nama': "Minyak Kayu Putih", 'harga': 'Rp 15.000', 'jumlah': 3, 'subtotal': 'Rp 45.000'},
  ];

  final String total = 'Rp 102.000';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        // back
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems[index];
          return ListTile(
            title: Text(item['nama']),
            subtitle: Text('${item['harga']} x ${item['jumlah']} = ${item['subtotal']}'),
            subtitleTextStyle: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.primary)
          );
        },
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).colorScheme.primary,
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total: $total',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}