
ArrayList<EToothpick> toothpicks = new ArrayList<EToothpick>();
ArrayList<End> ends = new ArrayList<End>();
float size = 100;

void setup(){
  size(400, 400);
  EToothpick newToothpick = new EToothpick(new PVector(0, 0), new PVector(1, 0));
  toothpicks.add(newToothpick);
  ends.add(newToothpick.ends[0]);
  ends.add(newToothpick.ends[1]);
  ends.add(newToothpick.ends[2]);
}

void draw(){
  size = 400 / sqrt(toothpicks.size());
  translate(width / 2, height / 2);
  background(30);
  for(EToothpick toothpick : toothpicks){
    toothpick.draw();
  }
  for(End end : ends){
    circle(end.position.x * size, end.position.y * size, 5);
  }
}

void mousePressed(){
  expandToothpicks();
}

void expandToothpicks(){
  ArrayList<End> currentEnds = new ArrayList<End>();
  for(End end : ends){
    currentEnds.add(end);
  }
  for(End end : currentEnds){
    EToothpick newToothpick = new EToothpick(end.position, end.direction);
    toothpicks.add(newToothpick);
    ends.remove(end);
    for(int i = 0; i <newToothpick.ends.length; i++)
      ends.add(newToothpick.ends[i]);
  }
  cleanup();
}

void cleanup(){
  ArrayList<End> currentEnds = new ArrayList<End>();
  for(End end : ends){
    currentEnds.add(end);
  }
  for(End end : currentEnds){
    for(End otherEnd : currentEnds){
      if(end == otherEnd)
        continue;
      
      if(distance(end.position.x, otherEnd.position.x) <= 0.1 && distance(end.position.y, otherEnd.position.y) <= 0.1)
        ends.remove(end);
    }
    for(EToothpick toothpick : toothpicks){
      boolean skip = false;
      for(int i = 0; i < toothpick.ends.length; i++)
        if(toothpick.ends[i] == end)
          skip = true;
      if(skip)
        continue;
        
      if(distance(end.position.x, toothpick.position.x) <= 0.1 && distance(end.position.y, toothpick.position.y) <= 0.1)
        ends.remove(end);
    }
  }
}

float distance(float a, float b){
  return abs(a - b);
}
