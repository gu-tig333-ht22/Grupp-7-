import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:template/data.dart';
import 'getapi.dart';

class memesPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Colors.white,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
        elevation: 0,
      ),
      body: Center(
        child: ListView(
          children: [
            TextButton(
              onPressed: () {
                Provider.of<MyState>(context, listen: false).fetchMeme();
              },
              child: Text(
                'VIEW NEXT',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Consumer<MyState>(
                builder: (context, state, child) => Provider.of<MyState>(
                            context,
                            listen: false)
                        .loading
                    ? /*Image(image: AssetImage('assets/klockren.png'))*/ Text(
                        ' ')
                    : Image(
                        image: NetworkImage(state.meme),
                      )),
          ],
        ),
      ),
    );
  }
}
