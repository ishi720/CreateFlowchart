class PartsSP extends Parts {
  String source=" SP";

  //コンストラクタ
  PartsSP(PVector p, PVector s, color c) {
    super(p, s, c);
  }
  //処理
  void process() {
    super.process();
    f.pos.x+=random(-10,10);
    f.pos.y+=random(-10,10);
    f.pSize.x+=random(-10,10);
    f.pSize.y+=random(-10,10);
    f.froll+=random(-30,30);
  }
  void textShow() {
    fill(0);
    textSize(30);
    text(source, pos.x+5, pos.y+35);
  }
}
