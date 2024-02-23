class PartsR extends Parts {
  String source="右へ";

  //コンストラクタ
  PartsR(PVector p, PVector s, color c) {
    super(p, s, c);
  }
  //処理
  void process() {
    super.process();
    f.pos.x+=speed;
  }
  void textShow() {
    fill(0);
    textSize(30);
    text(source, pos.x+5, pos.y+35);
  }
}
