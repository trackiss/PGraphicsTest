PImage[] img;
PGraphics[] grp;

final int numImg = 8;
final int sizeImg = 125;
final int numGraphic = 6;
final int speed[] = {1, 2, 3, 4, 5, 6};

int pointY[];
int pointY2[];
int nowImg[];
int nowImg2[];

void setup () {
  size(500, 500);
  
  img = new PImage[numImg];
  grp = new PGraphics[numGraphic];
  pointY = new int[numGraphic];
  pointY2 = new int[numGraphic];
  nowImg = new int[numGraphic];
  nowImg2 = new int[numGraphic];
  
  for (int i = 0; i < numImg; i++) {
    img[i] = loadImage(str(i + 1) + ".png");
  }
  
  for (int i = 0; i < numGraphic; i++) {
    grp[i]     = createGraphics(sizeImg, sizeImg);
    pointY[i]  = -sizeImg;
    pointY2[i] = pointY[i] - sizeImg;
    nowImg[i]  = 0;
    nowImg2[i] = nowImg[0] + 1;
  }
}

void draw() {
  for (int i = 0; i < numGraphic; i++) {
    grp[i].beginDraw();
    grp[i].background(255);
    grp[i].noStroke();
    
    if (pointY[i] > sizeImg) {
      if (nowImg[i] == numImg - 2)
        nowImg[i] = 0;
      else
        nowImg[i] += 2;
        
      pointY[i] = -sizeImg;
    } else {
      pointY[i] += speed[i];
    }
    
    if (pointY2[i] > sizeImg) {
      if (nowImg2[i] == numImg - 1)
        nowImg2[i] = 1;
      else
        nowImg2[i] += 2;
        
      pointY2[i] = -sizeImg;
    } else {
      pointY2[i] += speed[i];
    }
    
    grp[i].image(img[nowImg[i]], 0, pointY[i]);
    grp[i].image(img[nowImg2[i]], 0, pointY2[i]);
    
    grp[i].endDraw();
  }
  
  image(grp[0], 10, 10);
  image(grp[1], sizeImg + 20, 10);
  image(grp[2], sizeImg * 2 + 30, 10);
  image(grp[3], 10, sizeImg + 20);
  image(grp[4], sizeImg + 20, sizeImg + 20);
  image(grp[5], sizeImg * 2 + 30, sizeImg + 20);
}
