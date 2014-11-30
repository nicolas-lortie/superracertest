part of super_racer;

class RaceCar {
  Board board;
  
  //Car's position on the map
  num carPositionX;
  num carPositionY;
  
  //Bool to use arrow key to control car
  bool rightDown = false;
  bool leftDown = false;
  bool backDown = false;
  bool frontDown = false;
  
  //Car Image
  var img = document.getElementById('luigi');
  RaceCar(this.board, this.carPositionX, this.carPositionY) {
    draw();
    document.onKeyDown.listen(_onKeyDown);
    document.onKeyUp.listen(_onKeyUp);
  }
  
  void draw() {
    board.context.beginPath();
    board.context.rect(carPositionX, carPositionY, 10, 10);
    board.context.closePath();
    board.context.fill();
  }
  
//Change rightDown, leftDown Bool if matching arrow keys are pressed (NEED TO ADD FRONT AND BACK)
  _onKeyDown(event) {
    if (event.keyCode == 39) {
      rightDown = true;
    }
    else if (event.keyCode == 37) {
      leftDown = true;
    }
    else if (event.keyCode == 40) {
      backDown = true;
    }
    else if (event.keyCode == 38) {
      frontDown = true;
    }
// If player uses keys : w,a,s and d to control his car
    else if (event.keyCode == 68) {
      rightDown = true;
    }
    else if (event.keyCode == 65) {
      leftDown = true;
    }
    else if (event.keyCode == 83) {
      backDown = true;
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
}
 

