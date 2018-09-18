/********* VARIABLES GLOBALES *********/
// 0: Initial Screen
// 1: Game Story
// 2: Character selection
// 3: Game Screen
// 4: Game-over Screen

import processing.sound.*;
int gameScreen;
int turn;
int hp1, hp2;
PFont font;
PFont font2;
PFont font3;
SoundFile file;


class personaje {
  String name;
  int hp;
  int attack;
  int defense;

  personaje (String name_, int hp_, int attack_, int defense_) {
    name = name_;
    hp = hp_;
    attack = attack_;
    defense = defense_;
  }
}


personaje Naruto1;
personaje Sakura1;
personaje Sasuke1;
personaje Rock_Lee1;
personaje Gaara1;
personaje Takeshi1;

personaje Naruto2;
personaje Sakura2;
personaje Sasuke2;
personaje Rock_Lee2;
personaje Gaara2;
personaje Takeshi2;

// Player 1, 2.
personaje player1;
personaje player2;

//Turno para seleccionar.
int ts = 0;

boolean player1Selection = false;
boolean player2Selection = false;




/********* SETUP BLOCK *********/

void setup() {
  size(800, 600);

  file = new SoundFile(this, "naruto-main-theme-8-bit_R.wav");
  file.play();
  file.loop();

  //personajes p1
  Naruto1 = new personaje("Naruto", 200, 23, 23);
  Sakura1 = new personaje ("Sakura", 200, 25, 7);
  Sasuke1 = new personaje ("Sasuke", 200, 17, 12);
  Rock_Lee1 = new personaje("Rock Lee", 200, 20, 20);
  Gaara1 = new personaje("Gaara", 200, 24, 19);
  Takeshi1 = new personaje("Takeshi", 200, 20, 22);

  //personajes p2
  Naruto2 = new personaje("Naruto", 200, 23, 23);
  Sakura2 = new personaje ("Sakura", 200, 25, 7);
  Sasuke2 = new personaje ("Sasuke", 200, 17, 12);
  Rock_Lee2 = new personaje("Rock Lee", 200, 20, 20);
  Gaara2 = new personaje("Gaara", 200, 24, 19);
  Takeshi2 = new personaje("Takeshi", 200, 20, 22);
}


/********* DRAW BLOCK *********/

void draw() {
  // Display the contents of the current screen

  switch (gameScreen) {
  case 0:
    initScreen();
    break;
  case 1:
    stScreen();
    break;
  case 2:
    charScreen();
    break;
  case 3:
    figScreen();
    break;
  case 4:
    vicScreen();
    break;
  }
}


/********* SCREEN CONTENTS *********/

