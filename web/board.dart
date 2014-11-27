part of super_racer;

class Board {
  int x = 0;
  int y = 0;
  int width;
  int height;
  Threes three1;
  Threes three2;
  Threes three3;
  Threes three4;
  CanvasRenderingContext2D context;


  Board(CanvasElement canvas) {
    context = canvas.getContext('2d');
    width = canvas.width;
    height = canvas.height;
    three1= new Threes (this, 150, -120, 70, 100);
    three2= new Threes (this, 370, -110, 70, 120);
    three3= new Threes (this, 580, -120, 70, 100);
    three4= new Threes (this, 710, -110, 75, 110);
    border();
    window.animationFrame.then(gameLoop);

  }
  
    gameLoop(num delta) {
      draw();
      window.animationFrame.then(gameLoop);
    }

    border() {
      context.beginPath();
      context.fillStyle = 'lightBlue';
      context.rect(x, y, width, height);
      context.fillRect(x, y, width, height);
      context.closePath();
      context.stroke();
    }

    clear() {
      context.clearRect(x, y, width, height);
      border();
    }

  
  
  draw() {
 
      three1.draw();
      three2.draw();
      three3.draw();
      three4.draw();
      
  }
}

