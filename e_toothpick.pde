
ArrayList<Toothpick> toothpicks = new ArrayList<Toothpick>();
ArrayList<End> ends = new ArrayList<End>();
float size = 100;

void setup(){
  size(400, 400);
  Toothpick newToothpick = new EToothpick(new PVector(0, 0), new PVector(1, 0)); // <--- Change to correct toothpick type
  toothpicks.add(newToothpick);
  for(End end : newToothpick.ends)
    ends.add(end);
}

void draw(){
  size = 300 / sqrt(toothpicks.size());
  translate(width / 2, height / 2);
  background(30);
  for(Toothpick toothpick : toothpicks){
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
    Toothpick newToothpick = new EToothpick(end.position, end.direction); // <--- Change to correct toothpick type
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
  float endDistance = 0.2;
  for(End end : currentEnds){
    for(End otherEnd : currentEnds){
      if(end == otherEnd)
        continue;
      
      if(distance(end.position.x, otherEnd.position.x) <= endDistance && distance(end.position.y, otherEnd.position.y) <= endDistance)
        ends.remove(end);
    }
    for(Toothpick toothpick : toothpicks){
      boolean skip = false;
      for(int i = 0; i < toothpick.ends.length; i++)
        if(toothpick.ends[i] == end)
          skip = true;
      if(skip)
        continue;
        
      if(distance(end.position.x, toothpick.position.x) <= endDistance && distance(end.position.y, toothpick.position.y) <= endDistance)
        ends.remove(end);
    }
  }
}

float distance(float a, float b){
  return abs(a - b);
}
