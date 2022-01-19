import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  

  // void shareTheImage(BuildContext ctx) {
  //   showModalBottomSheet(
  //     context: ctx,
  //     builder: builder,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Image.network('https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async{
            final urlImage = 'https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg';
            final url = Uri.parse(urlImage);
            final response = await http.get(url); 
            final bytes = response.bodyBytes;

            final temp = await getTemporaryDirectory();
            final path = '${temp.path}/image.jpg';
            File(path).writeAsBytesSync(bytes);

            await Share.shareFiles([path]);
          },
          child: Icon(Icons.share),
        ),
      ),
    );
  }
}
