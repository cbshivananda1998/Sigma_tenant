import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/task_data.dart';
import 'package:flutter_app/widgets/tile_list.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'eachtag.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => TagData(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<EachTag> _notes = List<EachTag>();

  Future<List<EachTag>> fetchNotes() async {
    var url = 'https://sigmatenant.ml/mobile/tags';
    var response = await http.get(url);

    var notes = List<EachTag>();

    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      // print(notesJson);
      for (var tag in notesJson['tags']) {
        print(tag['title'].toString());
        Provider.of<TagData>(context).addTask(tag['displayName'].toString(),
            tag['description'].toString(), tag['meta'].toString());
      }
    }
    return notes;
  }

  @override
  void initState() {
    fetchNotes();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe2e0e0),
        body: TasksList());
  }
}
