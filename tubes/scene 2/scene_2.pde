PImage airport;
float airplaneX = 0;
float airplaneY = 300;
int flyingDuration = 5000; // 5 detik dalam milidetik
int landingDuration = 3000; // 3 detik dalam milidetik
int startTime;

// Koordinat dan kecepatan awan
float[] cloudX = {200, 600, 1000, 1400};
float[] cloudY = {150, 250, 100, 200};
float[] cloudSpeed = {1, 1.5, 1, 2};

void setup() {
  size(1920, 1000);
  frameRate(30);
  startTime = millis();
  
  airport = loadImage("/png/airport.png"); // memanggil gambar
  airport.resize(600, 0); // resize image, keeping aspect ratio
}

void draw() {
  int elapsedTime = millis() - startTime;
  background(135, 206, 250); // Warna langit

  // Update posisi awan
  for (int i = 0; i < cloudX.length; i++) {
    cloudX[i] -= cloudSpeed[i];
    if (cloudX[i] < -100) {
      cloudX[i] = width + 100;
    }
    drawCloud(cloudX[i], cloudY[i]);
  }

  if (elapsedTime <= flyingDuration + landingDuration) {
    // Pesawat landing dari kiri ke tengah frame
    int landingTime = elapsedTime - flyingDuration;
    airplaneX = map(landingTime, 0, landingDuration, 0, width / 2 + 150);
    airplaneY = map(landingTime, 0, landingDuration, 300, height - 100);
    drawAirportBackground();
    drawAirplane(airplaneX, airplaneY);
  } else {
    // Setelah landing
    drawAirportBackground();
    drawAirplane(width / 2 + 150, height - 100);
  }
}

void drawAirplane(float x, float y) {
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

void drawAirportBackground() {
  // Gambar landasan pacu
  fill(50);
  rect(0, height - 100, width, 100);
  fill(255);
  for (int i = 0; i < width; i += 40) {
    rect(i, height - 50, 20, 10);
  }

  // lokasi untuk gambar
  imageMode(CENTER);
  image(airport, width / 2, height - 273); // posisi diatas landasan pacu
}

void drawCloud(float x, float y) {
  fill(255);
  noStroke();
  ellipse(x, y, 100, 60);
  ellipse(x + 40, y - 20, 80, 50);
  ellipse(x - 40, y - 20, 80, 50);
  ellipse(x + 20, y + 20, 80, 50);
  ellipse(x - 20, y + 20, 80, 50);
}
