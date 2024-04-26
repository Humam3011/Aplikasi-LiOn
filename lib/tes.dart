import 'package:flutter/material.dart';
import 'package:lion_hsc/riwayat.dart';


class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int kelembabanTanah = 0; 

  @override
  void initState(){
    super.initState();


    //manggil firebase
    FirebaseDatabase.instance
        .ref()
        .child('baterai') // Menggunakan '' sebagai kunci
        .onValue
        .listen((event) {
      print('Nilai dari Firebase: ${event.snapshot.value}');
      // Memeriksa apakah event.snapshot.value tidak null sebelum mengaksesnya
      if (event.snapshot.value != null) {
        // Konversi nilai ke tipe data int
        setState(() {
          kelembabanTanah = int.parse(event.snapshot.value.toString());
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Irigasi 1 Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              // Menggunakan Navigator untuk beralih ke halaman RiwayatPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RiwayatPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Irigasi 1',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Status: Memerlukan Air',
              style: TextStyle(fontSize: 18, color: Colors.red),
            ),
            const SizedBox(height: 20),
            const Text('Kelembaban Tanah', style: TextStyle(fontSize: 18)),
            const ListTile(
              leading: Icon(Icons.water_drop, color: Colors.red),
              title: Text('20 RH', style: TextStyle(fontSize: 18)),
            ),
            const Text('Ketinggian Air', style: TextStyle(fontSize: 18)),
            const ListTile(
              leading: Icon(Icons.trending_up, color: Colors.red),
              title: Text('1 Meter', style: TextStyle(fontSize: 18)),
            ),
            const Divider(),
            const Row(
              children: [
                Icon(Icons.check_circle_outline_outlined, color: Colors.green),
                SizedBox(width: 10),
                Expanded(
                  child: Text("Sistem Otomatis Aktif",
                      style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Menampilkan popup ketika tombol 'Alirkan Air' ditekan
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Sukses"),
                        content: const Text("Air berhasil dialirkan!"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: const Text("Alirkan Air"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FirebaseDatabase {
}