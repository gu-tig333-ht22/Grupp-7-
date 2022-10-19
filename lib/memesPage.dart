import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'getapi.dart';

class memesPage extends StatelessWidget {
  final String imageUrl;

  const memesPage({super.key, required this.imageUrl});

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
        child: Column(
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
                builder: (context, state, child) => Image(
                      image: NetworkImage(state.meme),
                    )),
          ],
        ),
      ),
    );
  }
}
