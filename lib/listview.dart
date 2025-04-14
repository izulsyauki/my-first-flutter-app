import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Item {
  final String title;
  final String imageUrl;
  final String subtitle;

  Item({required this.title, required this.imageUrl, required this.subtitle});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List Gambar Online',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  List<Item> get items => [
    Item(
      title: 'Singa',
      imageUrl: 'https://images.unsplash.com/photo-1546182990-dffeafbe841d',
      subtitle: 'Panthera leo',
    ),
    Item(
      title: 'Gajah',
      imageUrl: 'https://images.unsplash.com/photo-1557050543-4d5f4e07ef46',
      subtitle: 'Elephas maximus',
    ),
    Item(
      title: 'Jerapah',
      imageUrl: 'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
      subtitle: 'Giraffa camelopardalis',
    ),
    Item(
      title: 'Harimau',
      imageUrl: 'https://images.unsplash.com/photo-1549480017-d76466a4b7e8',
      subtitle: 'Panthera tigris',
    ),
    Item(
      title: 'Penguin',
      imageUrl: 'https://images.unsplash.com/photo-1551986782-d0169b3f8fa7',
      subtitle: 'Spheniscidae',
    ),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Daftar Hewan", style: TextStyle(fontSize: 20)),
            Text(
              "Izulsyauki Imani - A18.2023.00029",
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.network(
                      item.imageUrl,
                      width: 100,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item.subtitle,
                          style: const TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            color: Colors.grey,
                          ),
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
    );
  }
}
