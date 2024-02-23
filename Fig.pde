//PImage Fimg;
PShape Fimg;
class Fig {
  int fr;
  int fg;
  int fb;
  int froll;
  PVector pos;//位置
  PVector pSize;//サイズ
  color pColor;
  PVector figPosBase;//初期位置
  PVector figSizeBase;//初期位置
  int figRollBase;//初期位置

  Fig(PVector p, PVector s, color c) {
    pos=p;
    pSize=s;  
    pColor=c;

    Fimg=loadShape("Fimg.svg");
    //Fimg=loadImage("1a.png");

    //初期位置を記憶
    figPosBase=new PVector();
    figPosBase.set(p);
    figSizeBase=new PVector();
    figSizeBase.set(s);
    figRollBase=froll;
  }

  void update() {
    show();
  }

  void show() {
    pushMatrix();
    translate(pos.x, pos.y);
    tint(fr, fg, fb);
    rotate(radians(froll));
    shape(Fimg, -pSize.x/2, -pSize.y/2, pSize.x, pSize.y);
    popMatrix();
  }

  void copy(Fig fx) {
    this.fr=fx.fr;
    this.fg=fx.fg;
    this.fb=fx.fb;
    this.froll=fx.froll;
    this.pos.set(fx.pos);
    this.pSize.set(fx.pSize);
    //this.pColor=fx.pColor;
  }

  //位置のリセット
  void moveReset() {
    pos.set(figPosBase);
    pSize.set(figSizeBase);
    froll=figRollBase;
  }
}
