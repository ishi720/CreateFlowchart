class Parts {
  PVector pos;//位置
  PVector pSize;//サイズ
  color pColor;//カラー
  boolean isClick;//クリックの判定
  PVector posBase;//初期位置
  Parts next;//リンク先
  int flagA=0;
  int speed=10;

  int ts=30;

  //コンストラクタ
  Parts(PVector p, PVector s, color c) {
    pos=p;
    pSize=s;
    pColor=c;
    isClick=false;

    //初期位置を記憶
    posBase=new PVector();
    posBase.set(p);
  }

  //更新  
  void update() {
    this.showLink();
    this.show();
  }

  //クリック判定
  boolean clickCheck() {
    if (pos.x<mouseX && pos.y<mouseY && pos.x+pSize.x>mouseX && pos.y+pSize.y>mouseY) {
      return true;
    }
    return false;
  }

  //移動
  void move() {
    pos.x=mouseX-mouseX%30;
    pos.y=mouseY-mouseY%25;
  }
  void moveReset() {
    pos.set(posBase);
  }

  //表示
  void show() {
    stroke(0);
    line(pos.x+34, pos.y-30, pos.x+34, pos.y+90);
    noStroke();

    if (flagA==0) {
      fill(pColor);
      stroke(0, 0, 0);
      rect(pos.x, pos.y, pSize.x, pSize.y);
      noStroke();
    }
    else if (flagA!=0) {
      fill(255, 0, 0);
      stroke(0, 0, 0);
      rect(pos.x, pos.y, pSize.x, pSize.y);
      noStroke();
    }
  }

  //文字表示
  void textShow() {
  }

  //リンク先を設定
  void createLink(Parts n) {
    if (this!=n &&  keyCode==CONTROL) {
      this.next=n;
    }
  }
  //リンク先をリセット
  void createLinkReset() {
    this.next=null;
  }

  //線（リンクを張る）
  void showLink() {
    if (next!=null) {
      stroke(0);

      if (pos.y+34>=next.pos.y-90) {
        line(pos.x+34, pos.y+90, next.pos.x+34, next.pos.y-30);
      }
      else {
        line(pos.x+34, pos.y+90, pos.x+34, next.pos.y-30);
        line(pos.x+34, next.pos.y-30, next.pos.x+34, next.pos.y-30);
      }
      noStroke();
    }
  }

  void showLinkMouse() {
    if (keyCode==CONTROL) {
      stroke(0);
      line(pos.x+34, pos.y+90, mouseX, mouseY);
      noStroke();
    }
  }

  //処理
  void process() {
    flagA=1;
  }
  //処理していないパーツ
  void noProcess() {
    flagA=0;
  }
}

