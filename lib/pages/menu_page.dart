import 'package:flutter/material.dart';
import 'payment_detail_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  Map<String, int> selectedMenu = {};
  Map<String, int> menu = {
    'Nasi Goreng': 15000,
    'Mie Ayam': 12000,
    'Bakso': 10000,
    'Ayam Bakar': 18000,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Makanan'),
      ),
      body: ListView(
        children: menu.entries.map((entry) {
          return ListTile(
            title: Text('${entry.key} - Rp ${entry.value}'),
            subtitle: Text('Jumlah: ${selectedMenu[entry.key] ?? 0}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (selectedMenu[entry.key] != null &&
                          selectedMenu[entry.key]! > 0) {
                        selectedMenu[entry.key] = selectedMenu[entry.key]! - 1;
                      }
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      if (selectedMenu.containsKey(entry.key)) {
                        selectedMenu[entry.key] = selectedMenu[entry.key]! + 1;
                      } else {
                        selectedMenu[entry.key] = 1;
                      }
                    });
                  },
                ),
              ],
            ),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedMenu.isNotEmpty) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PaymentDetailPage(
                  selectedMenu: selectedMenu,
                  menu: menu,
                ),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Silakan pilih menu terlebih dahulu!'),
                duration: Duration(seconds: 2),
              ),
            );
          }
        },
        backgroundColor: Colors.orange,
        child: const Icon(Icons.payment),
      ),
    );
  }
}
