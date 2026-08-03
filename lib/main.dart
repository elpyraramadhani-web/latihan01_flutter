import 'package:flutter/material.dart';

void main() {
  //Deklarasi
  String nama_barang = "Buku Tulis";
  double harga_anggota = 3500.0;
  double harga_umum = 4000.0;
  int jumlah_stok = 50;
  bool tersedia = true;
  int jumlah_beli= 3;
  double total_anggota = jumlah_beli * harga_anggota;
  double total_umum = jumlah_beli * harga_umum;
  double selisih_harga = total_umum - total_anggota;

//Output
print("=====Nama Barang=====");
print("Nama Barang : $nama_barang");
print("Harga Anggota : $harga_anggota");
print("Harga Umum : $harga_umum");
print("Jumlah Stok : $jumlah_stok");
print("Tersedia : $tersedia");
print("Total (anggota) $jumlah_beli pcs : $total_anggota");
print("Selisih vs Umum : $selisih_harga");
print("======================");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HALLO SMK BRANTAS KARANGAKTES',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: const Color.fromARGB(255, 58, 152, 183)),
      ),
      home: const MyHomePage(title: 'HALLO ALVIRA'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

//"Mengapa pemilihan tipe data pada program ini penting bagi keakuratan kasir koperasi?" 
//Karena pemilihan tipe data yang tepat memastikan bahwa nilai yang disimpan dan dihitung dalam program sesuai dengan jenis data yang diharapkan.
// Misalnya, harga barang menggunakan tipe data double untuk menangani angka desimal, 
//sedangkan jumlah stok menggunakan tipe data int karena hanya menyimpan bilangan bulat.
// Hal ini penting untuk menghindari kesalahan perhitungan, seperti pembulatan yang tidak diinginkan atau overflow, 
//sehingga kasir dapat memberikan informasi yang akurat kepada pelanggan.
