part of super_racer;

class Board {
  
  RaceMap raceMap;

  //Using time to redraw board 
  Timer timer;

  CanvasElement canvas;
  CanvasRenderingContext2D context;
  
  //Board size (using width and height to fit canvas size)
  num width;
  num height;
  
  RaceCar racecar;
 
  //Boolean to indicate car collision
  bool canMoveLeft = true;
  bool canMoveRight = true;
  bool canMoveFront = true; 
  bool canMoveBack = true;
  
  //Drawing the board to fit the canvas
  Board(this.canvas, this.raceMap) {
    context = canvas.getContext("2d");
    width = canvas.width;
    height = canvas.height;   
    
    //Using the start game button to start game
    init();
  }
  
  //Initial 'Draw'
  void init() {
    context.beginPath();
    context.drawImage(raceMap.background, 0, 0);
    context.closePath();
    context.fill();
    racecar = new RaceCar(this, raceMap.startx, raceMap.starty);
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
    context.beginPath();
    context.drawImage(raceMap.background, 0, 0);
    context.closePath();
    context.fill();
 
    
//Right collisions
    
    for (var i = 0; i < raceMap.collisions.length; i++) {
      if (raceMap.collisions.elementAt(i)['x'] <= racecar.carPositionX + racecar.carWidth &&
       raceMap.collisions.elementAt(i)['x'] + raceMap.collisions.elementAt(i)['width'] > racecar.carPositionX &&
       raceMap.collisions.elementAt(i)['y'] < racecar.carPositionY + racecar.carHeight &&
       raceMap.collisions.elementAt(i)['height'] + raceMap.collisions.elementAt(i)['y'] > racecar.carPositionY ||
       racecar.carPositionX >= 498) {
         canMoveRight = false; {racecar.carPositionX -= racecar.collisionImpact; 
       }
         racecar.draw();
       } else if (racecar.carPositionX < 498) { 
         canMoveRight = true; 
       }
    }

    //Left collisions
    for (var i = 0; i < raceMap.collisions.length; i++) {
      if (raceMap.collisions.elementAt(i)['x'] < racecar.carPositionX + racecar.carWidth &&
      raceMap.collisions.elementAt(i)['x'] + raceMap.collisions.elementAt(i)['width'] >= racecar.carPositionX &&
      raceMap.collisions.elementAt(i)['y'] < racecar.carPositionY + racecar.carHeight &&
      raceMap.collisions.elementAt(i)['height'] + raceMap.collisions.elementAt(i)['y'] > racecar.carPositionY ||
      racecar.carPositionX <= 4) {
        canMoveLeft = false; {racecar.carPositionX += racecar.collisionImpact; 
        }
        racecar.draw();
      } else if (racecar.carPositionX > 4) { 
        canMoveLeft = true; 
      }
    }
          
          
    //Front collisions
    for (var i = 0; i < raceMap.collisions.length; i++) {
      if (raceMap.collisions.elementAt(i)['x'] < racecar.carPositionX + racecar.carWidth &&
      raceMap.collisions.elementAt(i)['x'] + raceMap.collisions.elementAt(i)['width'] > racecar.carPositionX &&
      raceMap.collisions.elementAt(i)['y'] < racecar.carPositionY + racecar.carHeight &&
      raceMap.collisions.elementAt(i)['height'] + raceMap.collisions.elementAt(i)['y'] >= racecar.carPositionY ||
      racecar.carPositionY <= 4) {
        canMoveFront = false; {racecar.carPositionY += racecar.collisionImpact; 
        }
        racecar.draw();
      } else if (racecar.carPositionY > 4) { 
        canMoveFront = true; 
      }
    }
             
    //Back collisions
    for (var i = 0; i < raceMap.collisions.length; i++) {
       if (raceMap.collisions.elementAt(i)['x'] < racecar.carPositionX + racecar.carWidth &&
       raceMap.collisions.elementAt(i)['x'] + raceMap.collisions.elementAt(i)['width'] > racecar.carPositionX &&
       raceMap.collisions.elementAt(i)['y'] <= racecar.carPositionY + racecar.carHeight &&
       raceMap.collisions.elementAt(i)['height'] + raceMap.collisions.elementAt(i)['y'] > racecar.carPositionY ||
       racecar.carPositionY >= 498) {
         canMoveBack = false; {racecar.carPositionY -= racecar.collisionImpact;
         }
         racecar.draw();
       } else if (racecar.carPositionY < 498) { 
         canMoveBack = true; 
       }  
    }
                             

    //Diagonal speed adjustments
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
