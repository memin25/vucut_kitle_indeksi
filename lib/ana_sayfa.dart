import 'package:flutter/material.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  final TextEditingController _boyController = TextEditingController();

  final TextEditingController _kiloController = TextEditingController();

  double _sonuc = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Vücut Kitle Endeksi",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              _sonuc.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 48,
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _boyController,
              decoration: InputDecoration(
                label: Text(
                  "Boyunuz",
                ),
                suffixText: "m",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _kiloController,
              decoration: InputDecoration(
                label: const Text(
                  "Kilonuz",
                ),
                suffixText: "kg",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _hesapla,
              child: const Text(
                "Hesapla",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _hesapla() {
    String boyText = _boyController.text.trim();
    String kiloText = _kiloController.text.trim();

    try {
      double boy = double.parse(boyText);
      double kilo = double.parse(kiloText);

      setState(() {
        _sonuc = kilo / (boy * boy);
      });

    } catch(e){
      print("Bir hata oluştu: ${e.toString()}");
    }
  }
}
