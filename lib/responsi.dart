import 'package:flutter/material.dart';

void main() {
  runApp(const SimplePharmacyApp());
}

class SimplePharmacyApp extends StatelessWidget {
  const SimplePharmacyApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Simple Pharmacy App",
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Aplikasi Apotek Sederhana",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Universitas Dian Nuswantoro",
                style: TextStyle(fontSize: 20, color: Colors.teal),
              ),
              const SizedBox(height: 20),
              const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  "https://media.licdn.com/dms/image/v2/D5603AQE_ExulPZJ2Dg/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1696391836214?e=1750291200&v=beta&t=iiX8L4RfZIO0Fb7JTMGp1jasNSebua_NUNjv7gUw3Po",
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Nama: Izulsyauki Imani",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              const Text(
                "NIM: A18.2023.00029",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  "Masuk Dashboard",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard Apotek"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: [
                  MenuCard(
                    icon: Icons.local_pharmacy,
                    title: "Stok Obat",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MedicineStockPage(),
                        ),
                      );
                    },
                  ),
                  MenuCard(
                    icon: Icons.shopping_cart,
                    title: "Transaksi",
                    onTap: () {},
                  ),
                  MenuCard(
                    icon: Icons.analytics,
                    title: "Statistik",
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MedicineStockPage extends StatelessWidget {
  const MedicineStockPage({super.key});

  Widget build(BuildContext context) {
    final medicines = [
      {
        'name': 'Aspirin',
        'stock': '50 tablet',
        'imageUrl':
            'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      },
      {
        'name': 'Cetirizine',
        'stock': '30 tablet',
        'imageUrl':
            'https://images.unsplash.com/photo-1587854692152-cbe660dbde88?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      },
      {
        'name': 'Paracetamol',
        'stock': '100 tablet',
        'imageUrl':
            'https://images.unsplash.com/photo-1584362917165-526a968579e8?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      },
      {
        'name': 'Amoxicillin',
        'stock': '45 kapsul',
        'imageUrl':
            'https://images.unsplash.com/photo-1550572017-edd951b55104?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      },
      {
        'name': 'Vitamin C',
        'stock': '80 tablet',
        'imageUrl':
            'https://images.unsplash.com/photo-1471864190281-a93a3070b6de?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Stok Obat"),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: medicines.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  medicines[index]['imageUrl']!,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  errorBuilder:
                      (context, error, stackTrace) => Container(
                        width: 50,
                        height: 50,
                        color: Colors.grey[200],
                        child: const Icon(Icons.medication, size: 30),
                      ),
                ),
              ),
              title: Text(
                medicines[index]['name']!,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text("Stok: ${medicines[index]['stock']!}"),
            ),
          );
        },
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const MenuCard({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 36, color: Colors.teal),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.teal,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
