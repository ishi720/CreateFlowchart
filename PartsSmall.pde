class PartsSmall extends Parts {
  String source="縮小";

  //コンストラクタ
  PartsSmall(PVector p, PVector s, color c) {
    super(p, s, c);
  }
  //処理
  void process() {
    super.process();
    f.pSize.x-=speed;
    f.pSize.y-=speed;
  }
  void textShow() {
    fill(0);
    textSize(30);
    text(source, pos.x+5, pos.y+35);
  }
}
