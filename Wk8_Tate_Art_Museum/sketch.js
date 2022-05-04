let p;

function preload() {
  p = loadImage({ img_path });
}

function setup() {
  createCanvas(400, 400);
}

function draw() {
  background('#a03245');
  let w = width / p.width;
  let h = height / p.height;
  p.loadPixels();
  for (let i = 0; i < p.width; i++) {
    for (let j = 0; j < p.height; j++) {
      const pixelIndex = (i + j * p.width) * 4;
      const r = p.pixels[pixelIndex + 0];
      const g = p.pixels[pixelIndex + 1];
      const b = p.pixels[pixelIndex + 2];
      const avg = (r + g + b) / 3;    
      noStroke();
      fill('white');
      square(i * w, j * h, map(avg,0,255,0,h));
    }
  }
}
