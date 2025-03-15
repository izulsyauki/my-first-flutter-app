import 'package:flutter/material.dart';

void main() {
  runApp(kalkulator());
}

class kalkulator extends StatefulWidget {
  @override
  State<kalkulator> createState() => _kalkulatorState();
}

class _kalkulatorState extends State<kalkulator> {
  TextEditingController angka1 = new TextEditingController();
  TextEditingController angka2 = new TextEditingController();
  TextEditingController hasil = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Kalkulator Sederhana'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text(
                      'Izulsyauki Imani',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('NIM: A18.2023.00029', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // Input fields
              TextField(
                controller: angka1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Silahkan Input Angka Pertama",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(Icons.looks_one),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: angka2,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Silahkan Input Angka Kedua",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(Icons.looks_two),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: hasil,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: "Hasil Perhitungan",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(Icons.calculate),
                  filled: true,
                  fillColor: Colors.blue.shade50,
                ),
              ),

              SizedBox(height: 20),

              // Calculator buttons
              Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                children: [
                  CalculatorButton(
                    icon: Icons.add,
                    label: 'Tambah',
                    color: Colors.blue,
                    onPressed: () => perhitungan("+"),
                  ),
                  CalculatorButton(
                    icon: Icons.remove,
                    label: 'Kurang',
                    color: Colors.red,
                    onPressed: () => perhitungan("-"),
                  ),
                  CalculatorButton(
                    icon: Icons.close,
                    label: 'Kali',
                    color: Colors.green,
                    onPressed: () => perhitungan("*"),
                  ),
                  CalculatorButton(
                    icon: Icons.percent,
                    label: 'Bagi',
                    color: Colors.orange,
                    onPressed: () => perhitungan("/"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void perhitungan(String operator) {
    setState(() {
      if (angka1.text.isEmpty || angka2.text.isEmpty) {
        hasil.text = "Masukkan angka terlebih dahulu";
        return;
      }

      try {
        double input1 = double.parse(angka1.text);
        double input2 = double.parse(angka2.text);
        double output = 0;

        if (operator == "+") {
          output = input1 + input2;
        } else if (operator == "-") {
          output = input1 - input2;
        } else if (operator == "*") {
          output = input1 * input2;
        } else if (operator == "/") {
          if (input2 == 0) {
            hasil.text = "Tidak bisa dibagi dengan 0";
            return;
          }
          output = input1 / input2;
        }

        if (output == output.toInt()) {
          hasil.text = output.toInt().toString();
        } else {
          hasil.text = output.toString();
        }
      } catch (e) {
        hasil.text = "Input tidak valid";
      }
    });
  }
}

class CalculatorButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onPressed;

  const CalculatorButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
