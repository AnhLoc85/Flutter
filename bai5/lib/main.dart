import 'package:flutter/material.dart';

void main() {
  runApp(PrimeNumberCheckerApp());
}

class PrimeNumberCheckerApp extends StatelessWidget {
  const PrimeNumberCheckerApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Kiểm tra số nguyên tố'),
        ),
        body: PrimeNumberCheckerScreen(),
      ),
    );
  }
}

class PrimeNumberCheckerScreen extends StatefulWidget {
  @override
  _PrimeNumberCheckerScreenState createState() =>
      _PrimeNumberCheckerScreenState();
}

class _PrimeNumberCheckerScreenState extends State<PrimeNumberCheckerScreen> {
  int number = 0;
  bool isPrime = false;
  bool checked = false;

  void checkPrime() {
    if (number < 2) {
      setState(() {
        isPrime = false;
        checked = true;
      });
      return;
    }

    for (int i = 2; i <= number / 2; i++) {
      if (number % i == 0) {
        setState(() {
          isPrime = false;
          checked = true;
        });
        return;
      }
    }

    setState(() {
      isPrime = true;
      checked = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Nhập số'),
            onChanged: (value) {
              setState(() {
                number = int.tryParse(value) ?? 0;
                checked = false;
              });
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              checkPrime();
            },
            child: Text('Kiểm tra'),
          ),
          SizedBox(height: 20),
          if (checked)
            Text(
              isPrime
                  ? '$number là số nguyên tố.'
                  : '$number không là số nguyên tố.',
              style: TextStyle(fontSize: 18),
            ),
        ],
      ),
    );
  }
}
