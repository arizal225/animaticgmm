PImage rumahMakan;
int scene = 1;
float personX = 0;
float personY = 700; // Disesuaikan dengan ukuran canvas baru
int timeCounter = 0;
boolean personStopped = false;
boolean sceneEnded = false;

void setup() {
  size(1920, 1000);
  rumahMakan = loadImage("/png/rumah makan.png"); // memanggil gambar
  rumahMakan.resize(800, 0);
}

void draw() {
  background(135, 206, 235); // Langit biru
  drawSun();
  drawCloud(300, 200);
  drawCloud(1000, 300);
  drawGround();
  
  timeCounter++;
  
  if (scene == 1) {
    // Gambar restoran di belakang orang saat berjalan ke restoran
    imageMode(CENTER);
    image(rumahMakan, 1500, 665); // Adjusted coordinates
    
    // Scene 1: Orang berjalan ke RM Padang
    drawPerson(personX, personY);
    if (!personStopped) {
      personX += 1; // Perlambat orang berjalan
    }
    
    if (personX >= 1380) { // Ketika orang sampai di pintu, berhenti
      personStopped = true;
      personX = 1380;
    }

    if (timeCounter > 1800) { // 30 detik (30 fps * 30 detik)
      scene = 2;
      timeCounter = 0;
      personX = 800; // Reset posisi orang untuk adegan dalam ruangan
      personY = 600; // Reset posisi orang untuk adegan dalam ruangan
    }
  } else if (scene == 2) {
    // Scene 2: Orang berada di dalam RM Padang dan mencoba hidangan rendang
    drawIndoorRMPadang();
    drawPersonSitting(personX, personY);
    drawRendang(personX + 50, personY + 30);
    fill(0);

    if (timeCounter > 600) { // 20 detik (30 fps * 20 detik)
      sceneEnded = true; // Akhiri scene
    }
  }
}

void drawPerson(float x, float y) {
  pushMatrix();
  translate(x - 800, y - 600);
  noStroke();
  fill (#1E1A17); // rambut
  ellipse (841.5, 551, 206.9, 194.6);
  fill (#FFD581);
  ellipse (841.5, 569, 171.8, 161.6);
  rect (820, 645.1, 43.1, 51.7);
  ellipse (751.7, 569, 27.2, 36);
  ellipse (932, 569, 27.2, 36);
  quad (768.4, 704.9, 780.3, 716.7, 746.8, 750.4, 734.7, 739);
  ellipse (742.7, 742.5, 30, 20.7);
  quad (902.8, 716.8, 914.8, 704.9, 948.3, 737.8, 936.4, 750.4);
  ellipse (941.8, 742.5, 30, 20.7);
  rect (803.9, 811.4, 21.5, 45.2);
  rect (853.3, 812, 21.5, 45.2);
  fill (#000000); // sepatu
  ellipse (811.3, 857.1, 38.1, 17.7);
  ellipse (867.2, 857.1, 38.1, 17.7);
  fill (#F1F1F1);
  ellipse (805.1, 556.6, 29.8, 35.3);
  ellipse (881.6, 556.6, 29.8, 35.3);
  fill (#1E1A17); // rambut
  ellipse (805.1, 559.1, 19.1, 22.6);
  ellipse (881.6, 559.1, 19.1, 22.6);
  fill (#DDAD4D);
  ellipse (841.5, 576.8, 22.4, 12.7);
  stroke (#1E1A17);
  strokeWeight (4);
  noFill ();
  arc (841.8, 590.2, 66.2, 26.9, radians(10), radians(170));
  noStroke ();
  fill (#1E1A17);
  ellipse (841.5, 494.5, 143.1, 70.9);
  fill (#40311A); // celana
  quad (790.2, 778.7, 841.5, 778.7, 835.6, 841.4, 784.8, 841.4);
  quad (841.5, 778.7, 891.2, 778.7, 896.5, 841.4, 843.3, 841.4);
  fill (#758C5D); // baju
  quad (784.8, 679.8, 898.3, 679.8, 878, 663.4, 805.1, 663.4);
  rect (784.8, 678.8, 113.5, 107.9);
  quad (785.8, 678.8, 785.8, 724.7, 775.4, 735.7, 750.9, 711.1);
  quad (897.3, 678.8, 897.3, 724.7, 907.8, 735.7, 932, 711.1);
  fill (#F6F6F6);
  quad (805.1, 662.4, 784.8, 679.8, 838.8, 676, 838.8, 676);
  quad (878, 662.4, 898.3, 679.8, 838.8, 676, 838.8, 676);
  fill (#FFD581);
  triangle (878, 662.4, 805.1, 662.4, 838.8, 676);
  popMatrix();
}

void drawIndoorRMPadang() {
  background(244, 164, 96); // Warna latar dalam ruangan
  fill(139, 69, 19);
  rect(100, 500, 1700, 400); // Dinding belakang
  fill(160, 82, 45);
  rect(100, 800, 1700, 100); // Lantai
  fill(139, 69, 19);
  rect(600, 700, 400, 200); // Meja (diubah posisinya)
}

void drawPersonSitting(float x, float y) {
  pushMatrix();
  translate(x - 800, y - 600);
  noStroke();
  fill (#1E1A17); // rambut
  ellipse (841.5, 551, 206.9, 194.6);
  fill (#FFD581);
  ellipse (841.5, 569, 171.8, 161.6);
  rect (820, 645.1, 43.1, 51.7);
  ellipse (751.7, 569, 27.2, 36);
  ellipse (932, 569, 27.2, 36);
  fill (#758C5D); // baju
  quad (784.8, 679.8, 898.3, 679.8, 878, 663.4, 805.1, 663.4);
  rect (784.8, 678.8, 113.5, 107.9);
  fill (#40311A); // celana
  rect(790, 750, 100, 50); // Bagian atas celana untuk posisi duduk (diubah posisinya)
  
  // Menambahkan tangan di atas meja
  fill (#FFD581);
  ellipse (740, 750, 30, 70); // Tangan kiri
  ellipse (940, 750, 30, 70); // Tangan kanan
  popMatrix();
}


void drawRendang(float x, float y) {
  fill(160, 82, 45);
  ellipse(x, y, 50, 30); // Piring
  fill(139, 69, 19);
  ellipse(x, y, 30, 20); // Rendang
}

void drawGround() {
  fill(#666930);
  rect(0, 950, width, 50); // Rumput
  fill(128, 128, 128);
  rect(0, 980, width, 20); // Jalan
}

void drawSun() {
  fill(255, 223, 0);
  ellipse(1700, 100, 80, 80); // Matahari
}

void drawCloud(float x, float y) {
  fill(255);
  ellipse(x, y, 60, 40);
  ellipse(x + 20, y, 60, 40);
  ellipse(x - 20, y, 60, 40);
  ellipse(x, y - 10, 60, 40);
}
