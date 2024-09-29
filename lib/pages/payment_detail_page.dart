import 'package:flutter/material.dart';
import 'home_page.dart';

class PaymentDetailPage extends StatelessWidget {
  final Map<String, int> selectedMenu;
  final Map<String, int> menu;

  const PaymentDetailPage({super.key, required this.selectedMenu, required this.menu});

  @override
  Widget build(BuildContext context) {
    int total = 0;
    selectedMenu.forEach((key, value) {
      total += menu[key]! * value;
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pembayaran'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Detail Pesanan:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ...selectedMenu.entries.map((entry) {
              return Text(
                '${entry.key} x${entry.value} - Rp ${menu[entry.key]! * entry.value}',
                style: const TextStyle(fontSize: 16),
              );
            }),
            const SizedBox(height: 20),
            const Divider(),
            Text('Total Pembayaran: Rp $total', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text('Kembali ke Menu'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage(username: 'User')),
                  (Route<dynamic> route) => false,
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Terima kasih telah memesan makanan di sini!')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text('Selesai'),
            ),
          ],
        ),
      ),
    );
  }
}
