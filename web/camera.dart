part of super_racer;


class Camera {
  Board board;
  
  num y;
  num x; 
  
  Camera(this.x, this.y) {
    
    
   
    
  }
}

static const num START_X = 70;
static const num START_Y = 322;

//Using time to redraw board 
Timer timer;

CanvasElement canvas;
CanvasRenderingContext2D context;


//Board size (using width and height to fit canvas size)
num width;
num height;

//Elements to draw (need to add background and trees)
var mapImg;

RaceCar racecar;

//List of collision points
List collisions = [{'x':120, 'y':116, 'width':8, 'height':228},
                   {'x':124, 'y':100, 'width':20, 'height':20},
                   {'x':140, 'y':88, 'width':16, 'height':16},
                   {'x':152, 'y':84, 'width':48, 'height':8},
                   {'x':196, 'y':72, 'width':16, 'height':12},
                   {'x':208, 'y':68, 'width':96, 'height':8},
                   {'x':296, 'y':68, 'width':8, 'height':28},
                   {'x':304, 'y':88, 'width':56, 'height':8},
                   {'x':352, 'y':96, 'width':8, 'height':196},
                   {'x':356, 'y':288, 'width':12, 'height':36},
                   {'x':364, 'y':320, 'width':16, 'height':16},
                   {'x':376, 'y':332, 'width':16, 'height':16},
                   {'x':388, 'y':344, 'width':16, 'height':16},
                   {'x':400, 'y':356, 'width':16, 'height':16},
                   {'x':412, 'y':368, 'width':12, 'height':24},
                   {'x':412, 'y':244, 'width':32, 'height':8},
                   {'x':476, 'y':244, 'width':32, 'height':8},
                   {'x':204, 'y':0, 'width':100, 'height':36},
                   {'x':196, 'y':4, 'width':8, 'height':24},
                   {'x':124, 'y':340, 'width':16, 'height':16},
                   {'x':136, 'y':352, 'width':16, 'height':16},
                   {'x':148, 'y':364, 'width':16, 'height':16},
                   {'x':160, 'y':376, 'width':16, 'height':16},
                   {'x':172, 'y':388, 'width':12, 'height':12},
                   {'x':180, 'y':396, 'width':12, 'height':12},
                   {'x':280, 'y':284, 'width':8, 'height':224},
                   {'x':268, 'y':272, 'width':16, 'height':16},
                   {'x':256, 'y':260, 'width':16, 'height':16},
                   {'x':248, 'y':252, 'width':12, 'height':12},
                   {'x':240, 'y':244, 'width':12, 'height':12},
                   {'x':232, 'y':236, 'width':12, 'height':12},
                   {'x':224, 'y':228, 'width':12, 'height':12},
                   {'x':216, 'y':220, 'width':12, 'height':12},
                   ];