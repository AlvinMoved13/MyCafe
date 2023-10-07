import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final myacafe = <String, String>{};

  MainApp({super.key}) {
    myacafe['name'] = 'MyCafe';
    myacafe['email'] = 'order@mycafe.com';
    myacafe['loc'] =
        'Jl. Imam Bonjol No.207, Pendrikan Kidul, Kec. Semarang Tengah, Kota Semarang, Jawa Tengah 50131';
    myacafe['image'] = 'mycafe.png';
    myacafe['desc'] = 'Food & Reservation at Udinus';
    myacafe['addr'] = 'Udinus Semarang';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplikasi Mycafe",
      home: Scaffold(
        appBar: AppBar(title: const Text("Aplikasi MyCafe")),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            teksKotak(Colors.black38, myacafe['name'] ?? ''),
            Image(
                image:
                    AssetImage('assets/${myacafe["image"] ?? "mycafe.png"}')),
            SizedBox(height: 10),
            Row(
              children: [
                btnContact(Icons.alternate_email, Colors.green[900],
                    "mailto:${myacafe['email']}"),
                btnContact(Icons.location_on, Colors.blueAccent,
                    "https://www.google.com/maps/place/${myacafe['loc']}"),
                btnContact(
                    Icons.phone, Colors.deepPurple, "tel:${myacafe} ['phone']}")
              ],
            ),
            SizedBox(height: 10),
            textAttribute("Lokasi", myacafe['addr'] ?? ''),
            SizedBox(height: 10),
            teksKotak(Colors.black38, 'Deskripsi'),
            SizedBox(height: 10),
            Text(
              myacafe['desc'] ?? '',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            )
          ]),
        ),
      ),
    );
  }

  Container teksKotak(Color bgcolor, String teks) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(color: bgcolor),
      child: Text(
        teks,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
      ),
    );
  }

  Row textAttribute(String addr, String teks) {
    return Row(
      children: [
        Container(
          width: 80,
          child: Text(
            "$addr",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Text(":", style: TextStyle(fontSize: 18)),
        Text(
          teks,
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }

  Expanded btnContact(IconData icon, var color, String uri) {
    return Expanded(
      child: ElevatedButton(
          onPressed: () {
            launch(uri);
          },
          child: Icon(icon),
          style: ElevatedButton.styleFrom(
              backgroundColor: color,
              foregroundColor: Colors.white,
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ))),
    );
  }

  Future launch(String uri) async {
    if (!await launchUrl(Uri.parse(uri))) {
      throw Exception('Tidak dapat memanggil: $Uri');
    }
  }
}
