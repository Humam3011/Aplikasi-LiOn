import 'package:flutter/material.dart';

class Irigasi2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Irigasi 2 Details'),
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
            Text('Irigasi 2',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Status: Mengalirkan Air',
                style: TextStyle(fontSize: 18, color: Colors.green)),
            SizedBox(height: 20),
            Text('Kelembaban Tanah', style: TextStyle(fontSize: 18)),
            ListTile(
              leading: Icon(Icons.water_drop, color: Colors.green),
              title: Text('50 RH', style: TextStyle(fontSize: 18)),
            ),
            Text('Ketinggian Air', style: TextStyle(fontSize: 18)),
            ListTile(
              leading: Icon(Icons.trending_up, color: Colors.green),
              title: Text('2 Meter', style: TextStyle(fontSize: 18)),
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
                        content: Text("Air berhasil dimatikan!"),
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
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red), // Warna latar belakang biru
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Warna teks putih
                ),
                child: Text("Matikan Air"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
