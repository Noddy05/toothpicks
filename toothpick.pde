
class End {
  PVector position, direction;
  End(PVector position, PVector direction) {
    this.position = position;
    this.direction = direction;
  }
}

class ClassicToothpick {
  PVector position;
  End[] ends;
  PMatrix mat;
  ClassicToothpick(PVector position, PVector direction){
    this.position = position;
    ends = new End[] {
      new End(position.copy().add(direction.copy().div(2)), new PVector(direction.y, direction.x)),
      new End(position.copy().sub(direction.copy().div(2)), new PVector(direction.y, direction.x)),
    };
  }
  
  void draw(){
    strokeWeight(2);
    stroke(255);
    PVector end0 = endScaled(0);
    PVector end1 = endScaled(1);
    
    line(end0.x, end0.y, end1.x, end1.y);
  }
  
  PVector endScaled(int index){
    return new PVector(
      ends[index].position.x * size, 
      ends[index].position.y * size);
  }
}

class EToothpick {
  PVector position;
  End[] ends;
  PMatrix mat;
  EToothpick(PVector position, PVector direction){
    this.position = position;
    ends = new End[] {
      new End(position.copy().add(direction.copy().rotate(PI / 3).div(2)), direction.copy().rotate(PI / 3)),
      new End(position.copy().add(direction.copy().div(2)), direction.copy()),
      new End(position.copy().add(direction.copy().rotate(-PI / 3).div(2)), direction.copy().rotate(-PI / 3))
    };
  }
  
  void draw(){
    strokeWeight(2);
    stroke(255);
    PVector end0 = endScaled(0);
    PVector end1 = endScaled(1);
    PVector end2 = endScaled(2);
    
    line(position.x * size, position.y * size, end0.x, end0.y);
    line(position.x * size, position.y * size, end1.x, end1.y);
    line(position.x * size, position.y * size, end2.x, end2.y);
  }
  
  PVector endScaled(int index){
    return new PVector(
      ends[index].position.x * size, 
      ends[index].position.y * size);
  }
}
