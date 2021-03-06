import 'dart:html';

superRacer() {

  Map racingTrack = {
    'texture': 'media/map_1.png',
    'width': 512,  
    'height': 512,
    'collision': [
      [84, 80, 52, 216], 
      [68, 276, 20, 56], 
      [136, 188, 208, 60], 
      [344, 208, 64, 40],
      [368, 248, 40, 160],
      [368, 4, 140, 76],
      [4, 436, 236, 72]],
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
