PFont font;
ArrayList<Parts> x=new ArrayList<Parts>();//partsのオブジェクト
Fig f;//裏表示
Fig fshow;//表示
Parts temp;
int selection=-1;//クリックしたパーツ番号
boolean isMove=false;
boolean isLink=false;
int StratButton=0;
int X=10, Y=10;//実行ボタン位置
int Xp=X, Yp=Y+100;
int Xm=X+50, Ym=Y+100;
int XX=10, YY=145;//停止ボタン
int XXX=10, YYY=255;//ステップ実行ボタン
int XXXX=10, YYYY=365;//画像リセットボタン
int XXXXX=10, YYYYY=475;//パーツリセット
int timerspeed=250;
int Q=80, W=200, E=80, R=80, T=80, Qp=80, Qm=80;//ボタン透明度
int timer=0;//タイマー
boolean mcross=false;//マウスポインタ

void setup() {
  size(900, 800);

  f=new Fig(new PVector(300, 300), new PVector(50, 50), color(255, 255, 255));
  fshow=new Fig(new PVector(300, 300), new PVector(50, 50), color(255, 255, 255));

  font=createFont("MS-Gothic", 24, true);
  textFont(font);

  //partsのオブジェクト作成
  x.add(new PartsStart(new PVector(150, 500), new PVector(68, 51), color(255, 0, 0)));//開始
  x.add(new PartsShow(new PVector(270, 500), new PVector(68, 51), color(0, 255, 255)));//表示
  x.add(new PartsR(new PVector(390, 500), new PVector(68, 51), color(255, 255, 0)));//右へ
  x.add(new PartsL(new PVector(510, 500), new PVector(68, 51), color(255, 255, 0)));//左へ
  x.add(new PartsIFx(new PVector(630, 500), new PVector(68, 51), color(0, 255, 0)));//マウスが右側なら
  x.add(new PartsRotate(new PVector(150, 650), new PVector(68, 51), color(255, 255, 0)));//回転

  x.add(new PartsShow(new PVector(270, 650), new PVector(68, 51), color(0, 255, 255)));//表示
  x.add(new PartsU(new PVector(390, 650), new PVector(68, 51), color(255, 255, 0)));//上へ
  x.add(new PartsD(new PVector(510, 650), new PVector(68, 51), color(255, 255, 0)));//下へ
  x.add(new PartsIFy(new PVector(630, 600), new PVector(68, 51), color(0, 255, 0)));//マウスが下側なら
  x.add(new PartsIF_a(new PVector(630, 700), new PVector(68, 51), color(0, 255, 0)));//マウスが近いなら
  x.add(new PartsBig(new PVector(390, 350), new PVector(68, 51), color(255, 255, 0)));//拡大
  x.add(new PartsSmall(new PVector(510, 350), new PVector(68, 51), color(255, 255, 0)));//縮小
  x.add(new PartsSP(new PVector(630, 350), new PVector(68, 51), color(255,255,255)));//スペシャル
  temp=x.get(0);
}

