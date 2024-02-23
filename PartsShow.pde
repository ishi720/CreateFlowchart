class PartsShow extends Parts {
  String source="表示";

  //コンストラクタ
  PartsShow(PVector p, PVector s, color c) {
    super(p, s, c);
  }
  //処理
  void process() {
    super.process();
    fshow.copy(f);
  }
  
  void textShow() {
    fill(0);
    textSize(30);
    text(source, pos.x+5, pos.y+35);
  }
}
