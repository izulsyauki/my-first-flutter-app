import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Mahasiswa',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const DatabaseListView(),
    );
  }
}

class DatabaseListView extends StatefulWidget {
  const DatabaseListView({super.key});

  @override
  State<DatabaseListView> createState() => _DatabaseListViewState();
}

class _DatabaseListViewState extends State<DatabaseListView> {
  List<dynamic> mahasiswa = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getMahasiswa();
  }

  Future<void> getMahasiswa() async {
    try {
      final response = await http.get(
        Uri.parse('http://17.1.17.8:8080/api/mahasiswa.php'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (!mounted) return;
        setState(() {
          mahasiswa = data['data'] ?? [];
          isLoading = false;
        });
      } else {
        if (!mounted) return;
        setState(() => isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: Status code ${response.statusCode}')),
        );
      }
    } catch (e) {
      if (!mounted) return;
      setState(() => isLoading = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Data Mahasiswa')),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(16),
            color: Colors.lightBlueAccent,
            child: ListTile(
              title: const Text(
                'Izulsyauki Imani',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('NIM: A18.2023.00029'),
            ),
          ),
          Expanded(
            child:
                isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : mahasiswa.isEmpty
                    ? const Center(child: Text('Tidak ada data'))
                    : ListView.builder(
                      itemCount: mahasiswa.length,
                      itemBuilder:
                          (context, index) => GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => DetailPage(
                                        mahasiswa: mahasiswa[index],
                                      ),
                                ),
                              );
                            },
                            child: Card(
                              child: ListTile(
                                title: Text(mahasiswa[index]['nama']),
                                subtitle: Text(
                                  'NIM: ${mahasiswa[index]['nim']}',
                                ),
                              ),
                            ),
                          ),
                    ),
          ),
        ],
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Map<String, dynamic> mahasiswa;

  const DetailPage({super.key, required this.mahasiswa});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Mahasiswa')),
      body: Column(
        children: [
          Center(
            child: Image.network(
              'images/avatar-1.jpg',
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    mahasiswa['nama'] ?? '',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'NIM: ${mahasiswa['nim'] ?? ''}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    mahasiswa['smt'] ?? '',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
