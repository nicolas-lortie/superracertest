part of super_racer;

class Board {
  //Player starting position
  static const num START_X = 500;
  static const num START_Y = 150;

  //Using time to redraw board 
  Timer timer;

  CanvasElement canvas;
  CanvasRenderingContext2D context;
  
  //Board size (using width and height to fit canvas size)
  num width;
  num height;

  num dx = 2;
  num dy = 4;
  
  //Elements to draw (need to add background and trees)
  RaceCar racecar;
  
  
  Board(this.canvas) {
    context = canvas.getContext("2d");
    width = canvas.width;
    height = canvas.height; 
    
    querySelector('#play').onClick.listen((e) {
      init();
    });
  }

  //Initial 'Draw'
  void init() {
    racecar = new RaceCar(this, START_X, START_Y);
    // redraw every 10 ms
    timer = new Timer.periodic(const Duration(milliseconds: 1),
        // 't' to call back timer to redraw board every duration
        (t) => redraw());
  }

  // Using clear to ensure every element is erased from the canvas before redraw
  void clear() {
    context.clearRect(0, 0, width, height);
  }
  
  
  void redraw() {
    clear();
    racecar.draw();
    // Drawing the car to it's new position on the board 
    if (racecar.rightDown) { racecar.carPositionX += 1;
    } else if (racecar.leftDown) {racecar.carPositionX -= 1;
    } else if (racecar.backDown) {racecar.carPositionY += 1;
    } else if (racecar.frontDown) racecar.carPositionY -= 1;
    racecar.draw();
  }
}
