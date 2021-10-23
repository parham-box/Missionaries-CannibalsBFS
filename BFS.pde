int lastVisited = 0;
ArrayList<State> nodes = new ArrayList<State>();

State initalState = new State(3, 3, "L");
State goalState = new State(0, 0, "R");

void setup() {
  size(1000, 1000); //size of the window
  background(255);
  frameRate(30);
  nodes.add(initalState);
  while (true) {

    boolean flag = false;
    State cur = nodes.get(lastVisited);

    for (int i = 0; i < lastVisited; i++) {
      if (cur.isEqual(nodes.get(i))) {
        flag = true;
      }
    }
    println("--------");
    print("Current state: ");
    cur.printState();
    if (cur.isEqual(goalState)) {
      println("GOAL STATE");
      break;
    }
    if (!flag) {
      if (cur.isValid()) {
        State[] nextStates = cur.nextStates();
        for (int i = 0; i < nextStates.length; i++) {
          nodes.add(nextStates[i]);
        }
      } else {
        println("Not a valid state");
      }
    } else {
      println("Visited Before");
    }

    lastVisited++;
    println("--------");
  }
  int v = 1;
  int y = 0;
  int[] parentNodeNumber = new int[nodes.size()];
  //root node
  parentNodeNumber[0] = -1;
  for (int x = 1; x < nodes.size(); x++) {
    for (int k = 0; k < x; k++) {
      if (nodes.get(x).getParent().isEqual(nodes.get(k))) {
        parentNodeNumber[x] = k;
      }
    }
  }
  fill(0);

  for (int i = 0; i < nodes.size(); i++) {
    //nodes.get(i).printState();

    if (i!=0) {
      if (nodes.get(i).getSide() == nodes.get(i-1).getSide()) {
        y++;
      } else {
        v++;
        y =0;
      }
      
      line(nodes.get(i));
      text(nodes.get(i).stateString(), 30+(y*50), 30+(v*50));
    } else {
      text(nodes.get(i).stateString(), 30, 30+(v*50));
    }
  }
  println(nodes.size());
  println(parentNodeNumber.length);
}
