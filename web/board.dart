part of super_racer;

class Board {
  //Player starting position
  static const num START_X = 473;
  static const num START_Y = 356;

  //Using time to redraw board 
  Timer timer;

  CanvasElement canvas;
  CanvasRenderingContext2D context;
  
  //Board size (using width and height to fit canvas size)
  num width;
  num height;
  
  //Elements to draw (need to add background and trees)
  RaceCar racecar;
  
  //Map collision rectangles (to be removed when list is working)
  var rect1 = {'x': 84, 'y': 80, 'width': 52, 'height': 216};
  var rect2 = {'x': 68, 'y': 276, 'width': 20, 'height': 56};
  var rect3 = {'x': 136, 'y': 188, 'width': 208, 'height': 60};
  var rect4 = {'x': 344, 'y': 208, 'width': 64, 'height': 40};
  var rect5 = {'x': 368, 'y': 248, 'width': 40, 'height': 160};
  var rect6 = {'x': 368, 'y': 4, 'width': 140, 'height': 76};
  var rect7 = {'x': 4, 'y': 436, 'width': 236, 'height': 72};
  
  
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
    querySelector('#play').onClick.listen((e) {
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
       if (collisions.elementAt(0)['x'] <= racecar.carPositionX + racecar.carWidth &&
       collisions.elementAt(0)['x'] + collisions.elementAt(0)['width'] > racecar.carPositionX &&
       collisions.elementAt(0)['y'] < racecar.carPositionY + racecar.carHeight &&
       collisions.elementAt(0)['height'] + collisions.elementAt(0)['y'] > racecar.carPositionY ||
       collisions.elementAt(1)['x'] <= racecar.carPositionX + racecar.carWidth &&
       collisions.elementAt(1)['x'] + collisions.elementAt(1)['width'] > racecar.carPositionX &&
       collisions.elementAt(1)['y'] < racecar.carPositionY + racecar.carHeight &&
       collisions.elementAt(1)['height'] + collisions.elementAt(1)['y'] > racecar.carPositionY ||
       collisions.elementAt(2)['x'] <= racecar.carPositionX + racecar.carWidth &&
       collisions.elementAt(2)['x'] + collisions.elementAt(2)['width'] > racecar.carPositionX &&
       collisions.elementAt(2)['y'] < racecar.carPositionY + racecar.carHeight &&
       collisions.elementAt(2)['height'] + collisions.elementAt(2)['y'] > racecar.carPositionY ||
       collisions.elementAt(3)['x'] <= racecar.carPositionX + racecar.carWidth &&
       collisions.elementAt(3)['x'] + collisions.elementAt(3)['width'] > racecar.carPositionX &&
       collisions.elementAt(3)['y'] < racecar.carPositionY + racecar.carHeight &&
       collisions.elementAt(3)['height'] + collisions.elementAt(3)['y'] > racecar.carPositionY ||
       collisions.elementAt(4)['x'] <= racecar.carPositionX + racecar.carWidth &&
       collisions.elementAt(4)['x'] + collisions.elementAt(4)['width'] > racecar.carPositionX &&
       collisions.elementAt(4)['y'] < racecar.carPositionY + racecar.carHeight &&
       collisions.elementAt(4)['height'] + collisions.elementAt(4)['y'] > racecar.carPositionY ||
       collisions.elementAt(5)['x'] <= racecar.carPositionX + racecar.carWidth &&
       collisions.elementAt(5)['x'] + collisions.elementAt(5)['width'] > racecar.carPositionX &&
       collisions.elementAt(5)['y'] < racecar.carPositionY + racecar.carHeight &&
       collisions.elementAt(5)['height'] + collisions.elementAt(5)['y'] > racecar.carPositionY ||
       collisions.elementAt(6)['x'] <= racecar.carPositionX + racecar.carWidth &&
       collisions.elementAt(6)['x'] + collisions.elementAt(6)['width'] > racecar.carPositionX &&
       collisions.elementAt(6)['y'] < racecar.carPositionY + racecar.carHeight &&
       collisions.elementAt(6)['height'] + collisions.elementAt(6)['y'] > racecar.carPositionY ||
       racecar.carPositionX >= 498) {
         canMoveRight = false; 
       } else if (racecar.carPositionX < 498) { 
         canMoveRight = true; 
       }

       //Left collisions
          if (collisions.elementAt(0)['x'] < racecar.carPositionX + racecar.carWidth &&
          collisions.elementAt(0)['x'] + collisions.elementAt(0)['width'] >= racecar.carPositionX &&
          collisions.elementAt(0)['y'] < racecar.carPositionY + racecar.carHeight &&
          collisions.elementAt(0)['height'] + collisions.elementAt(0)['y'] > racecar.carPositionY ||
          collisions.elementAt(1)['x'] < racecar.carPositionX + racecar.carWidth &&
          collisions.elementAt(1)['x'] + collisions.elementAt(1)['width'] >= racecar.carPositionX &&
          collisions.elementAt(1)['y'] < racecar.carPositionY + racecar.carHeight &&
          collisions.elementAt(1)['height'] + collisions.elementAt(1)['y'] > racecar.carPositionY ||
          collisions.elementAt(2)['x'] < racecar.carPositionX + racecar.carWidth &&
          collisions.elementAt(2)['x'] + collisions.elementAt(2)['width'] >= racecar.carPositionX &&
          collisions.elementAt(2)['y'] < racecar.carPositionY + racecar.carHeight &&
          collisions.elementAt(2)['height'] + collisions.elementAt(2)['y'] > racecar.carPositionY ||
          collisions.elementAt(3)['x'] < racecar.carPositionX + racecar.carWidth &&
          collisions.elementAt(3)['x'] + collisions.elementAt(3)['width'] >= racecar.carPositionX &&
          collisions.elementAt(3)['y'] < racecar.carPositionY + racecar.carHeight &&
          collisions.elementAt(3)['height'] + collisions.elementAt(3)['y'] > racecar.carPositionY ||
          collisions.elementAt(4)['x'] < racecar.carPositionX + racecar.carWidth &&
          collisions.elementAt(4)['x'] + collisions.elementAt(4)['width'] >= racecar.carPositionX &&
          collisions.elementAt(4)['y'] < racecar.carPositionY + racecar.carHeight &&
          collisions.elementAt(4)['height'] + collisions.elementAt(4)['y'] > racecar.carPositionY ||
          collisions.elementAt(5)['x'] < racecar.carPositionX + racecar.carWidth &&
          collisions.elementAt(5)['x'] + collisions.elementAt(5)['width'] >= racecar.carPositionX &&
          collisions.elementAt(5)['y'] < racecar.carPositionY + racecar.carHeight &&
          collisions.elementAt(5)['height'] + collisions.elementAt(5)['y'] > racecar.carPositionY ||
          collisions.elementAt(6)['x'] < racecar.carPositionX + racecar.carWidth &&
          collisions.elementAt(6)['x'] + collisions.elementAt(6)['width'] >= racecar.carPositionX &&
          collisions.elementAt(6)['y'] < racecar.carPositionY + racecar.carHeight &&
          collisions.elementAt(6)['height'] + collisions.elementAt(6)['y'] > racecar.carPositionY ||
          racecar.carPositionX <= 4) {
            canMoveLeft = false; 
          } else if (racecar.carPositionX > 4) { 
            canMoveLeft = true; 
          }
          
          
          //Front collisions
             if (collisions.elementAt(0)['x'] < racecar.carPositionX + racecar.carWidth &&
             collisions.elementAt(0)['x'] + collisions.elementAt(0)['width'] > racecar.carPositionX &&
             collisions.elementAt(0)['y'] < racecar.carPositionY + racecar.carHeight &&
             collisions.elementAt(0)['height'] + collisions.elementAt(0)['y'] >= racecar.carPositionY ||
             collisions.elementAt(1)['x'] < racecar.carPositionX + racecar.carWidth &&
             collisions.elementAt(1)['x'] + collisions.elementAt(1)['width'] > racecar.carPositionX &&
             collisions.elementAt(1)['y'] < racecar.carPositionY + racecar.carHeight &&
             collisions.elementAt(1)['height'] + collisions.elementAt(1)['y'] >= racecar.carPositionY ||
             collisions.elementAt(2)['x'] < racecar.carPositionX + racecar.carWidth &&
             collisions.elementAt(2)['x'] + collisions.elementAt(2)['width'] > racecar.carPositionX &&
             collisions.elementAt(2)['y'] < racecar.carPositionY + racecar.carHeight &&
             collisions.elementAt(2)['height'] + collisions.elementAt(2)['y'] >= racecar.carPositionY ||
             collisions.elementAt(3)['x'] < racecar.carPositionX + racecar.carWidth &&
             collisions.elementAt(3)['x'] + collisions.elementAt(3)['width'] > racecar.carPositionX &&
             collisions.elementAt(3)['y'] < racecar.carPositionY + racecar.carHeight &&
             collisions.elementAt(3)['height'] + collisions.elementAt(3)['y'] >= racecar.carPositionY ||
             collisions.elementAt(4)['x'] < racecar.carPositionX + racecar.carWidth &&
             collisions.elementAt(4)['x'] + collisions.elementAt(4)['width'] > racecar.carPositionX &&
             collisions.elementAt(4)['y'] < racecar.carPositionY + racecar.carHeight &&
             collisions.elementAt(4)['height'] + collisions.elementAt(4)['y'] >= racecar.carPositionY ||
             collisions.elementAt(5)['x'] < racecar.carPositionX + racecar.carWidth &&
             collisions.elementAt(5)['x'] + collisions.elementAt(5)['width'] > racecar.carPositionX &&
             collisions.elementAt(5)['y'] < racecar.carPositionY + racecar.carHeight &&
             collisions.elementAt(5)['height'] + collisions.elementAt(5)['y'] >= racecar.carPositionY ||
             collisions.elementAt(6)['x'] < racecar.carPositionX + racecar.carWidth &&
             collisions.elementAt(6)['x'] + collisions.elementAt(6)['width'] > racecar.carPositionX &&
             collisions.elementAt(6)['y'] < racecar.carPositionY + racecar.carHeight &&
             collisions.elementAt(6)['height'] + collisions.elementAt(6)['y'] >= racecar.carPositionY ||
             racecar.carPositionY <= 4) {
               canMoveFront = false; 
             } else if (racecar.carPositionY > 4) { 
               canMoveFront = true; 
             }
             
             //Back collisions
                if (collisions.elementAt(0)['x'] < racecar.carPositionX + racecar.carWidth &&
                collisions.elementAt(0)['x'] + collisions.elementAt(0)['width'] > racecar.carPositionX &&
                collisions.elementAt(0)['y'] <= racecar.carPositionY + racecar.carHeight &&
                collisions.elementAt(0)['height'] + collisions.elementAt(0)['y'] > racecar.carPositionY ||
                collisions.elementAt(1)['x'] < racecar.carPositionX + racecar.carWidth &&
                collisions.elementAt(1)['x'] + collisions.elementAt(1)['width'] > racecar.carPositionX &&
                collisions.elementAt(1)['y'] <= racecar.carPositionY + racecar.carHeight &&
                collisions.elementAt(1)['height'] + collisions.elementAt(1)['y'] > racecar.carPositionY ||
                collisions.elementAt(2)['x'] < racecar.carPositionX + racecar.carWidth &&
                collisions.elementAt(2)['x'] + collisions.elementAt(2)['width'] > racecar.carPositionX &&
                collisions.elementAt(2)['y'] <= racecar.carPositionY + racecar.carHeight &&
                collisions.elementAt(2)['height'] + collisions.elementAt(2)['y'] > racecar.carPositionY ||
                collisions.elementAt(3)['x'] < racecar.carPositionX + racecar.carWidth &&
                collisions.elementAt(3)['x'] + collisions.elementAt(3)['width'] > racecar.carPositionX &&
                collisions.elementAt(3)['y'] <= racecar.carPositionY + racecar.carHeight &&
                collisions.elementAt(3)['height'] + collisions.elementAt(3)['y'] > racecar.carPositionY ||
                collisions.elementAt(4)['x'] < racecar.carPositionX + racecar.carWidth &&
                collisions.elementAt(4)['x'] + collisions.elementAt(4)['width'] > racecar.carPositionX &&
                collisions.elementAt(4)['y'] <= racecar.carPositionY + racecar.carHeight &&
                collisions.elementAt(4)['height'] + collisions.elementAt(4)['y'] > racecar.carPositionY ||
                collisions.elementAt(5)['x'] < racecar.carPositionX + racecar.carWidth &&
                collisions.elementAt(5)['x'] + collisions.elementAt(5)['width'] > racecar.carPositionX &&
                collisions.elementAt(5)['y'] <= racecar.carPositionY + racecar.carHeight &&
                collisions.elementAt(5)['height'] + collisions.elementAt(5)['y'] > racecar.carPositionY ||
                collisions.elementAt(6)['x'] < racecar.carPositionX + racecar.carWidth &&
                collisions.elementAt(6)['x'] + collisions.elementAt(6)['width'] > racecar.carPositionX &&
                collisions.elementAt(6)['y'] <= racecar.carPositionY + racecar.carHeight &&
                collisions.elementAt(6)['height'] + collisions.elementAt(6)['y'] > racecar.carPositionY ||
                racecar.carPositionY >= 498) {
                  canMoveBack = false; 
                } else if (racecar.carPositionY < 498) { 
                  canMoveBack = true; 
                }             
       
    // Drawing the car to it's new position on the board 
    if (racecar.backDown && canMoveBack) {racecar.carPositionY += 1;
    }
    if (racecar.frontDown && canMoveFront) {racecar.carPositionY -= 1; 
    }
    if (racecar.rightDown && canMoveRight) { racecar.carPositionX += 1;
    }
    if (racecar.leftDown && canMoveLeft) {racecar.carPositionX -= 1;
    }
    racecar.draw();
  }
}
