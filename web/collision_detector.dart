part of super_racer;




class Collision {

  //Collision rectangles
  var rect1 = {'x': 84, 'y': 80, 'width': 52, 'height': 216};
  var rect2 = {'x': 68, 'y': 216, 'width': 20, 'height': 56};
  var rect3 = {'x': 136, 'y': 188, 'width': 208, 'height': 60};
  var rect4 = {'x': 344, 'y': 208, 'width': 64, 'height': 40};
  var rect5 = {'x': 368, 'y': 248, 'width': 40, 'height': 160};
  var rect6 = {'x': 368, 'y': 4, 'width': 140, 'height': 76};
  var rect7 = {'x': 4, 'y': 436, 'width': 236, 'height': 72};

  //Collision to the right, left, up or down
  bool left = false;
  bool right = false;
  bool up = false;
  bool down = false;




if (rect1.x < rect2.x + rect2.width &&
   rect1.x + rect1.width > rect2.x &&
   rect1.y < rect2.y + rect2.height &&
   rect1.height + rect1.y > rect2.y) {
    // collision detected!
}

// filling in the values =>

if (5 < 30 &&
    55 > 20 &&
    5 < 20 &&
    55 > 10) {
    // collision detected!
}
}

superRacer() {

  Map racingTrack = {
    'texture': 'media/map_1.png',
    'width': 512,
    'height': 512,
    'collision': [

    'startpositions': [{
      'x': 476,
      'y': 356
    }, {
      'x': 476 - 18,
      'y': 356 - 18
    }, {
      'x': 476,
      'y': 356 - 24
    }],
    'startrotation': 180,
    'aipoints': [
      [467, 273],
      [459, 208],
      [317, 128],
      [160, 50],
      [64, 53],
      [44, 111],
      [38, 272],
      [50, 351],
      [106, 349],
      [215, 300],
      [278, 305],
      [337, 417],
      [405, 451],
      [462, 414]
    ]};


}
