import 'package:flutter/material.dart';
import 'package:lion_hsc/home_page.dart';
import 'package:lion_hsc/irigasi-3.dart';
import 'package:lion_hsc/irigasi_1.dart';
import 'package:lion_hsc/irigasi_2.dart';
import 'package:lion_hsc/riwayat.dart';

class HalamanUtama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(
                  30.0), // Menambahkan padding sejauh 30 px
              child: Column(
                children: <Widget>[
                  CardIrigasi(
                    namaIrigasi: 'Irigasi 1',
                    status: 'Memerlukan Air',
                    kelembabanTanah: 'Kelembaban Tanah: 40%',
                    ketinggian: 'Ketinggian: 50 cm',
                    sistemOtomatis: 'Sistem Otomatis: Aktif',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Irigasi1Page()),
                      );
                    },
                  ),
                  SizedBox(height: 30), // Menambahkan jarak antara CardIrigasi
                  CardIrigasi(
                    namaIrigasi: 'Irigasi 2',
                    status: 'Mengalirkan Air',
                    kelembabanTanah: 'Kelembaban Tanah: 60%',
                    ketinggian: 'Ketinggian: 70 cm',
                    sistemOtomatis: 'Sistem Otomatis: Aktif',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Irigasi2Page()),
                      );
                    },
                  ),
                  SizedBox(height: 30), // Menambahkan jarak antara CardIrigasi
                  CardIrigasi(
                    namaIrigasi: 'Irigasi 3',
                    status: 'Air Cukup',
                    kelembabanTanah: 'Kelembaban Tanah: 80%',
                    ketinggian: 'Ketinggian: 90 cm',
                    sistemOtomatis: 'Sistem Otomatis: Nonaktif',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Irigasi3Page()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.history),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RiwayatPage()));
                // Aksi ketika tombol menu ditekan
              },
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
                // Aksi ketika tombol add ditekan
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                // Aksi ketika tombol settings ditekan
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CardIrigasi extends StatelessWidget {
  final String namaIrigasi;
  final String status;
  final String kelembabanTanah;
  final String ketinggian;
  final String sistemOtomatis;
  final VoidCallback onTap;

  const CardIrigasi({
    Key? key,
    required this.namaIrigasi,
    required this.status,
    required this.kelembabanTanah,
    required this.ketinggian,
    required this.sistemOtomatis,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              leading: Icon(Icons.water_drop),
              title: Text(namaIrigasi),
              subtitle: Text('Status : $status'),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              title: Text(kelembabanTanah),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              title: Text(ketinggian),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              title: Text(sistemOtomatis),
            ),
          ],
        ),
      ),
    );
  }
}
