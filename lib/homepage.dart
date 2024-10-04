import 'package:flutter/material.dart';
import 'dummy_data.dart';
import 'help.dart'; // Import halaman HelpPage

class Homepage extends StatelessWidget {
  final String username;

  Homepage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        titleTextStyle: TextStyle(
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Selamat Datang, $username !',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // Ketika Card ditekan, navigasi ke HelpPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HelpPage()),
              );
            },
            child: Card(
              color: const Color.fromARGB(255, 184, 223, 241),
              margin: const EdgeInsets.all(8.0), // Margin untuk Card
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // Sudut membulat
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(10), // Memperbaiki letak Padding
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Butuh Bantuan? Klik untuk pergi ke halaman Panduan dan Dukungan',
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            // Expanded digunakan agar GridView mengambil sisa ruang yang ada
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: supermarketItemList.length,
              itemBuilder: (context, index) {
                final SupermarketItem supermarket = supermarketItemList[index];
                return Card(
                  margin: const EdgeInsets.all(8.0), // Margin untuk Card
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Sudut membulat
                  ),
                  elevation: 4, // Menambahkan efek bayangan
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        supermarket.imageUrls[0],
                        height: 100, // Tinggi gambar
                        width: 100, // Lebar gambar
                      ),
                      Padding(
                        padding: const EdgeInsets.all(
                            8.0), // Padding di sekitar teks
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              supermarket.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(height: 4), // Jarak antara teks
                            Text(
                              supermarket.price,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
