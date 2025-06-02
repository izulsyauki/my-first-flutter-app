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
      home: const MahasiswaList(),
    );
  }
}

class MahasiswaList extends StatefulWidget {
  const MahasiswaList({super.key});

  @override
  State<MahasiswaList> createState() => _MahasiswaListState();
}

class _MahasiswaListState extends State<MahasiswaList> {
  List<dynamic> mahasiswa = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchMahasiswa();
  }

  Future<void> fetchMahasiswa() async {
    try {
      // Gunakan IP address yang Anda berikan
      final response = await http.get(
        Uri.parse('http://169.254.83.107:8080/api/mahasiswa.php'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          mahasiswa = data['data'] ?? [];
          isLoading = false;
        });
      } else {
        setState(() => isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: Status code ${response.statusCode}')),
        );
      }
    } catch (e) {
      print('Error detail: $e');
      setState(() => isLoading = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Mahasiswa')),
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : mahasiswa.isEmpty
              ? const Center(child: Text('Tidak ada data'))
              : ListView.builder(
                itemCount: mahasiswa.length,
                itemBuilder:
                    (context, index) => ListTile(
                      title: Text(mahasiswa[index]['nama']),
                      subtitle: Text('NIM: ${mahasiswa[index]['nim']}'),
                    ),
              ),
    );
  }
}
