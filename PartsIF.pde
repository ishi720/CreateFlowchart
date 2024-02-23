class PartsIF extends Parts {
  int flag=10;
  Parts nextY;//リンク先
  Parts nextN;//リンク先

  PartsIF(PVector p, PVector s, color c) {
    super(p, s, c);
  }
  //表示
  void show() {
    stroke(0);
    line(pos.x+34, pos.y-30, pos.x+34, pos.y+30);
    noStroke();

    if (flagA==0) {
      fill(pColor);
      stroke(0, 0, 0);
      quad(pos.x+34, pos.y, pos.x-6, pos.y+30, pos.x+34, pos.y+60, pos.x+74, pos.y+30);
      noStroke();
    }
    else if (flagA!=0) {
      fill(255,0,0);
      stroke(0, 0, 0);
      quad(pos.x+34, pos.y, pos.x-6, pos.y+30, pos.x+34, pos.y+60, pos.x+74, pos.y+30);
      noStroke();
    }
  }
  //更新
  void update() {
    showLinkY();
    showLinkN();
    show();
  }

  //リンク先を設定  
  void createLink(Parts n) {
    if (this!=n && key=='y') {
      this.nextY=n;
    }
    else if (this!=n && key=='n') {
      this.nextN=n;
    }
  }
  //線を消す
  void createLinkReset() {
    this.nextY=null;
    this.nextN=null;
  }

  //実線YES
  void showLinkY() {
    if (nextY!=null) {
      stroke(255, 0, 0);
      line(pos.x+74, pos.y+30, nextY.pos.x+34, nextY.pos.y-30);//線を張る
      noStroke();
    }
  }
  //実線NO
  void showLinkN() {
    if (nextN!=null) {
      stroke(0, 0, 255);
      line(pos.x-6, pos.y+30, nextN.pos.x+34, nextN.pos.y-30);//線を張る
      noStroke();
    }
  }

  void showLinkMouse() {
    if (key=='y') {
      stroke(255, 0, 0);
      line(pos.x+74, pos.y+30, mouseX, mouseY);//線を張る
      noStroke();
    }
    else if (key=='n') {
      stroke(0, 0, 255);
      line(pos.x-6, pos.y+30, mouseX, mouseY);//線を張る
      noStroke();
    }
  }
}

