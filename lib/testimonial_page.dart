import 'package:flutter/material.dart';

class TestiPage extends StatelessWidget {
  const TestiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title : const Text('Kesan dan Pesan'),
      automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              height: 20,
            ),
            Text(
              'Kesan',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Saya merasa sangat senang dan puas dengan pembelajaran yang diberikan oleh dosen saya, Bapak Bagus Muhammad Akbar karena beliau sangat baik dan mengerti dengan mahasiswanya',
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Pesan',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Saya berpesan kepada Bapak Bagus Muhammad Akbar agar terus memberikan pembelajaran yang baik dan berkualitas kepada mahasiswanya',
            ),
          ]
        ),
      )
    );
  }
}