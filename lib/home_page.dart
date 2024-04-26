import 'package:flutter/material.dart';
import 'package:lion_hsc/riwayat.dart';
import 'package:firebase_database/firebase_database.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int kelembabanTanah = 0; 
  int ketinggianAir = 0;

  @override
  void initState(){
    super.initState();

    //manggil firebase
    FirebaseDatabase.instance
        .ref()
        .child('kelembaban') // Menggunakan '' sebagai kunci
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

    //manggil firebase
    FirebaseDatabase.instance
        .ref()
        .child('ketinggian') // Menggunakan '' sebagai kunci
        .onValue
        .listen((event) {
      print('Nilai dari Firebase: ${event.snapshot.value}');
      // Memeriksa apakah event.snapshot.value tidak null sebelum mengaksesnya
      if (event.snapshot.value != null) {
        // Konversi nilai ke tipe data int
        setState(() {
          ketinggianAir = int.parse(event.snapshot.value.toString());
        });
      }
    });
  }
  @override
  // Tambahkan logika if-else di dalam build method
Widget build(BuildContext context) {
  String status;
  Color statusColor;
  Color buttonColor;
  String buttonText;

  // Tentukan status berdasarkan parameter kelembaban tanah dan ketinggian air
  if (kelembabanTanah <= 20 && ketinggianAir <= 100) {
    status = 'Kekurangan Air';
    statusColor = Colors.red;
    buttonColor = Colors.blue;
    buttonText = 'Alirkan Air';
  } else if (kelembabanTanah >= 21 && kelembabanTanah <= 69 && ketinggianAir >= 101 && ketinggianAir <= 299) {
    status = 'Mengalirkan Air';
    statusColor = Colors.green;
    buttonColor = Colors.red;
    buttonText = 'Matikan Air';
  } else if (kelembabanTanah == 70 && ketinggianAir == 300) {
    status = 'Air Cukup';
    statusColor = Colors.blue;
    buttonColor = Colors.red;
    buttonText = 'Matikan Air';
  } else {
    status = 'Status Tidak Diketahui';
    statusColor = Colors.black;
    buttonColor = Colors.grey;
    buttonText = 'Tidak Ada Tindakan';
  }


  Color _getKelembabanColor() {
  if (kelembabanTanah <= 20 && ketinggianAir <= 100) {
    return Colors.red;
  } else if (kelembabanTanah >= 21 && kelembabanTanah <= 69 && ketinggianAir >= 101 && ketinggianAir <= 299) {
    return Colors.green;
  } else if (kelembabanTanah == 70 && ketinggianAir == 300) {
    return Colors.blue;
  } else {
    return Colors.black;
  }
}

Color _getKetinggianColor() {
  if (kelembabanTanah <= 20 && ketinggianAir <= 100) {
    return Colors.red;
  } else if (kelembabanTanah >= 21 && kelembabanTanah <= 69 && ketinggianAir >= 101 && ketinggianAir <= 299) {
    return Colors.green;
  } else if (kelembabanTanah == 70 && ketinggianAir == 300) {
    return Colors.blue;
  } else {
    return Colors.black;
  }
}

Color _getButtonColor() {
  if (kelembabanTanah <= 20 && ketinggianAir <= 100) {
    return Colors.blue;
  } else if (kelembabanTanah >= 21 && kelembabanTanah <= 69 && ketinggianAir >= 101 && ketinggianAir <= 299) {
    return Colors.red;
  } else if (kelembabanTanah == 70 && ketinggianAir == 300) {
    return Colors.red;
  } else {
    return Colors.grey;
  }
}


String _getButtonText() {
  if (kelembabanTanah <= 20 && ketinggianAir <= 100) {
    return 'Alirkan Air';
  } else if (kelembabanTanah >= 21 && kelembabanTanah <= 69 && ketinggianAir >= 101 && ketinggianAir <= 299) {
    return 'Matikan Air';
  } else if (kelembabanTanah == 70 && ketinggianAir == 300) {
    return 'Matikan Air';
  } else {
    return 'Tidak Ada Tindakan';
  }
} 



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
        padding:  EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Irigasi 1',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
          Text(
            'Status: $status',
            style: TextStyle(fontSize: 18, color: statusColor),
          ),
          const SizedBox(height: 20),
          const Text('Kelembaban Tanah', style: TextStyle(fontSize: 18)),
          ListTile(
            leading: Icon(Icons.water_drop, color: _getKelembabanColor()),
            title: Text('$kelembabanTanah RH', style: TextStyle(fontSize: 18)),
          ),
          const Text('Ketinggian Air', style: TextStyle(fontSize: 18)),
          ListTile(
            leading: Icon(Icons.trending_up, color: _getKetinggianColor()),
            title: Text('$ketinggianAir cm', style: TextStyle(fontSize: 18)),
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
                backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                  return _getButtonColor();
                }),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
               ),
                child: Text(
                _getButtonText(),
                  style: TextStyle(color: Colors.white),
                            ),
                          ),
             )     ],
                      
        ),
      ),
    );
  }
}