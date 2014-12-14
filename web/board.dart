part of super_racer;

class Board {

  //Player starting position
  static const num START_X = 447;
  static const num START_Y = 290;

  //Using time to redraw board 
  Timer timer;

  CanvasElement canvas;
  CanvasRenderingContext2D context;
  
  
  //Board size (using width and height to fit canvas size)
  num width;
  num height;
  
  RaceCar racecar;
  
  //List of collision points
  List collisions = [{'x': 84, 'y': 80, 'width': 52, 'height': 216},
                     {'x': 68, 'y': 276, 'width': 20, 'height': 56},
                     {'x': 136, 'y': 188, 'width': 208, 'height': 60},
                     {'x': 344, 'y': 208, 'width': 64, 'height': 40},
                     {'x': 368, 'y': 248, 'width': 40, 'height': 160},
                     {'x': 368, 'y': 4, 'width': 140, 'height': 76},
                     {'x': 4, 'y': 436, 'width': 236, 'height': 72}
                     ];
 
  //Boolean to indicate car collision
  bool canMoveLeft = true;
  bool canMoveRight = true;
  bool canMoveFront = true; 
  bool canMoveBack = true;
  
  //Drawing the board to fit the canvas
  Board(this.canvas) {
    context = canvas.getContext("2d");
    width = canvas.width;
    height = canvas.height;   
    
    //Using the start game button to start game
    querySelector('#play1').onClick.listen((e) {
      init();
    });
  }
  
  //Initial 'Draw'
  void init() {
    racecar = new RaceCar(this, START_X, START_Y);
    // redraw every 10 ms
    timer = new Timer.periodic(const Duration(milliseconds: 10),
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
 
    
//Right collisions
    
    for (var i = 0; i < collisions.length; i++) {
      if (collisions.elementAt(i)['x'] <= racecar.carPositionX + racecar.carWidth &&
       collisions.elementAt(i)['x'] + collisions.elementAt(i)['width'] > racecar.carPositionX &&
       collisions.elementAt(i)['y'] < racecar.carPositionY + racecar.carHeight &&
       collisions.elementAt(i)['height'] + collisions.elementAt(i)['y'] > racecar.carPositionY ||
       racecar.carPositionX >= 498) {
         canMoveRight = false; {racecar.carPositionX -= racecar.collisionImpact; 
       }
         racecar.draw();
       } else if (racecar.carPositionX < 498) { 
         canMoveRight = true; 
       }
    }

    //Left collisions
    for (var i = 0; i < collisions.length; i++) {
      if (collisions.elementAt(i)['x'] < racecar.carPositionX + racecar.carWidth &&
      collisions.elementAt(i)['x'] + collisions.elementAt(i)['width'] >= racecar.carPositionX &&
      collisions.elementAt(i)['y'] < racecar.carPositionY + racecar.carHeight &&
      collisions.elementAt(i)['height'] + collisions.elementAt(i)['y'] > racecar.carPositionY ||
      racecar.carPositionX <= 4) {
        canMoveLeft = false; {racecar.carPositionX += racecar.collisionImpact; 
        }
        racecar.draw();
      } else if (racecar.carPositionX > 4) { 
        canMoveLeft = true; 
      }
    }
          
          
    //Front collisions
    for (var i = 0; i < collisions.length; i++) {
      if (collisions.elementAt(i)['x'] < racecar.carPositionX + racecar.carWidth &&
      collisions.elementAt(i)['x'] + collisions.elementAt(i)['width'] > racecar.carPositionX &&
      collisions.elementAt(i)['y'] < racecar.carPositionY + racecar.carHeight &&
      collisions.elementAt(i)['height'] + collisions.elementAt(i)['y'] >= racecar.carPositionY ||
      racecar.carPositionY <= 4) {
        canMoveFront = false; {racecar.carPositionY += racecar.collisionImpact; 
        }
        racecar.draw();
      } else if (racecar.carPositionY > 4) { 
        canMoveFront = true; 
      }
    }
             
    //Back collisions
    for (var i = 0; i < collisions.length; i++) {
       if (collisions.elementAt(i)['x'] < racecar.carPositionX + racecar.carWidth &&
       collisions.elementAt(i)['x'] + collisions.elementAt(i)['width'] > racecar.carPositionX &&
       collisions.elementAt(i)['y'] <= racecar.carPositionY + racecar.carHeight &&
       collisions.elementAt(i)['height'] + collisions.elementAt(i)['y'] > racecar.carPositionY ||
       racecar.carPositionY >= 498) {
         canMoveBack = false; {racecar.carPositionY -= racecar.collisionImpact;
         }
         racecar.draw();
       } else if (racecar.carPositionY < 498) { 
         canMoveBack = true; 
       }  
    }
                             
       
    // Drawing the car to it's new position on the board 
    if (racecar.backDown && canMoveBack) {racecar.carPositionY += racecar.speed;
    }
    if (racecar.frontDown && canMoveFront) {racecar.carPositionY -= racecar.speed; 
    }
    if (racecar.rightDown && canMoveRight) { racecar.carPositionX += racecar.speed;
    }
    if (racecar.leftDown && canMoveLeft) {racecar.carPositionX -= racecar.speed;
    }
    racecar.draw();
  }
}
