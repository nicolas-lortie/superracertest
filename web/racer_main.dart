library super_racer;

import 'dart:html';
import 'dart:async';
import 'dart:math';

part 'board.dart';
part 'race_car.dart';
part 'background.dart';



main() {
  new Board(document.querySelector('#canvas'));
  
}