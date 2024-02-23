class PartsIFx extends PartsIF {
  String source="マウスが右側ならば";

  PartsIFx(PVector p, PVector s, color c) {
    super(p, s, c);
  }
  //処理
  void process() {
    flagA=1;
    if (f.pos.x+25<=mouseX) {
      next=nextY;
    }
    else {
      next=nextN;
    }
  }

  void textShow() {
    fill(0);
    textSize(20);
    text(source, pos.x+72, pos.y+40);
    textSize(30);
    text("N/Y", pos.x+11, pos.y+42);
  }
}
