library super_racer;

import 'dart:html';
import 'dart:async';
import 'dart:math';
import 'package:box2d/box2d.dart'; // Package used in controlling physics



part 'board.dart';
part 'race_car.dart';
part 'background.dart';



void main() {
  //get a reference to the canvas
  CanvasElement canvas = document.querySelector('#canvas');
  Board board = new Board(canvas);
}