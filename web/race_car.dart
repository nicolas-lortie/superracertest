part of super_racer;


class RaceCar {
  Board board; 
  int x; 
  int y;
  int width;
  int height; 
  ImageElement racecar; 
  
  RaceCar(this.board, this.x, this.y, this.width, this.height) {
    racecar =document.querySelector('#racecar');
    document.onKeyDown.listen((KeyboardEvent e) {
       
    });
  }
    
}