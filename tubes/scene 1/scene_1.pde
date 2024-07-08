float planeX = -200; // Mulai dari luar layar kiri
float cloud1Offset = 0; // Offset awan 1
float cloud2Offset = 0; // Offset awan 2
float cloud3Offset = 0; // Offset awan 3

// Variabel untuk garis ombak
float[] waveX1 = new float[20]; // Array untuk menyimpan posisi X dari garis ombak bagian atas
float[] waveY1 = new float[20]; // Array untuk menyimpan posisi Y dari garis ombak bagian atas
float[] waveX2 = new float[20]; // Array untuk menyimpan posisi X dari garis ombak bagian bawah
float[] waveY2 = new float[20]; // Array untuk menyimpan posisi Y dari garis ombak bagian bawah

void setup() {
  size(1920, 1000);
  background(135, 206, 250); // Warna langit biru
  
  // Inisialisasi posisi awal garis ombak bagian atas
  for (int i = 0; i < waveX1.length; i++) {
    waveX1[i] = random(width); // Posisi X acak
    waveY1[i] = random(height / 2 + 50, height / 2 + 100); // Posisi Y acak di bagian atas lautan
  }
  
  // Inisialisasi posisi awal garis ombak bagian bawah
  for (int i = 0; i < waveX2.length; i++) {
    waveX2[i] = random(width); // Posisi X acak
    waveY2[i] = random(height / 2 + 100, height / 2 + 150); // Posisi Y acak di bagian bawah lautan
  }
}

void draw() {
  background(135, 206, 250); // Refresh background setiap frame
  
  // Menggerakkan awan dengan offset yang diperbarui
  cloud1Offset += 0.5;
  cloud2Offset += 0.3;
  cloud3Offset += 0.7;
  
  // Menggambar awan dengan posisi yang diperbarui
  drawCloud(300 + cloud1Offset, 200, 100, 60);
  drawCloud(800 + cloud2Offset, 150, 120, 70);
  drawCloud(1400 + cloud3Offset, 250, 130, 80);
  
  drawSea(); // Gambar lautan dengan ombak
  
  drawPlane(planeX, height / 2); // Gambar pesawat
  
  // Gerakan pesawat dari kiri ke kanan
  planeX += 1.5; // Kecepatan gerakan pesawat
  
  // Membuat pesawat bergerak dari kiri ke kanan dan kembali lagi
  if (planeX > width + 200) {
    planeX = -200;
  }
  
  // Membuat awan bergerak diam di tempat
  if (cloud1Offset > 50) {
    cloud1Offset = 0;
  }
  if (cloud2Offset > 50) {
    cloud2Offset = 0;
  }
  if (cloud3Offset > 50) {
    cloud3Offset = 0;
  }
}

void drawCloud(float x, float y, float w, float h) {
  fill(255);
  noStroke();
  ellipse(x, y, w, h);
  ellipse(x + w * 0.3, y - h * 0.4, w * 1, h * 1);
  ellipse(x - w * 0.3, y - h * 0.4, w * 0.8, h * 0.5);
}

void drawPlane(float x, float y) {
  // Badan pesawat
  fill(255); // Warna putih
  noStroke();
  ellipse(x + 200, y, 300, 80);
  
  // Ekor pesawat
  fill(200); // Warna abu-abu untuk detail
  triangle(x + 50, y - 60, x + 50, y, x + 110, y );
  
  // Sayap pesawat
  fill(255); // Warna putih
  arc(x + 200, y - 30, 60, 180, PI, TWO_PI);
  arc(x + 200, y + 10, 60, 220, 0, PI);
  
  // Detail pada badan pesawat
  fill(200); // Warna abu-abu untuk detail
  ellipse(x + 315, y - 10, 50, 20);
  ellipse(x + 150, y - 10, 20, 25);
  ellipse(x + 180, y - 10, 20, 25);
  ellipse(x + 210, y - 10, 20, 25);
}

void drawSea() {
  // Lautan
  fill(0, 105, 148);
  noStroke();
  rect(0, height / 2, width, height / 2);
  
  // Gambar garis-garis ombak bagian atas
  stroke(255); // Warna putih untuk garis
  strokeWeight(2);
  for (int i = 0; i < waveX1.length; i++) {
    float offsetX = map(sin(frameCount * 0.05 + i), -1, 1, -10, 10); // Efek gelombang
    float offsetY = map(cos(frameCount * 0.03 + i), -1, 1, -5, 5); // Efek gelombang
    float x1 = waveX1[i] + offsetX;
    float y1 = waveY1[i] + offsetY;
    float x2 = x1 + random(10, 30);
    float y2 = y1;
    line(x1, y1, x2, y2);
  }
  
  // Gambar garis-garis ombak bagian bawah
  for (int i = 0; i < waveX2.length; i++) {
    float offsetX = map(sin(frameCount * 0.05 + i), -1, 1, -10, 10); // Efek gelombang
    float offsetY = map(cos(frameCount * 0.03 + i), -1, 1, -5, 5); // Efek gelombang
    float x1 = waveX2[i] + offsetX;
    float y1 = waveY2[i] + offsetY;
    float x2 = x1 + random(10, 30);
    float y2 = y1;
    line(x1, y1, x2, y2);
  }
}
