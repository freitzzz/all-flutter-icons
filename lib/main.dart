import 'package:app/bloc/bloc.dart';
import 'package:app/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'models/icons_show.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Icons',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => IconsBloc()
          ..add(
            RetrieveIconsStarted(
              isToRetrieveCupertinoIcons: false,
            ),
          ),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IconsBloc, IconsState>(
      builder: (context, state) {
        if (state is RetrieveIconsSuccess) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              centerTitle: true,
              title: Text(
                state.isCupertinoIcons ? 'Cupertino Icons' : 'Material Icons',
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
                      icon: state.isCupertinoIcons
                          ? Image.asset(
                              'apple_logo.png',
                            )
                          : Icon(
                              Icons.android,
                              color: Colors.black,
                            ),
                      onPressed: () {
                        BlocProvider.of<IconsBloc>(context).add(
                          RetrieveIconsStarted(
                            isToRetrieveCupertinoIcons: !state.isCupertinoIcons,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
              elevation: 0,
            ),
            body: IconsGridView(
              icons: state.icons,
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class IconsGridView extends StatelessWidget {
  final List<IconModel> icons;

  const IconsGridView({
    Key key,
    this.icons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
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
