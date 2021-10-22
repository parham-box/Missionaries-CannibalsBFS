void setup() {
    size(800, 800); //size of the window
  background(255);
  frameRate(30);
  State initalState = new State(3,3,"L");
  println(State.isValid(initalState));
  
}
void draw(){
}
