import 'package:flutter/material.dart';

class Irigasi1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Irigasi 1 Details'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Aksi ketika tombol pengaturan ditekan
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Irigasi 1',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Status: Memerlukan Air',
                style: TextStyle(fontSize: 18, color: Colors.red)),
            SizedBox(height: 20),
            Text('Kelembaban Tanah', style: TextStyle(fontSize: 18)),
            ListTile(
              leading: Icon(Icons.water_drop, color: Colors.red),
              title: Text('20 RH', style: TextStyle(fontSize: 18)),
            ),
            Text('Ketinggian Air', style: TextStyle(fontSize: 18)),
            ListTile(
              leading: Icon(Icons.trending_up, color: Colors.red),
              title: Text('1 Meter', style: TextStyle(fontSize: 18)),
            ),
            Divider(),
            Row(
              children: [
                Icon(Icons.check_circle_outline_outlined, color: Colors.green),
                SizedBox(width: 10),
                Expanded(
                  child: Text("Sistem Otomatis Aktif",
                      style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Menampilkan popup ketika tombol 'Alirkan Air' ditekan
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Sukses"),
                        content: Text("Air berhasil dialirkan!"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue), // Warna latar belakang biru
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Warna teks putih
                ),
                child: Text("Alirkan Air"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
