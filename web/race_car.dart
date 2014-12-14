part of super_racer;

class RaceCar {
  Board board;
  
  
  
  //Car size
  num carWidth = 20;
  num carHeight = 20;
  
  //Car's position on the map
  num carPositionX;
  num carPositionY;
  
  //Boolean to use arrow key to control car
  bool rightDown = false;
  bool leftDown = false;
  bool backDown = false;
  bool frontDown = false;
 
  //Car Images
  ImageElement up = new ImageElement(src: "/media/up.png");
  ImageElement upLeft = new ImageElement(src: "/media/leftup.png");
  ImageElement upRight = new ImageElement(src: "/media/rightup.png");
  ImageElement down = new ImageElement(src: "/media/down.png");
  ImageElement downLeft = new ImageElement(src: "/media/leftdown.png");
  ImageElement downRight = new ImageElement(src: "/media/rightdown.png");
  ImageElement left = new ImageElement(src: "/media/left.png");
  ImageElement right = new ImageElement(src: "/media/right.png");
  
  
  RaceCar(this.board, this.carPositionX, this.carPositionY) {
    draw();
    document.onKeyDown.listen(_turnLeft);
    document.onKeyDown.listen(_turnRight);
    document.onKeyDown.listen(_turnFront);
    document.onKeyDown.listen(_turnBack);
    document.onKeyUp.listen(_onKeyUp);
  }
  
//Change rightDown, leftDown Bool if matching arrow keys are pressed
  _turnRight(event) {
    if (event.keyCode == 39) {
      rightDown = true;
    }
    else if (event.keyCode == 68) {
      rightDown = true;
    }
  }
  
  _turnLeft(event) {
    if (event.keyCode == 37) {
      leftDown = true;
     }
    else if (event.keyCode == 65) {
      leftDown = true;
    }
  }
  
  _turnBack(event) {
    if (event.keyCode == 40) {
      backDown = true;
     }
    else if (event.keyCode == 83) {
      backDown = true;
    }
  }
  
  _turnFront(event) {
    if (event.keyCode == 38) {
      frontDown = true;
    }
    else if (event.keyCode == 87) {
      frontDown = true;
    }
  }

//Changes back if arrow keys are not pressed
  _onKeyUp(event) {
    if (event.keyCode == 39) {
      rightDown = false;
    }
    else if (event.keyCode == 37) {
      leftDown = false;
    }
    else if (event.keyCode == 40) {
      backDown = false;
    }
    else if (event.keyCode == 38) {
      frontDown = false;
    }
// If player uses keys : w,a,s and d to control his car
    else if (event.keyCode == 68) {
      rightDown = false;
    }
    else if (event.keyCode == 65) {
      leftDown = false;
    }
    else if (event.keyCode == 83) {
      backDown = false;
    }
    else if (event.keyCode == 87) {
      frontDown = false;
    }
  }
  
  //Draws the car depending on the keys pressed
  void draw() {
     if (rightDown && !leftDown && !frontDown && !backDown) {
       board.context.beginPath();
       board.context.drawImage(right, carPositionX, carPositionY);
       board.context.closePath();
       board.context.fill();
     } else if (rightDown && !leftDown && frontDown && !backDown) {
       board.context.beginPath();
       board.context.drawImage(upRight, carPositionX, carPositionY);
       board.context.closePath();
       board.context.fill();
     } else if (rightDown && !leftDown && !frontDown && backDown) {
       board.context.beginPath();
       board.context.drawImage(downRight, carPositionX, carPositionY);
       board.context.closePath();
       board.context.fill();
     } else if (!rightDown && !leftDown && frontDown && !backDown) {
       board.context.beginPath();
       board.context.drawImage(up, carPositionX, carPositionY);
       board.context.closePath();
       board.context.fill();
     } else if (!rightDown && leftDown && frontDown && !backDown) {
       board.context.beginPath();
       board.context.drawImage(upLeft, carPositionX, carPositionY);
       board.context.closePath();
       board.context.fill();
     } else if (!rightDown && leftDown && !frontDown && !backDown) {
       board.context.beginPath();
       board.context.drawImage(left, carPositionX, carPositionY);
       board.context.closePath();
       board.context.fill();
     } else if (!rightDown && leftDown && !frontDown && backDown) {
       board.context.beginPath();
       board.context.drawImage(downLeft, carPositionX, carPositionY);
       board.context.closePath();
       board.context.fill();
     } else if (!rightDown && !leftDown && !frontDown && backDown) {
       board.context.beginPath();
       board.context.drawImage(down, carPositionX, carPositionY);
       board.context.closePath();
       board.context.fill();
     } else {
       board.context.beginPath();
       board.context.drawImage(up, carPositionX, carPositionY);
       board.context.closePath();
       board.context.fill();
     }
   }
  
  
  
  
}
 

