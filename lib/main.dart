import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: HalamanSatu(
        FromBack: true,
      ),
    );
  }
}

class HalamanSatu extends StatefulWidget {
  HalamanSatu({Key? key, String backText = '', bool this.FromBack = false})
      : super(key: key);

  bool FromBack = false;
  String backText = '';

  @override
  State<HalamanSatu> createState() => _HalamanSatuState();
}

class _HalamanSatuState extends State<HalamanSatu> {
  int visitedCount = 0;
  String textBackInfo = 'Saya kembali dari halaman 2';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latihan Page 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Saya dipanggil sebanyak $visitedCount'),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  visitedCount++;
                  widget.backText = '';
                });
                final result = await Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => HalamanDua())));
                setState(() {
                  widget.backText = result;
                });
              },
              child: Text('Navigation to Page 2'),
            ),
            Text('${widget.backText}'),
          ],
        ),
      ),
    );
  }
}

class HalamanDua extends StatelessWidget {
  const HalamanDua({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Latihan Page 2')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: ElevatedButton(
                child: Text('Navigation to Page 3'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => HalamanTiga())));
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: ElevatedButton(
                child: Text('Back To Page 1'),
                onPressed: () {
                  Navigator.pop(context, 'Saya kembali dari page 2');
                  // Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HalamanTiga extends StatelessWidget {
  const HalamanTiga({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latihan Navigation Page 3'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => HalamanEmpat())));
          },
          child: Text('Navigation to Page 4'),
        ),
      ),
    );
  }
}

class HalamanEmpat extends StatelessWidget {
  const HalamanEmpat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kembali ke Halaman 1'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
            // Navigator.popUntil(context, (route) => route.isFirst, '')
          },
          child: Text('Back to Page 1'),
        ),
      ),
    );
  }
}
