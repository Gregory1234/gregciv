import java.awt.*;


int clickDelay = 20;

void setup() {
  loadImages();
  size(800, 800);
  textSize(32);
  initMap();
}
void draw() {
  if (clickDelay>0) {
    clickDelay--;
  }
  background(255);
  fill(0);
  switch(winnum) {
  case 0:
    drawMenu();
    break;
  case 1:
    drawGame();
    break;
  case 2:
    drawCreatingMenu();
    break;
  }
}

void mouseClicked(MouseEvent e) {
  if (clickDelay == 0) {
    clickDelay = 1;
    if (winnum==0) {
      if (newGameButton.check()) {
        winnum=2;
      } else if (loadGameButton.check()) {
        loadGame("Auto");
      }
    } else if (winnum==1) {
      if (mouseY<600&&mouseY>0&&mouseX<800&&mouseX>0) {
        selX=mouseX/50;
        selY=mouseY/50;
      }
      if (mouseY>600) {
        if (playerMoves>0) {
          clickActions();
        }
        if (mouseX>670&&mouseX<800) {
          nextTurn();
        }
      }
    } else if (winnum==2) {
      if (playButton.check()) {
        initMap();
        winnum=1;
      }
      playersNumber=playerNumberSel.update();
    }
  }
  if (e.getCount()==2) {
    mouseDouble();
  }
}
void mouseDragged() {
  if (winnum==1) {
    if (mouseY<600&&mouseY>0&&mouseX<800&&mouseX>0) {
      selX=mouseX/50;
      selY=mouseY/50;
    }
  }
}
void mouseDouble() {
  if (winnum==1&&playerMoves>0&&mouseY<600) {
    attackSelectedAction();
  }
}