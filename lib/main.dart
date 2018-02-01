import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jason_2/user.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'JSON Demo',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _status = 'Idle.';
  int _lastDeserializationTotalTime;

  Future<String> _loadUserJson() async {
    _setStatus('Loading users...');

    var client = new HttpClient();
    var request = await client.getUrl(Uri.parse(
        'https://gist.github.com/roughike/497dbec6708715759f291439610b660e/raw/2281e7cf29b8b22b17ac1cbf9c73a759dc81dcf0/users.json'));
    var response = await request.close();

    return response.transform(UTF8.decoder).join();
  }

  Future<Null> _loadAndSerializeJSONInMainIsolate() async {
    String json = await _loadUserJson();
    _setStatus('Decoding users...');

    var stopWatch = new Stopwatch()
      ..start();

    final List<User> users = _deserializeUsers(json);
    stopWatch.stop();

    _setStatus('Total of ${users.length} users.');
    _setElapsedDeserializationTime(stopWatch.elapsedMilliseconds);
  }

  Future _loadAndDeserializeLargeJSONWithCompute() async {
    String json = await _loadUserJson();
    _setStatus('Decoding users...');

    var stopWatch = new Stopwatch()
      ..start();

    final List<User> users = await compute<String, List<User>>(
      _deserializeUsers,
      json,
    );

    stopWatch.stop();
    _setStatus('Total of ${users.length} users.');
    _setElapsedDeserializationTime(stopWatch.elapsedMilliseconds);
  }

  static List<User> _deserializeUsers(String userJson) {
    var userMaps = JSON.decode(userJson);
    var users = userMaps.map((userMap) {
      return new User.fromJson(userMap);
    }).toList();

    return users;
  }

  void _setStatus(String status) {
    setState(() {
      _status = status;
    });
  }

  void _setElapsedDeserializationTime(int elapsedMilliseconds) {
    setState(() {
      _lastDeserializationTotalTime = elapsedMilliseconds;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Deserializing large JSON'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Text('Status: $_status'),
            new CircularProgressIndicator(),
            new Text(
                'Use the following buttons to load huge amount of user data '
                    'and deserialize it directly in main or separate isolate.'),
            new Text(
                'Last deserialization took $_lastDeserializationTotalTime ms.'),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new RaisedButton(
                  onPressed: _loadAndSerializeJSONInMainIsolate,
                  child: new Text('Main isolate'),
                ),
                new RaisedButton(
                  onPressed: _loadAndDeserializeLargeJSONWithCompute,
                  child: new Text('Compute'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
