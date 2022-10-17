import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'data.dart';
import 'getapi.dart';
import 'homeviewtwo.dart';

class klockren extends StatelessWidget {
//  AddItemView();

  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MyState(),
        builder: (context, child) => Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.grey),
                backgroundColor: Colors.white,
                systemOverlayStyle:
                    SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
                elevation: 0,
              ),
              body: Center(
                child: Column(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        Provider.of<MyState>(context, listen: false)
                            .fetchMeme();
                      },
                      icon: Icon(Icons.save, size: 24.0),
                      label: Text('SAVE'), // <-- Text
                    ),
                    Consumer<MyState>(
                        builder: (context, state, child) => Image(
                              image: NetworkImage(state.meme),
                            )),
                  ],
                ),
              ),
            ));
  }
}
