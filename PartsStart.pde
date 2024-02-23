class PartsStart extends Parts {
  String source="開始";

  //コンストラクタ
  PartsStart(PVector p, PVector s, color c) {
    super(p, s, c);
  }
  //処理
  void process() {
  }

  //表示
  void show() {
    stroke(0);
    line(pos.x+34, pos.y+30, pos.x+34, pos.y+90);
    noStroke();

    if (flagA==0) {
      fill(pColor);
      stroke(0, 0, 0);
      rect(pos.x, pos.y, pSize.x, pSize.y);
      noStroke();
    }
    else if (flagA!=0) {
      fill(pColor);
      stroke(255, 0, 0);
      rect(pos.x, pos.y, pSize.x, pSize.y);
      noStroke();
    }
  }
  void textShow() {
    fill(0, 0, 0);
    textSize(30);
    text(source, pos.x+5, pos.y+35);
  }
}

