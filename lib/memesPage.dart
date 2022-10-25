import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:template/Data/data.dart';
import 'Data/getapi.dart';

class MemesPage extends StatelessWidget {
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Consumer<MyState>(
              builder: (context, state, child) => Provider.of<MyState>(context,
                          listen: false)
                      .loading
                  ? /*Image(image: AssetImage('assets/klockren.png'))*/ Text(
                      ' ')
                  : Flexible(
                      flex: 9,
                      child: Image(
                        image: NetworkImage(state.meme),
                        height: MediaQuery.of(context).size.height,
                      ),
                    )),
          _viewNext(context)
        ],
      ),
    );
  }

  Widget _viewNext(context) {
    return Flexible(
      flex: 1,
      child: TextButton(
        onPressed: () {
          Provider.of<MyState>(context, listen: false).fetchMeme();
        },
        child: Text(
          'VIEW NEXT', // dölj vid loading + placera längst ner på sidan i samma höjd som de andra
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
