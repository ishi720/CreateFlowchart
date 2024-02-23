class PartsBig extends Parts {
  String source="拡大";

  //コンストラクタ
  PartsBig(PVector p, PVector s, color c) {
    super(p, s, c);
  }
  //処理
  void process() {
    super.process();
    f.pSize.x+=speed;
    f.pSize.y+=speed;
  }
  void textShow() {
    fill(0);
    textSize(30);
    text(source, pos.x+5, pos.y+35);
  }
}
