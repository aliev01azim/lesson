import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lesson1/infrastructure/utils/consts.dart';

import 'app.dart';


void main() async{
  await Hive.initFlutter();
  final userBox = await Hive.openBox(Boxes.userBox);
  runApp( App(userBox));
}