void draw() {

  background(200, 255, 255, 200);
  strokeWeight(3);

  fshow.show();

  stroke(0, 0, 0);
  fill(255, 0, 0, Q);
  rect(X, Y, 100, 100);//実行ボタン
  fill(255, 0, 0, W);
  rect(XX, YY, 100, 100);//停止ポタン
  fill(255, 0, 0, E);
  rect(XXX, YYY, 100, 100);//
  fill(255, 0, 0, R);
  rect(XXXX, YYYY, 100, 100);
  fill(255, 0, 0, T);
  rect(XXXXX, YYYYY, 100, 100);

  fill(255, 120, 120, Qp);
  rect(Xp, Yp, 50, 25);
  fill(255, 120, 120, Qm);
  rect(Xm, Ym, 50, 25);
  noStroke();

  textSize(20);
  fill(0);
  text("実行", X+30, Y+55);
  text("停止", XX+30, YY+55);
  text("ステップ\n (Enter)", XXX+10, YYY+45);
  text("   画像\nリセット", XXXX+10, YYYY+45);
  text("  パーツ\nリセット", XXXXX+10, YYYYY+45);
  text("－", X+15, Y+120);
  text("＋", X+65, Y+120);

  //パーツの表示
  for (int i=0;i<x.size();i++) {
    x.get(i).update();
    x.get(i).textShow();
  }
  if (isLink) {
    x.get(selection).showLinkMouse();
  }


  if (StratButton==1) { 
    if (millis()-timer>timerspeed) {
      timer=millis();
      if (temp!=null) {
        temp.noProcess();
        temp=temp.next;
        if (temp==null) {
          temp=x.get(0);
        }
        else {
          temp.process();
        }
      }
    }
  }
  for (int i=0;i<x.size();i++) {
    if (x.get(i).clickCheck()) {
      mcross=true;
    }
  }
  if (mcross==true) {
    cursor(CROSS);
    mcross=false;
  }
  else {
    cursor(HAND);
  }
}
//クリックしたときの処理
void mousePressed() {
  //パーツを掴んでいるフラグを立てる
  for (int i=0;i<x.size();i++) {
    if (mouseButton != LEFT) {
      return;
    }
    if (x.get(i).clickCheck()) {
      selection=i;
    }
  }
  if (selection!=-1 && keyPressed == false) {
    isMove=true;//ムーブモード
  }
  else if (selection!=-1) {
    isLink=true;//リンクモード
  }
  else if (selection!=-1) {
    isLink=true;//リンクモード
  }
  else if (selection!=-1) {
    isLink=true;//リンクモード
  }

  if (X<mouseX && Y<mouseY && X+100>mouseX && Y+100>mouseY && mousePressed) {
    StratButton=1;
    Q=200;
    W=80;
  }
  if (XX<mouseX && YY<mouseY && XX+100>mouseX && YY+100>mouseY && mousePressed) {
    StratButton=0;
    Q=80;
    W=200;
  }
  if (XXX<mouseX && YYY<mouseY && XXX+100>mouseX && YYY+100>mouseY && mousePressed) {

    if (temp!=null) {
      temp.noProcess();
      temp=temp.next;
      if (temp==null) {
        temp=x.get(0);
      }
      else {
        temp.process();
      }
    }
    E=200;
  }
  if (XXXX<mouseX && YYYY<mouseY && XXXX+100>mouseX && YYYY+100>mouseY && mousePressed) {
    fshow.moveReset();
    f.moveReset();
    R=200;
  }
  if (XXXXX<mouseX && YYYYY<mouseY && XXXXX+100>mouseX && YYYYY+100>mouseY && mousePressed) {
    for (int i=0;i<x.size();i++) {
      x.get(i).createLinkReset();
      x.get(i).moveReset();
    }
    T=200;
  }


  if (Xp<mouseX && Yp<mouseY && Xp+50>mouseX && Yp+25>mouseY && mousePressed && StratButton==1) {
    timerspeed+=50;
    Qp=255;
  }
  if (Xm<mouseX && Ym<mouseY && Xm+50>mouseX && Ym+25>mouseY && mousePressed && StratButton==1) {
    timerspeed-=50;
    Qm=25;
  }
}

//ドラックしたときの処理
void mouseDragged() {
  //移動する

  if (isMove) {
    x.get(selection).move();
  }
}

//リリースしたときの処理
void mouseReleased() {
  for (int i=0;i<x.size();i++) {
    if (isLink  && x.get(i).clickCheck()) {
      x.get(selection).createLink(x.get(i));
    }
  }
  //パーツを掴んでいるリセット
  selection=-1;
  isMove=false;
  isLink=false;
  E=80;
  R=80;
  T=80;
  Qp=80;
  Qm=80;
}

void keyPressed() {
  if (key == ENTER ) {
    if (temp!=null) {
      temp.noProcess();
      temp=temp.next;
      if (temp==null) {
        temp=x.get(0);
      }
      else {
        temp.process();
      }
    }
  }
}

