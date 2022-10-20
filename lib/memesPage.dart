import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'getapi.dart';

class memesPage extends StatelessWidget {


  const memesPage({Key? key}) : super(key: key);

//  AddItemView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                iconTheme: const IconThemeData(color: Colors.grey),
                backgroundColor: Colors.white,
                systemOverlayStyle: const SystemUiOverlayStyle(
                    statusBarBrightness: Brightness.light),
                elevation: 0,
              ),
              body: Center(
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        Provider.of<MyState>(context, listen: false)
                            .fetchMeme();
                      },
                      child: const Text(
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
            ));
  }
}
