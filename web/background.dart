part of super_racer;
















class Threes {
  Board board;
  int x;
  int y;
  int width;
  int height;
  ImageElement three;
  //bool rightDown = false;
  //bool leftDown = false;

  Threes(this.board, this.x, this.y, this.width, this.height) {
    three = document.querySelector('#three');
    document.onMouseMove.listen((MouseEvent e) {
          x = e.offset.x - 35;
          y = e.offset.y - 35;
        });
        draw();
   // document.onKeyDown.listen(onKeyDown);
   // document.onKeyUp.listen(onKeyUp);


  }

    // left keycode = 37 right keycode = 39
 /* void onKeyDown(event) {
    if (event.keycode == 37) ;
    leftDown = true;
    if (event.keycode == 39) ;
    rightDown = true;
  }
  void onKeyUp(event) {
    if (event.keyCode == 39) {
      rightDown = false;
    } else if (event.keyCode == 37) {
      leftDown = false;
    }
  }*/
  draw() {
      board.context.drawImageToRect(three, new Rectangle(x, y, width, height));
    }
}
