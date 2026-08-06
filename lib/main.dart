import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


void main() {
  //Deklarasi
  String nama_barang = "Mie Ayam";
  double harga_anggota = 8000.0;
  double harga_umum = 10000.0;
  int jumlah_stok = 1000;
  int jumlah_beli= 78;
  double total_anggota = jumlah_beli * harga_anggota;
  double total_umum = jumlah_beli * harga_umum;
  double selisih_harga = total_umum - total_anggota;


  bool tersedia = jumlah_stok > 0;
  bool anggota = false; //false = pembeli umum, true = pembeli anggota

  String kategori = "Makanan";
  String lokasi_rak;
  switch (kategori) {
    case "Atk":
      lokasi_rak = "Rak 1";
      break;
    case "Makanan":
      lokasi_rak = "Rak 2";
      break;
    case "Minuman":
      lokasi_rak = "Rak 3";
      break;
    default:
      lokasi_rak = "Rak Lain";
  }
//Mengapa switch case digunakan pada program ini dari pada if else?
//Karena switch case lebih efisien dan lebih mudah dibaca 
//ketika ada banyak kondisi yang harus diperiksa berdasarkan nilai dari satu variabel.
//serta menambah kategori baru di masa
//depan cukup menambah satu blok "case" baru tanpa mengubah struktur if-else yang ada
  
  //Format Rupiah dengan package intl
  final formatRupiah = NumberFormat.currency(
    locale: 'id_ID', 
    symbol: 'Rp ', 
    decimalDigits: 0);

  //Mengecek pembeli termasuk angggota/umum
  double harga_satuan;
  if (anggota) {
    harga_satuan = harga_anggota;
  } else {
    harga_satuan = harga_umum;
  }

  //menghitung total belanja sebelum potongan
  double total_belanja = jumlah_beli * harga_satuan;
  //  double total_belanja = 50000; 
  //logika diskon
  double persen_diskon ;
  if (total_belanja >= 500000) {
    persen_diskon = 0.15;
  } else if (total_belanja >= 200000) {
    persen_diskon = 0.10;
  } else if (total_belanja >= 100000) {
    persen_diskon = 0.05;
  } else {
    persen_diskon = 0.0;
  }

  //Validasi jika input bernilai negatif
  if (jumlah_beli < 0 || total_belanja < 0) {
    print("=========ERROR=========");
    print("Jumlah beli tidak valid.");
    print("Transaksi dibatalkan.");
    print("========================");
    return;
  }else if (jumlah_beli > jumlah_stok) {
    print("=========ERROR=========");
    print("Jumlah beli melebihi stok.");
    print("Transaksi dibatalkan.");
    print("========================");
    return;
  }
  //menghitung total belanja setelah potongan
  double total_setelah_diskon = total_belanja * persen_diskon; 
  double total_bayar = total_belanja - total_setelah_diskon;


//Output
print("==========STRUK PEMBELIAN===========");
print("Nama Barang : $nama_barang");
print('Kategori : $kategori');
print('Lokasi Rak : $lokasi_rak');
print("Harga Anggota : ${formatRupiah.format(harga_anggota)}");
print("Harga Umum : ${formatRupiah.format(harga_umum)}");
print("Jumlah Stok : $jumlah_stok");

  if (tersedia) {
  print("Tersedia : Ya (Stok masih ada)");
}else {
    print("Tersedia : Tidak (Stok habis)");
  }

print("Total (anggota) $jumlah_beli pcs : ${formatRupiah.format(total_anggota)}");
print("Selisih vs Umum : ${formatRupiah.format(selisih_harga)}");

print('-----------TOTAL FINAL------------');
print('status pembeli : ${anggota ? "Anggota" : "Umum"}');
print('Jumlah beli : $jumlah_beli pcs');
print('Harga satuan : ${formatRupiah.format(harga_satuan)}');
print('Total belanja : ${formatRupiah.format(total_belanja)}');
print("Potongan Borongan : ${(persen_diskon * 100).toInt()}% (${formatRupiah.format(total_setelah_diskon)})");
print("Total Bayar : ${formatRupiah.format(total_bayar)}");
print("======================================");


print ("======================================");
print ("==============Sprint 3================");

//Membuat list barang
List<String> list_barang = <String>["Buku Tulis", "Pulpen", "Penghapus", "Roti"];
List<double> list_harga = <double>[5000, 2500, 1500, 5000];

print("==========LIST BARANG===========");
for (int i = 0; i < list_barang.length; i++) {
  print("${i + 1}. ${list_barang[i]} - ${formatRupiah.format(list_harga[i])}");
}

//Membuat Logika while stok buku
int stok_buku = 3;

print("==========STOK BARANG===========");

while (stok_buku > 0) {
  stok_buku = stok_buku - 1;
  print("Terjual 1, Sisa stok: $stok_buku");
}
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

//Bahaya apa yang muncul bila kondisi berhenti pada while keliru? 
//Jika kondisi berhenti pada while keliru, misalnya tidak memeriksa stok dengan benar,
//maka program dapat terus mengurangi stok bahkan ketika stok sudah habis,

//bagaimana cara untuk memastikan koperasi tidak menjual melebihi stok?
//Untuk memastikan koperasi tidak menjual melebihi stok, program harus memeriksa jumlah stok sebelum melakukan transaksi penjualan.
//Jika jumlah beli melebihi stok, program harus menampilkan pesan kesalahan dan membatalkan transaksi.
