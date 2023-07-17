// import flutter helper library
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/image_model.dart';
import 'dart:convert';
import 'widgets/image_list.dart';

//create a class that will be our custom widget
//this class must extend the 'StatelessWidget' base class
class App extends StatefulWidget {
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  //get http => null;

  //must define the build method that returns
//the widgets that *this* wodget will show

  void fetchImage() async {
    counter++;
    //final client = http.Client();
    final response = await http.get(
        Uri.parse(('https://jsonplaceholder.typicode.com/photos/$counter')));

    var imageModel = ImageModel.fromJson(json.decode(response.body));
    setState(() {
      images.add(imageModel);
    });
  }

  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: ImageList(images),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: fetchImage,
        ),
        appBar: AppBar(
          title: Text('Lets see some Images!'),
        ),
      ),
    );
  }
}
