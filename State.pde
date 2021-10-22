static class State {
  private int missionaries;
  private int cannibals;
  private String side;

  State(int missionaries, int cannibals, String side) {
    this.missionaries = missionaries;
    this.cannibals = cannibals;
    if(side == "L" || side == "R"){this.side = side;}else{println("Please enter L or R to declare which side is the boat");}
    
  }

  public int getMissionaries() {
    return this.missionaries;
  }
  public int getCannibals() {
    return this.cannibals;
  }
  public String getSide() {
    return this.side;
  }
  public void setMissionaries(int missionaries) {
    this.missionaries = missionaries;
  }
  public void setCannibals(int cannibals) {
    this.cannibals = cannibals;
  }
  public void setSide(String side) {
    this.side = side;
  }

  private void toggleSide() {
    String s = getSide();
    if (s == "R") {
      setSide("L");
    }
    if (s == "L") {
      setSide("R");
    }
  }
  public static boolean isValid(State state) {
    int m = state.getMissionaries();
    int c = state.getCannibals();
    String s = state.getSide();
    //check the range
    if (m > 3 || m < 0 || c > 3 || c < 0) {
      return false;
    }
    if(!(s == "R" || s=="L")){
      return false;
    }
    //check left side for constraints
    if (m < c && m > 0) {
      return false;
    }
    //check right side for constraints
    if (m > c && m < 3) {
      return false;
    }
    return true;
  }
  
  public void nextState(State current, ){
  
  }
}

private enum Action{
  TwoMissionaries,OneMissionary,OneMissionaryOneCannibal,TwoCannibals,OneCannibal
}
