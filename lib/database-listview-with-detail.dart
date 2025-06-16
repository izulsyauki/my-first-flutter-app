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
        Uri.parse('http://17.1.17.32:8080/api/mahasiswa.php'),
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
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: ${response.body}')));
      }
    } catch (e) {
      if (!mounted) return;
      setState(() => isLoading = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  Future<void> tambahMahasiswa(String nama, String nim, String prodi) async {
    try {
      final response = await http.post(
        Uri.parse('http://17.1.17.32:8080/api/mahasiswa.php'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'nama': nama, 'nim': nim, 'prodi': prodi}),
      );

      if (response.statusCode == 200) {
        getMahasiswa(); // Refresh the list
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Data mahasiswa berhasil ditambahkan')),
        );
      } else {
        final data = jsonDecode(response.body);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: ${data['message']}')));
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  Future<void> hapusMahasiswa(String nim) async {
    try {
      final response = await http.delete(
        Uri.parse('http://17.1.17.32:8080/api/mahasiswa.php'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'nim': nim}),
      );

      if (response.statusCode == 200) {
        getMahasiswa(); // Refresh the list
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Data mahasiswa berhasil dihapus')),
        );
      } else {
        final data = jsonDecode(response.body);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: ${data['message']}')));
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Data Mahasiswa')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const InputMahasiswaDialog(),
          ).then((value) {
            if (value != null) {
              tambahMahasiswa(value['nama'], value['nim'], value['prodi']);
            }
          });
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(16),
            color: Colors.lightBlueAccent,
            child: ListTile(
              title: const Text(
                'Project By : Izulsyauki Imani - A18.2023.00029',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
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
                                trailing: IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder:
                                          (context) => AlertDialog(
                                            title: const Text(
                                              'Konfirmasi Hapus',
                                            ),
                                            content: const Text(
                                              'Apakah Anda yakin ingin menghapus data ini?',
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed:
                                                    () =>
                                                        Navigator.pop(context),
                                                child: const Text(
                                                  'Batal',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  hapusMahasiswa(
                                                    mahasiswa[index]['nim'],
                                                  );
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.red,
                                                ),
                                                child: const Text(
                                                  'Hapus',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                    );
                                  },
                                ),
                                onTap:
                                    () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) => DetailPage(
                                              mahasiswa: mahasiswa[index],
                                            ),
                                      ),
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

class InputMahasiswaDialog extends StatefulWidget {
  const InputMahasiswaDialog({super.key});

  @override
  State<InputMahasiswaDialog> createState() => _InputMahasiswaDialogState();
}

class _InputMahasiswaDialogState extends State<InputMahasiswaDialog> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _prodiController = TextEditingController();

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _prodiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Tambah Mahasiswa'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _namaController,
              decoration: const InputDecoration(
                labelText: 'Nama',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _nimController,
              decoration: const InputDecoration(
                labelText: 'NIM',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _prodiController,
              decoration: const InputDecoration(
                labelText: 'Program Studi',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Batal'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_namaController.text.isEmpty ||
                _nimController.text.isEmpty ||
                _prodiController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Semua field harus diisi')),
              );
              return;
            }
            Navigator.pop(context, {
              'nama': _namaController.text,
              'nim': _nimController.text,
              'prodi': _prodiController.text,
            });
          },
          child: const Text('Simpan'),
        ),
      ],
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
                    'Program Studi: ${mahasiswa['prodi'] ?? ''}',
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