void initScreen() {
  // Pantalla inicial
  background(#F78F1E);
  fill(255);
  font = createFont("njnaruto.ttf", 150);
  textFont(font, 100);
  textAlign(CENTER, CENTER);
  text("NARUTO", 400, 200);
  font2 = createFont("jackeyfont", 100);
  textFont(font2, 50);
  textAlign(CENTER, CENTER);
  text("中忍試験", 400, 300);
  text("Chunin Shiken", 400, 350);
  textSize(40);
  text("Click para empezar", 400, 500);
  if (mousePressed) {
    gameScreen = 1;
  }
}

void stScreen() {
  // Pantalla de historia.
  background(#F78F1E);
  fill(255);
  font = createFont("njnaruto.ttf", 150);
  textFont(font, 50);
  textAlign(CENTER, CENTER);
  text("Examenes Chunin", 400, 100);
  font2 = createFont("jackeyfont", 15);
  textFont(font2, 25);
  text("中忍試験", 400, 150);
  textAlign(CENTER, CENTER);
  text("Despues de completar tu entrenamiento basico, debes enfrentarte entre ninjas de otras aldeas para lograr el grado de Chunin", 100, 130, 600, 300);
  text("En este combate no hay reglas, los participantes deberan luchar hasta que su adversario muera, renuncie o admita su derrota y decida retirarse.", 100, 250, 600, 300);
  text("PRESIONA CUALQUIER TECLA PARA CONTINUAR", 400, 550);
  if (keyPressed) {
    gameScreen = 2;
    file.stop();
    file = new SoundFile(this, "naruto-ost-2-afternoon-of-konoha_R.mp3");
    file.play();
    file.stop();
    file.loop();
  }
}

void charScreen() {
  //selección de personajes
  //rectnaruto
  background(#F5E8D0);
  noStroke();
  fill(#817F7D);
  rect(20, 45, 150, 200);
  noFill();
  stroke(#F78F1E);
  strokeWeight(5);
  rect(20, 45, 250, 200);
  //rectSakura
  noStroke();
  fill(#817F7D);
  rect(280, 45, 150, 200);
  noFill();
  stroke(#F78F1E);
  strokeWeight(5);
  rect(280, 45, 250, 200);
  //rectSasuke
  noStroke();
  fill(#817F7D);
  rect(540, 45, 150, 200);
  noFill();
  stroke(#F78F1E);
  strokeWeight(5);
  rect(540, 45, 250, 200);
  //rectRocklee
  noStroke();
  fill(#817F7D);
  rect(20, 325, 150, 200);
  noFill();
  stroke(#F78F1E);
  strokeWeight(5);
  rect(20, 325, 250, 200);
  //RECTGAARA
  noStroke();
  fill(#817F7D);
  rect(280, 325, 150, 200);
  noFill();
  stroke(#F78F1E);
  strokeWeight(5);
  rect(280, 325, 250, 200);
  //RECTTAKESHI
  noStroke();
  fill(#817F7D);
  rect(540, 325, 150, 200);
  noFill();
  stroke(#F78F1E);
  strokeWeight(5);
  rect(540, 325, 250, 200);

  //INSTRUCCIONES
  pushMatrix();
  textSize(30);
  textFont(font2, 25);
  fill(0);
  text("Selecciona a tu personaje haciendo click sobre el", 80, 290);
  popMatrix();


  //ATRIBUTOS
  //NARUTO
  textSize(20);
  textFont(font2, 20);
  fill(0);
  textAlign(LEFT);
  text("HP:  200", 180, 100);
  text("ATTK:  23", 180, 120);
  text("DEF:  23", 180, 140);
  text("NARUTO", 180, 230);

  //SAKURA
  textSize(20);
  fill(0);
  textAlign(LEFT);
  text("HP:  200", 440, 100);
  text("ATTK:  25", 440, 120);
  text("DEF:  7", 440, 140);
  text("SAKURA", 440, 230);

  //SASUKE
  textSize(20);
  fill(0);
  textAlign(LEFT);
  text("HP:  200", 700, 100);
  text("ATTK:  17", 700, 120);
  text("DEF:  12", 700, 140);
  text("SASUKE", 700, 230);

  //ROCKLEE
  textSize(20);
  fill(0);
  textAlign(LEFT);
  text("HP:  200", 180, 380);
  text("ATTK:  18", 180, 400);
  text("DEF:  18", 180, 420);
  text("ROCK LEE", 180, 510);

  //GAARA
  textSize(20);
  fill(0);
  textAlign(LEFT);
  text("HP:  200", 440, 380);
  text("ATA:  24", 440, 400);
  text("DEF:  19", 440, 420);
  text("GAARA", 440, 510);

  //TAKESHI
  textSize(20);
  fill(0);
  textAlign(LEFT);
  text("HP:  200", 700, 380);
  text("ATA:  20", 700, 400);
  text("DEF:  22", 700, 420);
  text("TAKESHI", 700, 510);


  pushMatrix();
  translate(0, 40);
  scale(0.5);
  Naruto();
  popMatrix();

  pushMatrix();
  translate(260, 40);
  scale(0.5);
  Sakura();
  popMatrix();

  pushMatrix();
  translate(510, 40);
  scale(0.5);
  Sasuke();
  popMatrix();

  pushMatrix();
  translate(0, 320);
  scale(0.5);
  Rock_Lee();
  popMatrix();

  pushMatrix();
  translate(260, 320);
  scale(0.5);
  Gaara();
  popMatrix();

  pushMatrix();
  translate(510, 320);
  scale(0.5);
  Takeshi();
  popMatrix();

  if (player1Selection && player2Selection) {

    gameScreen = 3;
    turn =+1;
    file.stop();
    file = new SoundFile(this, "naruto-the-raising-fighting-spirit-8-bit-nes-remix_R.mp3");
    file.play();
    file.stop();
    file.loop();
  }
}


void figScreen() {
  // Código de pantalla de lucha. 
  background(#404040);
  //LUNA y estrellas
  fill(#F3FC8C);
  noStroke();
  rect(100, 105, 10, 5);
  rect(90, 110, 30, 10);
  rect(80, 120, 50, 10);
  rect(70, 130, 70, 20);
  rect(80, 150, 50, 10);
  rect(90, 160, 30, 10);
  rect(100, 170, 10, 5);
  rect(300, 185, 5, 5);
  rect(100, 235, 5, 5);
  rect(340, 367, 5, 5);
  rect(500, 250, 5, 5);
  rect(680, 125, 5, 5);
  rect(367, 54, 5, 5);
  rect(219, 133, 5, 5);
  rect(482, 188, 5, 5);
  rect(700, 44, 5, 5);
  //maschiquitas
  rect(350, 120, 2, 2);
  rect(200, 320, 2, 2);
  rect(30, 40, 2, 2);
  rect(189, 120, 2, 2);
  rect(700, 200, 2, 2);
  fill(#4B4545);
  rect(100, 145, 7, 7);
  rect(110, 120, 5, 5);
  //NUBE
  fill(#C1C1BB, 80);
  noStroke();
  rect(250, 210, 10, 5);
  rect(230, 215, 30, 10);
  rect(220, 225, 50, 10);
  rect(200, 235, 90, 10);
  rect(180, 245, 150, 10);
  rect(230, 255, 70, 10);
  //NUBE2
  rect(550, 110, 10, 5);
  rect(530, 115, 30, 10);
  rect(520, 125, 50, 10);
  rect(500, 135, 90, 10);
  rect(480, 145, 150, 10);
  //degradadocielo
  fill(#FFB4E1, 70);
  noStroke();
  rect(0, 450, 800, 50);
  fill(#F0AED6, 70);
  rect(0, 400, 800, 50);
  fill(#E3A3C9, 70);
  rect(0, 350, 800, 50);
  fill(#CB94B5, 70);
  rect(0, 290, 800, 60);
  fill(#9E94CB, 50);
  rect(0, 230, 800, 60);
  fill(#AF94CB, 50);
  rect(0, 170, 800, 60);
  fill(#564A6A, 50);
  rect(0, 90, 800, 80);
  fill(#322E39, 50);
  rect(0, 0, 800, 90);
  //piso
  fill(#4D4C4D);
  noStroke();
  rect(0, 500, 800, 100);
  rect(0, 480, 50, 50);
  rect(0, 470, 25, 25);
  rect(300, 490, 30, 10);
  //PARED
  fill(#373539);
  noStroke();
  rect(300, 430, 100, 70);
  rect(400, 430, 60, 40);
  rect(400, 450, 80, 50);
  rect(540, 450, 80, 50);
  rect(460, 430, 80, 70);
  rect(300, 400, 50, 40);
  rect(300, 390, 25, 110);
  rect(350, 420, 60, 20);
  rect(780, 180, 20, 20);
  rect(600, 200, 300, 300);
  rect(600, 200, 30, 300);
  //arco
  rect(630, 330, 30, 170);
  rect(630, 300, 30, 30);
  rect(645, 270, 30, 30);
  rect(660, 240, 30, 30);
  rect(680, 220, 90, 20);
  rect(760, 240, 30, 30);
  rect(775, 270, 30, 30);
  rect(790, 300, 30, 30);
  rect(500, 400, 100, 50);
  rect(580, 300, 20, 30);
  rect(560, 330, 40, 30);
  rect(580, 360, 20, 20);
  rect(540, 380, 60, 20);
  //puerta cielo
  noStroke();
  fill(#2E2A31);
  rect(691, 241, 69, 30);
  rect(676, 271, 99, 30);
  rect(661, 301, 149, 200);
  //Detalles piedra SOMBRA
  fill(#5F5E5F, 80);
  rect(310, 390, 10, 110);
  rect(328, 460, 70, 20);
  rect(420, 450, 20, 50);
  rect(540, 450, 40, 40); 
  rect(460, 430, 60, 50);
  rect(325, 400, 20, 40);
  rect(350, 425, 60, 5);
  rect(780, 180, 10, 10);
  rect(630, 200, 30, 40);
  rect(600, 200, 20, 300);
  rect(630, 330, 20, 170);
  rect(630, 300, 20, 20);
  rect(645, 270, 20, 20);
  rect(660, 240, 20, 20);
  rect(680, 220, 70, 15);
  rect(760, 240, 20, 20);
  rect(775, 270, 20, 20);
  rect(540, 380, 60, 15);
  rect(580, 360, 20, 20);
  rect(560, 330, 20, 20);
  rect(580, 300, 20, 20);
  rect(500, 400, 60, 20);
  //detalles piedra LUZ
  fill(#F3FC8C, 50);
  rect(300, 390, 10, 110);
  rect(328, 480, 40, 20);
  rect(400, 450, 20, 30);
  rect(540, 450, 20, 20);  
  rect(460, 430, 20, 20);
  rect(325, 400, 20, 20);
  rect(350, 420, 60, 10);
  rect(780, 180, 5, 5);
  rect(630, 200, 100, 10);
  rect(600, 200, 10, 80);
  rect(630, 330, 10, 100);
  rect(630, 300, 10, 10);
  rect(645, 270, 10, 10);
  rect(660, 240, 10, 10);
  rect(680, 220, 10, 10);
  rect(760, 240, 10, 10);
  rect(775, 270, 10, 10);
  rect(540, 380, 40, 10);
  rect(580, 360, 10, 10);
  rect(560, 330, 10, 10);
  rect(580, 300, 10, 10);
  rect(500, 400, 20, 20);
  println(player1.name, hp1);
  println(player2.name, hp2);

  pushMatrix();
  textSize(20);
  text("TURNO:"+turn, 90, 20);
  popMatrix();

  //Barra de vida Player1.
  pushMatrix();
  translate(230, 50);
  noStroke();
  rectMode(CORNER);
  if (hp1<50) {
    fill(255, 0, 0);
  } else if (hp1<=100) {
    fill(255, 200, 0);
  } else {
    fill(0, 255, 0);
  }
  rect(0, 0, hp1*-1, 30);
  popMatrix();

  font = createFont("njnaruto.ttf", 150);
  textFont(font, 100);
  fill(255, 0, 0);
  textAlign(CENTER, CENTER);
  text("VS", 400, 70);

  //Barra de vida Player2.
  pushMatrix();
  translate(580, 50);
  noStroke();
  rectMode(CORNER);
  if (hp2<50) {
    fill(255, 0, 0);
  } else if (hp2<=100) {
    fill(255, 200, 0);
  } else {
    fill(0, 255, 0);
  }
  rect(0, 0, hp2, 30);
  popMatrix();

  //Instrucciones
  font2 = createFont("jackeyfont", 15);
  textFont(font2, 15);
  fill(255);
  text("Jugador 1 presiona 'Q' para atacar", 200, 550);
  text("Jugador 2 presiona 'P' para atacar", 600, 550);



  //Visualización de personaje.

  //Jugador1

  pushMatrix();
  translate(25, 300);
  scale(0.5);
  if (player1 == Naruto1) {

    Naruto();
  } else if (player1 == Sakura1) {

    Sakura();
  } else if (player1 == Sasuke1) {

    Sasuke();
  } else if (player1 == Rock_Lee1) {

    Rock_Lee();
  } else if (player1 == Gaara1) {

    Gaara();
  } else if (player1 == Takeshi1) {
    Takeshi();
  }
  popMatrix();

  //Jugador2

  pushMatrix();
  translate(600, 300);
  scale(0.5);
  if (player2 == Naruto2) {

    Naruto();
  } else if (player2 == Sakura2) {

    Sakura();
  } else if (player2 == Sasuke2) {

    Sasuke();
  } else if (player2 == Rock_Lee2) {

    Rock_Lee();
  } else if (player2 == Gaara2) {

    Gaara();
  } else if (player2 == Takeshi2) {
    Takeshi();
  }
  popMatrix();

  //BATALLA

  switch (turn) {
  case 1:
    keyPressed();
    if ((key == 'Q') || (key == 'q')) {
      hp2 = hp2 - (player1.attack - (player2.defense/2));
      println(player1.name, hp1);
      turn = 2;
    }
    break;

  case 2:
    keyPressed();
    if ((key == 'P') || (key == 'p')) {
      hp1 = hp1 - (player2.attack - (player1.defense/2));
      println(player1.name, hp1);
      turn = 1;
    }
    break;
  }
  if (hp1 <= 0 || hp2 <=0) {
    gameScreen = 4;
    file.stop();
    file = new SoundFile(this, "naruto-i-said-im-naruto-8-bits_R.mp3");
    file.play();
    file.stop();
    file.loop();
  }
}


void vicScreen() {
  // Código de pantalla de victoria.
  background(#F78F1E);

  textAlign(CENTER, CENTER);
  fill(255);

  if (hp1 > 0) {
    font = createFont("njnaruto.ttf", 100);
    textFont(font, 50);
    fill(255);
    textAlign(CENTER, CENTER);
    text("La victoria es de " + player1.name, 400, 300);
  } else if (hp2 > 0) {
    font = createFont("njnaruto.ttf", 100);
    textFont(font, 50);
    fill(255);
    textAlign(CENTER, CENTER);
    text("La victoria es de " + player2.name, 400, 300);
  }

  font2 = createFont("jackeyfont.ttf", 50);
  textFont(font2, 20);
  text("Haz click para seleccionar personaje", 400, 450);
  textSize(50);
  text("おめでとう！あなたは勝った！",400,100);
  textSize(30);
  text("d(￣◇￣)b",400,200);
  if (mousePressed) {
    gameScreen = 2;
    player1Selection = false;
    player2Selection = false;
    ts = 0;
    turn = 0;
  }
}



/********* OTHER FUNCTIONS *********/
void mousePressed () {

  if (gameScreen == 2) {

    if ((mouseX> 0) && (mouseX< 267) && (mouseY> 0) && (mouseY< 300)) {
      if (ts == 0) {
        player1 = Naruto1;
        hp1 = player1.hp;
        player1Selection = true;
        ts = 1;
        println("Player 1 elige a Naruto");
      } else if (ts == 1) {
        player2 = Naruto2;
        hp2 = player2.hp;
        player2Selection = true;
        println("Player 2 elige a Naruto");
      }
    }

    if ( (mouseX> 267) && (mouseX< 533) && (mouseY> 0) && (mouseY< 300)) {
      if (ts == 0) {
        player1 = Sakura1;
        hp1 = player1.hp;
        player1Selection = true;
        ts = 1;
        println("Player 1 elige a Sakura");
      } else if (ts == 1) {
        player2 = Sakura2;
        hp2 = player2.hp;
        player2Selection = true;
        println("Player 2 elige a Sakura");
      }
    }

    if ( (mouseX> 533) && (mouseX< 800) && (mouseY> 0) && (mouseY< 300)) {
      if (ts == 0) {
        player1 = Sasuke1;
        hp1 = player1.hp;
        player1Selection = true;
        ts = 1;
        println("Player 1 elige a Sasuke");
      } else if (ts == 1) {
        player2 = Sasuke2;
        hp2 = player2.hp;
        player2Selection = true;
        println("Player 2 elige a Sasuke");
      }
    }

    if ( (mouseX> 0) && (mouseX< 267) && (mouseY> 300) && (mouseY< 600)) {
      if (ts == 0) {
        player1 = Rock_Lee1;
        hp1 = player1.hp;
        player1Selection = true;
        ts = 1;
        println("Player 1 elige a Rock Lee");
      } else if (ts == 1) {
        player2 = Rock_Lee2;
        hp2 = player2.hp;
        player2Selection = true;
        println("Player 2 elige a Rock Lee");
      }
    }

    if ( (mouseX> 267) && (mouseX< 533) && (mouseY> 300) && (mouseY< 600)) {
      if (ts == 0) {
        player1 = Gaara1;
        hp1 = player1.hp;
        player1Selection = true;
        ts = 1;
        println("Player 1 elige a Gaara");
      } else if (ts == 1) {
        player2 = Gaara2;
        hp2 = player2.hp;
        player2Selection = true;
        println("Player 2 elige a Gaara");
      }
    }

    if ( (mouseX> 533) && (mouseX< 800) && (mouseY> 300) && (mouseY< 600)) {
      if (ts == 0) {
        player1 = Takeshi1;
        hp1 = player1.hp;
        player1Selection = true;
        ts = 1;
        println("Player 1 elige a Takeshi");
      } else if (ts == 1) {
        player2 = Takeshi2;
        hp2 = player2.hp;
        player2Selection = true;
        println("Player 2 elige a Takeshi");
      }
    }
  }
}




// This method sets the necessary variables to start the game  
void startGame() {
  gameScreen=1;
}



///codigo de personajes ///
void Naruto() {
  pushMatrix();
  fill(#C8C90E);
  noStroke();
  //cabello Naruto//
  rect(73, 60, 15, 30);
  rect(103, 40, 15, 30);
  rect(133, 20, 15, 45);
  rect(178, 20, 15, 45);
  rect(223, 20, 15, 45);
  rect(253, 40, 15, 30);
  rect(283, 60, 15, 30);
  rect(73, 70, 225, 30);
  rect(103, 50, 160, 20);
  rect(143, 40, 90, 10);
  rect(88, 100, 15, 30);
  rect(73, 115, 15, 15);
  rect(268, 100, 15, 30);
  rect(283, 115, 15, 15);
  //SOMBRAS CABELLO
  fill(#86571C, 40);
  rect(73, 70, 30, 15);
  rect(103, 50, 30, 15);
  rect(133, 40, 30, 15);
  rect(268, 70, 30, 15);
  rect(238, 50, 30, 15);
  rect(208, 40, 30, 15);
  //Bandana//
  fill(#1E2448);
  rect(88, 130, 15, 30);
  rect(103, 100, 15, 60);
  fill(#344089);
  rect(118, 100, 15, 60);
  fill(#AFAFAF);
  rect(133, 100, 15, 60);
  fill(#757576);
  rect(148, 100, 80, 60);
  fill(#AFAFAF);
  rect(228, 100, 15, 60);
  fill(#344089);
  rect(243, 100, 15, 60);
  fill(#1E2448);
  rect(258, 100, 15, 60);
  rect(273, 130, 15, 30);
  //SIMBOLO HOJA
  fill(#4B4B4B);
  rect(183, 100, 15, 15);
  rect(168, 115, 15, 30);
  rect(183, 130, 15, 15);
  rect(198, 115, 15, 15);
  //luces bandana//
  fill(#AAA8A8, 80);
  rect(148, 100, 15, 15);
  rect(148, 145, 15, 15);
  rect(215, 100, 15, 15);
  rect(215, 145, 15, 15);
  //TIRAS BANDANA
  fill(#1E2448);
  rect(288, 160, 15, 30);
  rect(288, 190, 45, 15);
  rect(273, 220, 30, 15);
  rect(303, 235, 15, 15);
  //CARA
  fill(#FFD0B9);
  rect(88, 160, 200, 60);
  rect(103, 220, 170, 15);
  rect(118, 235, 140, 15);
  //sombras cara
  fill(#A58B61, 60);
  rect(88, 160, 15, 60);
  rect(103, 220, 15, 15);
  rect(118, 235, 15, 15);
  rect(273, 160, 15, 60);
  rect(258, 220, 15, 15);
  rect(243, 235, 15, 15);
  //PELILLO//
  fill(#C8C90E);
  rect(88, 160, 15, 15);
  rect(273, 160, 15, 15);
  //Ojos//
  fill(#8FF5DC, 90);
  rect(118, 160, 45, 45);
  rect(208, 160, 45, 45);
  //brillo ojos//
  fill(255, 80);
  rect(118, 160, 15, 15);
  rect(208, 160, 15, 15);
  //pelilloabajo Y CUELLO//
  fill(#C8C90E);
  rect(138, 250, 15, 15);  
  fill(#344089);
  rect(153, 250, 15, 15);
  fill(255);
  rect(168, 250, 15, 15);
  fill(#D3A46B);
  rect(183, 250, 15, 15);
  fill(255);
  rect(198, 250, 15, 15);
  fill(#344089);
  rect(213, 250, 15, 15);
  fill(#C8C90E);
  rect(228, 250, 15, 15);
  fill(#344089);
  rect(138, 265, 15, 15);
  fill(#FF7524);
  rect(153, 265, 15, 15);
  fill(#344089);
  rect(168, 265, 15, 15);
  fill(#344089);
  rect(198, 265, 15, 15);
  fill(#FF7524);
  rect(213, 265, 15, 15);
  fill(#344089);
  rect(228, 265, 15, 15);
  fill(#B45016);
  rect(183, 265, 15, 45);
  fill(#FF7524);
  rect(213, 265, 15, 15);
  //TORSO//
  fill(#FF7524);
  rect(153, 280, 30, 30);
  rect(198, 280, 30, 30);
  //BRAZOS//
  //IZQ//
  fill(#FF7524);
  rect(123, 280, 15, 15);
  rect(108, 295, 15, 15);
  fill(#B45016);
  rect(138, 280, 15, 15);
  //DER//
  fill(#FF7524);
  rect(243, 280, 15, 15);
  rect(258, 295, 15, 15);
  fill(#B45016);
  rect(228, 280, 15, 15);
  //MANOS//
  //IZQ//
  fill(#FFD0B9);
  rect(108, 310, 30, 30);
  //DER
  rect(243, 310, 30, 30);
  //sombras manos
  fill(#A58B61, 80);
  rect(123, 310, 15, 15);
  rect(243, 310, 15, 15);
  //CINTURON//
  fill(#344089);
  rect(153, 310, 75, 15);
  fill(#FF7524);
  rect(153, 325, 75, 15);
  //PIERNAS//
  rect(168, 340, 15, 30);
  rect(198, 340, 15, 30);
  fill(#FFD0B9);
  rect(168, 355, 15, 15);
  rect(198, 355, 15, 15);
  //ZAPATOS//
  //izquierdo//
  fill(#FFD0B9);
  rect(123, 370, 15, 15);
  fill(#344089);
  rect(138, 370, 45, 15);
  fill(#1E2448);
  rect(123, 385, 60, 15);
  //derecho//
  fill(#FFD0B9);
  rect(243, 370, 15, 15);
  fill(#344089);
  rect(198, 370, 45, 15);
  fill(#1E2448);
  rect(198, 385, 60, 15);
  popMatrix();
}

void Sakura() {
  pushMatrix();
  noStroke();
  //cabello//
  fill(#EDA5B2);//grisclaro
  rect(103, 55, 170, 45);
  rect(133, 40, 40, 15);
  rect(203, 40, 40, 15);
  //TIRAS BANDANA
  fill(#1E2448);
  rect(288, 160, 15, 30);
  rect(288, 190, 45, 15);
  rect(273, 220, 30, 15);
  rect(303, 235, 15, 15);
  //CARA
  fill(#FFD0B9);
  rect(133, 99, 115, 75);
  rect(88, 160, 200, 60);
  rect(103, 220, 170, 15);
  rect(118, 235, 140, 15);
  //sombras cara
  fill(#A58B61, 60);
  rect(88, 160, 15, 60);
  rect(103, 220, 15, 15);
  rect(118, 235, 15, 15);
  rect(273, 160, 15, 60);
  rect(258, 220, 15, 15);
  rect(243, 235, 15, 15);
  //PELILLO//
  fill(#B2818A);//grismedio
  rect(273, 85, 15, 120);
  rect(88, 85, 15, 105);
  rect(88, 220, 15, 45);
  fill(#EDA5B2);//grisoscuro
  fill(#B2818A);//grismedio
  rect(273, 220, 15, 45);
  //Ojos//
  fill(#8FF5DC, 90);
  rect(118, 160, 45, 45);
  rect(213, 160, 45, 45);
  //brillo ojos//
  fill(255, 80);
  rect(118, 160, 15, 15);
  rect(213, 160, 15, 15);
  //pelilloabajo Y CUELLO//
  fill(#B2818A);//grisoscuro
  rect(118, 250, 45, 15);
  rect(118, 265, 19, 15);
  fill(#8B294B);
  rect(163, 250, 18, 15);
  fill(#FFD0B9);//roparosa
  rect(181, 250, 15, 15);
  fill(#A58B61, 60);//sombrapiel
  rect(181, 250, 15, 15);
  fill(#8B294B);
  rect(196, 250, 18, 15);
  fill(#B2818A);
  rect(213, 250, 45, 15);
  rect(243, 265, 15, 15);
  rect(103, 265, 15, 15);
  fill(#EDA5B2);//grisclaro
  rect(103, 85, 30, 75);
  rect(103, 160, 15, 120);
  fill(#EDA5B2);//grisclaro
  rect(243, 85, 30, 75);
  rect(258, 160, 15, 120);
  fill(#B2818A);//grisoscuro
  rect(133, 85, 45, 15);
  rect(148, 70, 15, 15);
  rect(198, 85, 45, 15);
  rect(213, 70, 15, 15);
  //TORSO//
  fill(#A5325A);//rosa
  rect(138, 265, 105, 15);
  rect(153, 280, 75, 20);
  fill(#8B294B);//rosafuerte
  rect(168, 300, 45, 15);
  //BRAZOS//
  //IZQ//
  fill(#FFD0B9);
  rect(123, 280, 15, 15);
  rect(108, 295, 15, 15);
  //DER//
  fill(#FFD0B9);
  rect(243, 280, 15, 15);
  rect(258, 295, 15, 15);
  //MANOS//
  //IZQ//
  fill(#FFD0B9);
  rect(108, 310, 30, 30);
  //DER
  rect(243, 310, 30, 30);
  //sombras manos
  fill(#A58B61, 80);
  rect(123, 310, 15, 15);
  rect(243, 310, 15, 15);
  //PIERNAS//
  fill(#A5325A);//rosa
  rect(168, 315, 45, 30);
  fill(#FFD0B9);
  rect(168, 345, 15, 15);
  rect(198, 345, 15, 15);
  fill(#344089);
  rect(168, 360, 15, 15);
  rect(198, 360, 15, 15);
  //ZAPATOS//
  //izquierdo//
  fill(#FFD0B9);
  rect(123, 370, 15, 15);
  fill(#344089);
  rect(138, 370, 45, 15);
  fill(#1E2448);
  rect(123, 385, 60, 15);
  //derecho//
  fill(#FFD0B9);
  rect(243, 370, 15, 15);
  fill(#344089);
  rect(198, 370, 45, 15);
  fill(#1E2448);
  rect(198, 385, 60, 15);
  //detalles torso y falda
  fill(255);
  rect(181, 265, 15, 35);
  rect(181, 320, 15, 15);
  popMatrix();
}

void Sasuke() {
  pushMatrix();
  noStroke();
  //cabello Sasuke//
  fill(#3E4255);//grisclaro
  rect(103, 55, 170, 45);
  rect(133, 40, 110, 15);
  rect(168, 25, 15, 15);
  rect(198, 25, 15, 15);
  rect(228, 25, 15, 15);
  fill(#252834);//grisoscuro
  rect(243, 40, 45, 15);
  rect(273, 25, 15, 60);
  rect(288, 55, 15, 15);
  rect(303, 40, 15, 30);
  rect(288, 70, 15, 75);
  rect(303, 90, 15, 15);  
  //Bandana//
  fill(#1E2448);
  rect(88, 130, 15, 30);
  rect(103, 100, 15, 60);
  fill(#344089);
  rect(118, 100, 15, 60);
  fill(#AFAFAF);
  rect(133, 100, 15, 60);
  fill(#757576);
  rect(148, 100, 80, 60);
  fill(#AFAFAF);
  rect(228, 100, 15, 60);
  fill(#344089);
  rect(243, 100, 15, 60);
  fill(#1E2448);
  rect(258, 100, 15, 60);
  rect(273, 130, 15, 30);
  //SIMBOLO HOJA
  fill(#4B4B4B);
  rect(183, 100, 15, 15);
  rect(168, 115, 15, 30);
  rect(183, 130, 15, 15);
  rect(198, 115, 15, 15);
  //luces bandana//
  fill(#AAA8A8, 80);
  rect(148, 100, 15, 15);
  rect(148, 145, 15, 15);
  rect(215, 100, 15, 15);
  rect(215, 145, 15, 15);
  //TIRAS BANDANA
  fill(#1E2448);
  rect(288, 160, 15, 30);
  rect(288, 190, 45, 15);
  rect(273, 220, 30, 15);
  rect(303, 235, 15, 15);
  //CARA
  fill(#FFD0B9);
  rect(88, 160, 200, 60);
  rect(103, 220, 170, 15);
  rect(118, 235, 140, 15);
  //sombras cara
  fill(#A58B61, 60);
  rect(88, 160, 15, 60);
  rect(103, 220, 15, 15);
  rect(118, 235, 15, 15);
  rect(273, 160, 15, 60);
  rect(258, 220, 15, 15);
  rect(243, 235, 15, 15);
  //PELILLO//
  fill(#313443);//grismedio
  rect(273, 85, 15, 120);
  rect(88, 85, 15, 105);
  rect(88, 220, 15, 45);
  fill(#252834);//grisoscuro
  rect(103, 235, 15, 15);
  rect(258, 235, 15, 15);
  fill(#313443);//grismedio
  rect(273, 220, 15, 45);
  //Ojos//
  fill(#8FF5DC, 90);
  rect(118, 160, 45, 45);
  rect(213, 160, 45, 45);
  //brillo ojos//
  fill(255, 80);
  rect(118, 160, 15, 15);
  rect(213, 160, 15, 15);
  //pelilloabajo Y CUELLO//
  fill(#252834);//grisoscuro
  rect(118, 250, 30, 15);
  fill(#252D4D);//cuello
  rect(148, 250, 80, 15);
  fill(#252834);//grisoscuro
  rect(228, 250, 30, 15);
  fill(#3E4255);//grisclaro
  rect(103, 85, 30, 75);
  rect(103, 160, 15, 30);
  fill(#3E4255);//grisclaro
  rect(243, 85, 30, 75);
  rect(258, 160, 15, 30);
  fill(#252834);//grisoscuro
  rect(133, 85, 45, 15);
  rect(148, 70, 15, 15);
  rect(198, 85, 45, 15);
  rect(213, 70, 15, 15);
  //TORSO//
  fill(#30395D);
  rect(138, 265, 105, 15);
  rect(153, 280, 75, 40);
  //BRAZOS//
  //IZQ//
  fill(#FFD0B9);
  rect(123, 280, 15, 15);
  fill(255);
  rect(108, 295, 15, 15);
  fill(#252D4D);//cuello
  rect(138, 280, 15, 15);
  //DER//
  fill(#FFD0B9);
  rect(243, 280, 15, 15);
  fill(255);
  rect(258, 295, 15, 15);
  fill(#252D4D);//cuello
  rect(228, 280, 15, 15);
  //BOLSA
  fill(#252D4D);//cuello
  rect(168, 290, 45, 15);
  //MANOS//
  //IZQ//
  fill(#FFD0B9);
  rect(108, 310, 30, 30);
  //DER
  rect(243, 310, 30, 30);
  //sombras manos
  fill(#A58B61, 80);
  rect(123, 310, 15, 15);
  rect(243, 310, 15, 15);
  //PIERNAS//
  fill(#DBDBDB);
  rect(153, 320, 75, 15);
  rect(168, 335, 15, 15);
  rect(198, 335, 15, 15);
  fill(#FFD0B9);
  rect(168, 345, 15, 15);
  rect(198, 345, 15, 15);
  fill(#DBDBDB);
  rect(168, 360, 15, 15);
  rect(198, 360, 15, 15);
  //ZAPATOS//
  //izquierdo//
  fill(#FFD0B9);
  rect(123, 370, 15, 15);
  fill(#344089);
  rect(138, 370, 45, 15);
  fill(#1E2448);
  rect(123, 385, 60, 15);
  //derecho//
  fill(#FFD0B9);
  rect(243, 370, 15, 15);
  fill(#344089);
  rect(198, 370, 45, 15);
  fill(#1E2448);
  rect(198, 385, 60, 15);
  popMatrix();
}

void Rock_Lee() {
  pushMatrix();
  fill(0);
  noStroke();
  rect(73, 70, 225, 80);
  rect(103, 50, 160, 80);
  rect(143, 40, 90, 100);
  //Brillo cabello
  fill(255);
  rect(105, 85, 30, 15);
  rect(145, 85, 15, 15);
  rect(170, 85, 30, 15);
  rect(210, 85, 15, 15);
  rect(235, 85, 30, 15);
  //CARA
  fill(#FFD0B9);
  rect(88, 140, 200, 80);
  rect(103, 220, 170, 15);
  rect(118, 235, 140, 15);
  //sombras cara
  fill(#A58B61, 60);
  rect(88, 160, 15, 60);
  rect(103, 220, 15, 15);
  rect(118, 235, 15, 15);
  rect(273, 160, 15, 60);
  rect(258, 220, 15, 15);
  rect(243, 235, 15, 15);
  //PELILLO//
  fill(0);
  rect(73, 140, 30, 70);
  rect(88, 210, 15, 25);
  rect(273, 140, 30, 70);
  rect(273, 210, 15, 25);
  rect(103, 235, 15, 15);
  rect(258, 235, 15, 15);
  //frentilla
  fill(#FFD0B9);
  rect(165, 125, 15, 15);
  rect(195, 125, 15, 15);
  //Ojos//
  fill(#8FF5DC, 90);
  rect(118, 160, 45, 45);
  rect(208, 160, 45, 45);
  //brillo ojos//
  fill(255, 80);
  rect(118, 160, 15, 15);
  rect(208, 160, 15, 15);
  //pelilloabajo Y CUELLO//
  fill(#2A3E22);
  rect(168, 250, 45, 15);
  fill(#3D5A31);
  rect(138, 265, 15, 15);
  rect(228, 265, 15, 15);
  rect(153, 265, 75, 75);
  //BRAZOS//
  //IZQ//
  fill(#3D5A31);
  rect(123, 280, 15, 15);
  fill(255);
  rect(108, 295, 15, 15);
  fill(#2A3E22);
  rect(138, 280, 15, 15);
  //DER//
  fill(#FFD0B9);
  rect(243, 280, 15, 15);
  fill(255);
  rect(258, 295, 15, 15);
  fill(#2A3E22);
  rect(228, 280, 15, 15);
  //MANOS//
  //IZQ//
  fill(#FFD0B9);
  rect(108, 310, 30, 30);
  fill(255, 90);
  rect(108, 310, 15, 30);
  //DER
  fill(#FFD0B9);
  rect(243, 310, 30, 30);
  fill(255, 90);
  rect(258, 310, 15, 30);
  //sombras manos
  fill(#A58B61, 80);
  rect(123, 310, 15, 15);
  rect(243, 310, 15, 15);
  //CINTURON//
  fill(#5F130B);
  rect(153, 310, 75, 15);
  fill(#AAAAAA);
  rect(168, 310, 15, 15);
  fill(#717171);
  rect(183, 310, 15, 15);
  fill(#AAAAAA);
  rect(198, 310, 15, 15);
  //piernitas
  fill(#3D5A31);
  rect(153, 325, 75, 15);
  //PIERNAS//
  fill(#2A3E22);
  rect(168, 340, 15, 30);
  rect(198, 340, 15, 30);
  fill(#BF8D0F);
  rect(168, 355, 15, 15);
  rect(198, 355, 15, 15);
  //ZAPATOS//
  //izquierdo//
  fill(#FFD0B9);
  rect(123, 370, 15, 15);
  fill(#344089);
  rect(138, 370, 45, 15);
  fill(#1E2448);
  rect(123, 385, 60, 15);
  //derecho//
  fill(#FFD0B9);
  rect(243, 370, 15, 15);
  fill(#344089);
  rect(198, 370, 45, 15);
  fill(#1E2448);
  rect(198, 385, 60, 15);
  //VENDAS BRAZO DER
  fill(255, 10);
  rect(273, 340, 15, 30);
  rect(288, 370, 15, 15);
  //CEJAS
  fill(0);
  rect(118, 145, 45, 15);
  rect(208, 145, 45, 15);
  popMatrix();
}

void Gaara() {
  pushMatrix();
  fill(#811910);
  noStroke();
  //cabello Naruto//
  rect(73, 60, 15, 30);
  rect(103, 40, 15, 30);
  rect(133, 20, 15, 45);
  rect(178, 20, 15, 45);
  rect(223, 20, 15, 45);
  rect(253, 40, 15, 30);
  rect(283, 60, 15, 30);
  rect(73, 70, 225, 30);
  rect(103, 50, 160, 20);
  rect(143, 40, 90, 10);
  rect(88, 100, 15, 30);
  rect(73, 115, 15, 15);
  rect(268, 100, 15, 30);
  rect(283, 115, 15, 15);
  //SOMBRAS CABELLO
  fill(#86571C, 40);
  rect(73, 70, 30, 15);
  rect(103, 50, 30, 15);
  rect(133, 40, 30, 15);
  rect(268, 70, 30, 15);
  rect(238, 50, 30, 15);
  rect(208, 40, 30, 15);
  //CARA
  fill(#FFD0B9);
  rect(103, 99, 170, 75);
  rect(88, 160, 200, 60);
  rect(103, 220, 170, 15);
  rect(118, 235, 140, 15);
  //sombras cara
  fill(#A58B61, 60);
  rect(88, 160, 15, 60);
  rect(103, 220, 15, 15);
  rect(118, 235, 15, 15);
  rect(273, 160, 15, 60);
  rect(258, 220, 15, 15);
  rect(243, 235, 15, 15);
  //PELILLO//
  fill(#811910);
  rect(88, 99, 30, 100);
  rect(257, 99, 33, 100);
  rect(103, 99, 30, 45);
  rect(123, 99, 15, 30);
  rect(143, 99, 15, 15);
  rect(163, 99, 15, 30);
  //tatuaje
  fill(#C6281A);
  rect(210, 120, 15, 15);
  rect(225, 105, 15, 15);
  rect(240, 120, 15, 15);
  //Ojos//
  stroke(0, 80);
  strokeWeight(5);
  fill(#8FF5DC, 90);
  rect(118, 160, 45, 45);
  rect(208, 160, 45, 45);
  noStroke();
  //brillo ojos//
  fill(255, 80);
  rect(122, 164, 15, 15);
  rect(212, 164, 15, 15);
  //pelilloabajo Y CUELLO//
  fill(#811910);
  rect(148, 250, 15, 15);  
  fill(#4D120C);//cuello
  rect(163, 250, 60, 15);
  fill(#811910);//pelorojo
  rect(213, 250, 15, 15);
  //TORSO//
  fill(#552420);
  rect(138, 265, 105, 15);
  rect(153, 280, 75, 40);
  //BRAZOS//
  //IZQ//
  fill(#552420);
  rect(123, 280, 15, 15);
  rect(108, 295, 15, 15);
  fill(#4D120C);//rojooscuro
  rect(138, 280, 15, 15);
  //DER//
  fill(#552420);//rojoropa
  rect(243, 280, 15, 15);
  rect(258, 295, 15, 15);
  fill(#4D120C);
  rect(228, 280, 15, 15);
  //MANOS//
  //IZQ//
  fill(#FFD0B9);
  rect(108, 310, 30, 30);
  //DER
  rect(243, 310, 30, 30);
  //sombras manos
  fill(#A58B61, 80);
  rect(123, 310, 15, 15);
  rect(243, 310, 15, 15);
  //CINTURON//
  fill(#6A6867);
  rect(153, 310, 75, 15);
  fill(#552420);
  rect(153, 325, 75, 15);
  //PIERNAS//
  rect(168, 340, 15, 30);
  rect(198, 340, 15, 30);
  fill(#504B4A);
  rect(168, 355, 15, 15);
  rect(198, 355, 15, 15);
  //ZAPATOS//
  //izquierdo//
  fill(#FFD0B9);
  rect(123, 370, 15, 15);
  fill(#3E3838);
  rect(138, 370, 45, 15);
  fill(0);
  rect(123, 385, 60, 15);
  //derecho//
  fill(#FFD0B9);
  rect(243, 370, 15, 15);
  fill(#3E3838);
  rect(198, 370, 45, 15);
  fill(0);
  rect(198, 385, 60, 15);
  //detallestorso
  fill(#A0A0A0);
  rect(160, 295, 15, 15);
  rect(175, 280, 15, 15);
  rect(190, 265, 30, 15);
  popMatrix();
}

void Takeshi() {
  pushMatrix();
  fill(#171515);
  noStroke();
  rect(103, 55, 170, 45);
  rect(133, 40, 40, 15);
  rect(203, 40, 40, 15);
  //CARA
  fill(#FFD0B9);
  rect(103, 99, 170, 75);
  rect(88, 160, 200, 60);
  rect(103, 220, 170, 15);
  rect(118, 235, 140, 15);
  //sombras cara
  fill(#A58B61, 60);
  rect(88, 160, 15, 60);
  rect(103, 220, 15, 15);
  rect(118, 235, 15, 15);
  rect(273, 160, 15, 60);
  rect(258, 220, 15, 15);
  rect(243, 235, 15, 15);
  //PELILLO//
  fill(#3E3737);
  rect(88, 99, 30, 137);
  rect(257, 99, 33, 137);
  rect(103, 99, 30, 45);
  rect(123, 99, 15, 30);
  fill(#3E3737);
  rect(143, 99, 15, 15);
  rect(163, 99, 15, 30);
  //Ojos//
  stroke(0, 80);
  strokeWeight(5);
  fill(#8FF5DC, 90);
  rect(118, 160, 45, 45);
  rect(208, 160, 45, 45);
  noStroke();
  //brillo ojos//
  fill(255, 80);
  rect(122, 164, 15, 15);
  rect(212, 164, 15, 15);
  //pelilloabajo Y CUELLO//
  fill(#171515);//grisoscuro
  rect(118, 250, 45, 15);
  rect(118, 265, 19, 15);
  fill(#301F48);
  rect(162, 250, 18, 15);
  fill(#FFD0B9);
  rect(181, 250, 15, 15);
  fill(#A58B61, 60);//sombrapiel
  rect(181, 250, 15, 15);
  fill(#301F48);
  rect(196, 250, 18, 15);
  fill(#171515);
  rect(213, 250, 45, 15);
  rect(243, 265, 15, 15);
  rect(103, 265, 15, 15);
  fill(#3E3737);//grisclaro
  rect(103, 85, 30, 75);
  rect(103, 160, 15, 120);
  rect(243, 85, 30, 75);
  rect(258, 160, 15, 120);
  fill(#3E3737);//grisoscuro
  rect(133, 85, 45, 15);
  rect(148, 70, 15, 15);
  rect(198, 85, 45, 15);
  rect(213, 70, 15, 15);
  //TORSO//
  fill(#301F48);
  rect(138, 265, 105, 15);
  rect(153, 280, 75, 40);
  //BRAZOS//
  //IZQ//
  fill(#301F48);
  rect(123, 280, 15, 15);
  rect(108, 295, 15, 15);
  fill(#1D112E);//rojooscuro
  rect(138, 280, 15, 15);
  //DER//
  fill(#301F48);//rojoropa
  rect(243, 280, 15, 15);
  rect(258, 295, 15, 15);
  fill(#1D112E);
  rect(228, 280, 15, 15);
  //MANOS//
  //IZQ//
  fill(#FFD0B9);
  rect(108, 310, 30, 30);
  //DER
  rect(243, 310, 30, 30);
  //sombras manos
  fill(#A58B61, 80);
  rect(123, 310, 15, 15);
  rect(243, 310, 15, 15);
  //CINTURON//
  fill(0);
  rect(153, 310, 75, 15);
  fill(#301F48);
  rect(153, 325, 75, 15);
  //PIERNAS//
  rect(168, 340, 15, 30);
  rect(198, 340, 15, 30);
  fill(#1D112E);
  rect(168, 355, 15, 15);
  rect(198, 355, 15, 15);
  //ZAPATOS//
  //izquierdo//
  fill(#FFD0B9);
  rect(123, 370, 15, 15);
  fill(#3E3838);
  rect(138, 370, 45, 15);
  fill(0);
  rect(123, 385, 60, 15);
  //derecho//
  fill(#FFD0B9);
  rect(243, 370, 15, 15);
  fill(#3E3838);
  rect(198, 370, 45, 15);
  fill(0);
  rect(198, 385, 60, 15);
  //detalles torso
  fill(255);
  rect(166, 265, 45, 15);
  rect(181, 265, 15, 45);
  popMatrix();
}

void cuchillo(){
pushMatrix();
  fill(50);
  rect(0, 20, 50, 50);
  fill(0);
  rect(10, 30, 30, 30);
  fill(50);
  rect(50,70,20,20);
  rect(70,90,60,60);
  rect(110,130,30,30);
  rect(130,150,20,20);
  popMatrix();

}
