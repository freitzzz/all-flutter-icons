import 'package:app/models/models.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Material Icons',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    icons
      ..sort(
        (
          i1,
          i2,
        ) =>
            i1.identifier.compareTo(
          i2.identifier,
        ),
      );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Material Icons',
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: GridView.builder(
        itemCount: icons.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
        ),
        itemBuilder: (_, index) {
          final iconModel = icons[index];
          return GridTile(
            header: Padding(
              padding: const EdgeInsets.only(
                top: 32.0,
              ),
              child: Text(
                icons[index].identifier,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
            child: Icon(
              iconModel.data,
              size: 80,
            ),
          );
        },
      ),
    );
  }
}
