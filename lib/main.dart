import 'package:app/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Icons',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  String _title = 'Material Icons';
  bool _androidOrCupertino = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          _title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
        ),
        actions: <Widget>[
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Image.asset(
                  'apple_logo.png',
                ),
                onPressed: () {
                  if (_androidOrCupertino) {
                    setState(() {
                      _title = 'Cupertino Icons';
                      _androidOrCupertino = false;
                    });
                  }
                },
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(
                  Icons.android,
                  color: Colors.black,
                ),
                onPressed: () {
                  if (!_androidOrCupertino) {
                    setState(() {
                      _title = 'Material Icons';
                      _androidOrCupertino = true;
                    });
                  }
                },
              ),
            ),
          ),
        ],
        elevation: 0,
      ),
      body: _androidOrCupertino ? _MaterialIcons() : _CupertinoIcons(),
    );
  }
}

class _MaterialIcons extends StatelessWidget {
  const _MaterialIcons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: materialIcons.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
      ),
      itemBuilder: (_, index) {
        final iconModel = materialIcons[index];
        return GridTile(
          header: Padding(
            padding: const EdgeInsets.only(
              top: 32.0,
            ),
            child: Text(
              iconModel.identifier,
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
    );
  }
}

class _CupertinoIcons extends StatelessWidget {
  const _CupertinoIcons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: cupertinoIcons.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
      ),
      itemBuilder: (_, index) {
        final iconModel = cupertinoIcons[index];
        return GridTile(
          header: Padding(
            padding: const EdgeInsets.only(
              top: 32.0,
            ),
            child: Text(
              iconModel.identifier,
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
    );
  }
}
