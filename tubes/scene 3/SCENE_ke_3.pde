PImage gadang;
int x1 = -400;
int speed = 3; // kecepatan karakter
float sunY = 100;
boolean movingForward = true; // pergerakan karakter
int bounces = 0; // untuk fungsi maju mundur

void setup() {
  size(1920, 1000);
  frameRate(30);

  gadang = loadImage("/png/gadang.png"); // memanggil gambar
}

void draw() {
  background(#C2E6E8);

  // Matahari
  fill(#FFD700);
  noStroke();
  ellipse(width / 2, sunY, 200, 200);

  // menggerakkan matahari turun perlahan
  sunY += 0.1;

  // lokasi untuk gambar
  imageMode(CENTER);
  image(gadang, width / 2, 500);

  // Rumput
  noStroke();
  fill(#82CD47);
  rect(-3, 886, 1930, 200);
  fill(#379237);
  stroke(#379237);
  rect(-3, 886, 1930, 15);

  // Orang 1
  pushMatrix();
  translate(x1, 20);
  noStroke();
  fill(#1E1A17); // rambut
  ellipse(841.5, 551, 206.9, 194.6);
  fill(#FFD581);
  ellipse(841.5, 569, 171.8, 161.6);
  rect(820, 645.1, 43.1, 51.7);
  ellipse(751.7, 569, 27.2, 36);
  ellipse(932, 569, 27.2, 36);
  quad(768.4, 704.9, 780.3, 716.7, 746.8, 750.4, 734.7, 739);
  ellipse(742.7, 742.5, 30, 20.7);
  quad(902.8, 716.8, 914.8, 704.9, 948.3, 737.8, 936.4, 750.4);
  ellipse(941.8, 742.5, 30, 20.7);
  rect(803.9, 811.4, 21.5, 45.2);
  rect(853.3, 812, 21.5, 45.2);
  fill(#000000); // sepatu
  ellipse(811.3, 857.1, 38.1, 17.7);
  ellipse(867.2, 857.1, 38.1, 17.7);
  fill(#F1F1F1);
  ellipse(805.1, 556.6, 29.8, 35.3);
  ellipse(881.6, 556.6, 29.8, 35.3);
  fill(#1E1A17); // rambut
  ellipse(805.1, 559.1, 19.1, 22.6);
  ellipse(881.6, 559.1, 19.1, 22.6);
  fill(#DDAD4D);
  ellipse(841.5, 576.8, 22.4, 12.7);
  stroke(#1E1A17);
  strokeWeight(4);
  noFill();
  arc(841.8, 590.2, 66.2, 26.9, radians(10), radians(170));
  noStroke();
  fill(#1E1A17);
  ellipse(841.5, 494.5, 143.1, 70.9);
  fill(#40311A); // celana
  quad(790.2, 778.7, 841.5, 778.7, 835.6, 841.4, 784.8, 841.4);
  quad(841.5, 778.7, 891.2, 778.7, 896.5, 841.4, 843.3, 841.4);
  fill(#758C5D); // baju
  quad(784.8, 679.8, 898.3, 679.8, 878, 663.4, 805.1, 663.4);
  rect(784.8, 678.8, 113.5, 107.9);
  quad(785.8, 678.8, 785.8, 724.7, 775.4, 735.7, 750.9, 711.1);
  quad(897.3, 678.8, 897.3, 724.7, 907.8, 735.7, 932, 711.1);
  fill(#F6F6F6);
  quad(805.1, 662.4, 784.8, 679.8, 838.8, 676, 838.8, 676);
  quad(878, 662.4, 898.3, 679.8, 838.8, 676, 838.8, 676);
  fill(#FFD581);
  triangle(878, 662.4, 805.1, 662.4, 838.8, 676);
  popMatrix();

  // pergerakan posisi karakter
  if (movingForward) {
    x1 += speed;
  } else {
    x1 -= speed;
  }

  // karakter berhenti di tengah layar
  if (x1 > width / 2 - 200 && x1 < width / 2 + 200) {
    noLoop(); // menghentikan animasi
  }
}
