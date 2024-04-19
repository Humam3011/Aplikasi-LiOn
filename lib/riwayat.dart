import 'package:flutter/material.dart';

class RiwayatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat'),
        actions: [],
      ),
      body: ListView(
        children: <Widget>[
          Card(
            color: Colors.green[50],
            child: ListTile(
              title: Text('Irigasi 1'),
              subtitle: Text('10:00\nStatus: Air Cukup'),
            ),
          ),
          Card(
            color: Colors.blue[50],
            child: ListTile(
              title: Text('Irigasi 2'),
              subtitle: Text('09:30\nStatus: Mengalirkan Air'),
            ),
          ),
          Card(
            color: Colors.red[50],
            child: ListTile(
              title: Text('Irigasi 3'),
              subtitle: Text('09:00\nStatus: Memerlukan Air'),
            ),
          ),
        ],
      ),
    );
  }
}
