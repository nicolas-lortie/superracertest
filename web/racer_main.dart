library super_racer;

import 'dart:html';
import 'dart:async';
import 'dart:math';
import 'package:box2d/box2d.dart'; // Package used in controlling physics
import 'package:stagexl/stagexl.dart';


part 'board.dart';
part 'race_car.dart';
part 'background.dart';
//part 'sound.dart';



void main() {
  //get a reference to the canvas
  CanvasElement canvas = document.querySelector('#canvas');
  Board board = new Board(canvas);
  
  var resourceManager = new ResourceManager();
  resourceManager.addSound("map", "media/map1.mp3");
  resourceManager.load().then((_) {
  resourceManager.getSound("map").play();
});

}

