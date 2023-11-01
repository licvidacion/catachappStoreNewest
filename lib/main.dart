import 'package:flutter/material.dart';
import 'screens/fishing_tackle_form.dart';

void main() {
  runApp(FishingTackleApp());
}

class FishingTackleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fishing Tackle Webshop'),
        ),
        body: FishingTackleForm(),
      ),
    );
  }
}
