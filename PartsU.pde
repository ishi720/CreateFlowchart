class PartsU extends Parts {
  String source="上へ";

  //コンストラクタ
  PartsU(PVector p, PVector s, color c) {
    super(p, s, c);
  }
  //処理
  void process() {
    super.process();
    f.pos.y-=speed;
  }
  void textShow() {
    fill(0);
    textSize(30);
    text(source, pos.x+5, pos.y+35);
  }
}
