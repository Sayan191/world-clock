import 'package:flutter/material.dart';
import 'package:wc/pages/home.dart';
import 'package:wc/pages/loading.dart';
import 'package:wc/pages/choose_location.dart';

void main() => runApp(MaterialApp(initialRoute: '/', routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    }));
