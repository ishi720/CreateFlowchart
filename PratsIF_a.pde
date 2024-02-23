class PartsIF_a extends PartsIF {
  String source="マウスが近いならば";
  PVector v1,v2;

  PartsIF_a(PVector p, PVector s, color c) {
    super(p, s, c);
  }
  //処理
  void process() {
    v1=new PVector(mouseX,mouseY);
    v2=new PVector(f.pos.x+15,f.pos.y+15);
    
    if(v1.dist(v2)<=30){
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

