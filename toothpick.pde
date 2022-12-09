
class Toothpick {
  PVector position;
  End[] ends;
  PMatrix mat;
  
  void draw(){
    strokeWeight(2 * (size / 200));
    stroke(255);
    for(int i = 0; i < ends.length; i++){
      PVector endScaled = endScaled(i);
      line(position.x * size, position.y * size, endScaled.x, endScaled.y);
    }
  }
  
  PVector endScaled(int index){
    return new PVector(
      ends[index].position.x * size, 
      ends[index].position.y * size);
  }
}

class End {
  PVector position, direction;
  End(PVector position, PVector direction) {
    this.position = position;
    this.direction = direction;
  }
}

class ClassicToothpick extends Toothpick {
  ClassicToothpick(PVector position, PVector direction){
    this.position = position;
    ends = new End[] {
      new End(position.copy().add(direction.copy().div(2)), new PVector(direction.y, direction.x)),
      new End(position.copy().sub(direction.copy().div(2)), new PVector(direction.y, direction.x)),
    };
  }
}

class EToothpick extends Toothpick {
  EToothpick(PVector position, PVector direction){
    this.position = position;
    ends = new End[] {
      new End(position.copy().add(direction.copy().rotate(PI / 3).div(2)), direction.copy().rotate(PI / 3)),
      new End(position.copy().add(direction.copy().div(2)), direction.copy()),
      new End(position.copy().add(direction.copy().rotate(-PI / 3).div(2)), direction.copy().rotate(-PI / 3))
    };
  }
}

class YToothpick extends Toothpick {
  YToothpick(PVector position, PVector direction){
    this.position = position;
    ends = new End[] {
      new End(position.copy().add(direction.copy().rotate(PI / 3).div(2)), direction.copy().rotate(PI / 3)),
      new End(position.copy().add(direction.copy().rotate(PI).div(2)), direction.copy().rotate(PI)),
      new End(position.copy().add(direction.copy().rotate(-PI / 3).div(2)), direction.copy().rotate(-PI / 3))
    };
  }
}

class VToothpick extends Toothpick {
  VToothpick(PVector position, PVector direction){
    this.position = position;
    ends = new End[] {
      new End(position.copy().add(direction.copy().rotate(PI / 3).div(2)), direction.copy().rotate(PI / 3)),
      new End(position.copy().add(direction.copy().rotate(-PI / 3).div(2)), direction.copy().rotate(-PI / 3))
    };
  }
}

class LToothpick extends Toothpick {
  LToothpick(PVector position, PVector direction){
    this.position = position;
    if(direction.copy().rotate(PI / 4).div(2).x == 0 || direction.copy().rotate(PI / 4).div(2).y == 0){
      ends = new End[] {
        new End(position.copy().add(direction.copy().rotate(PI / 4).div(sqrt(2))), direction.copy().rotate(PI / 4)),
        new End(position.copy().add(direction.copy().rotate(-PI / 4).div(sqrt(2))), direction.copy().rotate(-PI / 4))
      };
    } else{
      ends = new End[] {
        new End(position.copy().add(direction.copy().rotate(PI / 4).div(2)), direction.copy().rotate(PI / 4)),
        new End(position.copy().add(direction.copy().rotate(-PI / 4).div(2)), direction.copy().rotate(-PI / 4))
      };
    }
  }
}
