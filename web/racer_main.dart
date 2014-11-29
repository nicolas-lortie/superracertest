library super_racer;

import 'dart:html';
import 'dart:async';
import 'dart:math';

part 'board.dart';
part 'race_car.dart';
part 'background.dart';



void main() {
  //get a reference to the canvas
  CanvasElement canvas = document.querySelector('#canvas');
  Board board = new Board(canvas);
}