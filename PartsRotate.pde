class PartsRotate extends Parts {
  String source="回転";
  //コンストラクタ
  PartsRotate(PVector p, PVector s, color c) {
    super(p, s, c);

  }
  //処理
  void process() {
    super.process();
       f.froll-=30;
  }

  void textShow() {
    fill(0);
    textSize(30);
    text(source, pos.x+5, pos.y+35);
  }
}

