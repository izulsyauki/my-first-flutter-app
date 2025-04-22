import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplikasi Flutter UTS",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          titleMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
          bodyMedium: TextStyle(fontSize: 14, color: Colors.black54),
        ),
      ),
      home: DashboardScreen(),
      routes: {
        '/gallery': (context) => GalleryProductsScreen(),
        '/about': (context) => AboutUsScreen(),
      },
    );
  }
}

const List<Map<String, dynamic>> dashboardItems = [
  {'icon': Icons.home, 'title': 'Menu Utama', 'route': null},
  {'icon': Icons.shopping_cart, 'title': 'Transaksi Penjualan', 'route': null},
  {'icon': Icons.photo, 'title': 'Gallery Products', 'route': '/gallery'},
  {'icon': Icons.account_tree, 'title': 'Struktur Organisasi', 'route': null},
  {'icon': Icons.settings, 'title': 'Perbaikan/Setting', 'route': null},
  {'icon': Icons.person, 'title': 'Tentang Kami', 'route': '/about'},
];

const List<Map<String, String>> fruits = [
  {
    'name': 'Pepaya',
    'description': 'Kaya akan vitamin C dan antioksidan.',
    'imageUrl':
        'https://images.unsplash.com/photo-1623492229905-ebc1202e8904?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  },
  {
    'name': 'Semangka',
    'description': 'Segar dan kaya akan hidrasi alami.',
    'imageUrl':
        'https://images.unsplash.com/photo-1587049352846-4a222e784d38?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  },
  {
    'name': 'Jeruk',
    'description': 'Sumber vitamin C yang baik untuk imun.',
    'imageUrl': 'https://images.unsplash.com/photo-1611080626919-7cf5a9dbab5b',
  },
  {
    'name': 'Jambu',
    'description': 'Menyegarkan dengan rasa manis alami.',
    'imageUrl':
        'https://images.unsplash.com/photo-1693399991519-bef70bed19a2?q=80&w=688&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  },
  {
    'name': 'Pisang',
    'description': 'Kaya kalium untuk energi sepanjang hari.',
    'imageUrl':
        'https://images.unsplash.com/photo-1623810836868-057b23aef3aa?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  },
];

class DashboardScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard", style: Theme.of(context).textTheme.titleLarge),
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue[900]!, Colors.blue[700]!],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.amber[300],
                    child: CircleAvatar(
                      radius: 38,
                      backgroundImage: NetworkImage(
                        'https://media.licdn.com/dms/image/v2/D5603AQE_ExulPZJ2Dg/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1696391836214?e=1750896000&v=beta&t=O3ExQAmJ8jwRmvY1SohKOacsjbmivW1trXAMmxEeNgY',
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'A18.2023.00029',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Izulsyauki Imani",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Universitas Dian Nuswantoro - Semarang",
                        style: TextStyle(fontSize: 14, color: Colors.white70),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.2,
                ),
                itemCount: dashboardItems.length,
                itemBuilder: (context, index) {
                  final item = dashboardItems[index];
                  return DashboardCard(
                    icon: item['icon'],
                    title: item['title'],
                    onTap:
                        item['route'] != null
                            ? () => Navigator.pushNamed(context, item['route'])
                            : null,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  DashboardCard({required this.icon, required this.title, this.onTap});

  _DashboardCardState createState() => _DashboardCardState();
}

class _DashboardCardState extends State<DashboardCard> {
  double _elevation = 2.0;

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) => setState(() => _elevation = 4.0),
      onTapUp: (_) => setState(() => _elevation = 2.0),
      onTapCancel: () => setState(() => _elevation = 2.0),
      child: Card(
        elevation: _elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.icon, size: 36, color: Colors.amber[700]),
              SizedBox(height: 8),
              Text(
                widget.title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GalleryProductsScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "Gallery Products",
                style: TextStyle(color: Colors.white),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://images.unsplash.com/photo-1610832958506-aa56368176cf',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black54, Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.blue[900],
            foregroundColor: Colors.white,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final fruit = fruits[index];
              return Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          fruit['imageUrl']!,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                          errorBuilder:
                              (context, error, stackTrace) => Icon(
                                Icons.error,
                                size: 80,
                                color: Colors.grey,
                              ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              fruit['name']!,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(height: 4),
                            Text(
                              fruit['description']!,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }, childCount: fruits.length),
          ),
        ],
      ),
    );
  }
}

class AboutUsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> aboutInfo = [
    {
      'icon': Icons.school,
      'text': "Universitas Dian Nuswantoro",
      'style': TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    },
    {
      'icon': null,
      'text': "Fakultas Ilmu Komputer",
      'style': TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    },
    {
      'icon': null,
      'text': "Program Jarah Jauh (PJJ)",
      'style': TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    },
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[900]!, Colors.blue[700]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...aboutInfo.asMap().entries.map((entry) {
                  final info = entry.value;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child:
                        info['icon'] != null
                            ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  info['icon'],
                                  color: Colors.amber[300],
                                  size: 30,
                                ),
                                SizedBox(width: 8),
                                Text(info['text'], style: info['style']),
                                SizedBox(width: 8),
                                Icon(
                                  info['icon'],
                                  color: Colors.amber[300],
                                  size: 30,
                                ),
                              ],
                            )
                            : Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(vertical: 12.0),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Text(
                                info['text'],
                                style: info['style'],
                                textAlign: TextAlign.center,
                              ),
                            ),
                  );
                }).toList(),
                SizedBox(height: 24),
                CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.amber[300],
                  child: CircleAvatar(
                    radius: 76,
                    backgroundImage: NetworkImage(
                      'https://media.licdn.com/dms/image/v2/D5603AQE_ExulPZJ2Dg/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1696391836214?e=1750896000&v=beta&t=O3ExQAmJ8jwRmvY1SohKOacsjbmivW1trXAMmxEeNgY',
                    ),
                  ),
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber[700],
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 5,
                  ),
                  child: Text(
                    "Kembali ke Dashboard",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
