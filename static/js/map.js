const canvas = document.getElementById("cmap");
const ctx = canvas.getContext("2d");
let radius = 15;
var img = new Image();
img.src = "https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Blank_Spain_Map_%28Provinces%29.svg/1280px-Blank_Spain_Map_%28Provinces%29.svg.png";

function getOffset(el) {
  const rect = el.getBoundingClientRect();
  return {
    left: rect.left + window.scrollX,
    top: rect.top + window.scrollY
  };
}
var canvasPos = { x : getOffset(canvas).left, y : getOffset(canvas).top };

class Pointer {
  constructor(ctx, radius, center, text) {
    this.text = text;
    this.tdraw = false;
    this.ydraw = 0;
    this.r = radius;
    this.c = center;
    this.oc = center;
    this.grd = ctx.createRadialGradient(center.x, center.y, 5, center.x, center.y, radius * 4);
    this.grd.addColorStop(0, "red");
    this.grd.addColorStop(1, "black");
    this.h = radius * 1.5;
  };

  setRadius(radius) {
    this.r = radius;
    this.h = radius * 1.5;
  }
  
  drawTextBox(text) {
    // ctx.fillStyle = "#FFFFFF";
    // let len = text.length;
    // ctx.fillRect(this.c.x + len + this.r, this.c.y - 40, len * 12, 30);
    ctx.save();
    ctx.font = "20px Arial";
    ctx.fillStyle = "red";
    ctx.textAlign = "left";
    ctx.translate( this.c.x + this.r * 1.5, this.c.y + this.ydraw);
    ctx.rotate(0);
    ctx.fillText(text, 0, 0);
    ctx.restore();
  }

  draw() {
    // Drop
    ctx.beginPath();
    ctx.arc(this.c.x, this.c.y + this.ydraw, this.r, Math.PI, 0);
    ctx.arc(this.c.x - this.h, this.c.y + this.ydraw, this.r + this.h, 0, Math.PI / 3.4);
    ctx.arc(this.c.x + this.h, this.c.y + this.ydraw, this.r + this.h, Math.PI / 1.4, Math.PI);
    ctx.stroke();
    ctx.fillStyle = this.grd;
    ctx.fill();

    // White center
    ctx.beginPath();
    ctx.arc(this.c.x, this.c.y + this.ydraw, this.r * 0.35, 2 * Math.PI, 0);
    ctx.stroke();
    ctx.fillStyle = "#FFFFFF";
    ctx.fill();
    if (this.tdraw)
       this.drawTextBox(this.text);
  };
}
let pointers = [];
pointers.push(new Pointer(ctx, radius, center = { x : 350, y: 75 }, "Madrid"));
// pointers.push(new Pointer(ctx, radius, center = { x : 250, y: 150 }, "Otro"));
// pointers.push(new Pointer(ctx, radius, center = { x : 450, y: 150 }, "Nuevo"));

function mousemove(event) {
  pointers.forEach(pointer => {
    var distance = Math.sqrt(Math.pow(event.x - canvasPos.x - pointer.c.x, 2) + Math.pow(event.y - canvasPos.y - pointer.c.y, 2));
    // console.log(event.x + " " + event.y + " " + pointer.c.x + " " + pointer.c.y + " " + canvasPos.x + " " + canvasPos.y + " " + distance);
    if (distance < radius * 1.5) {
      pointer.tdraw = true;
      pointer.ydraw = -20;
      pointer.setRadius(radius * 1.5);
    }
    else {
      pointer.tdraw = false;
      pointer.ydraw = 0;
      pointer.setRadius(radius);
    }
  });
}
canvas.addEventListener('mousemove', mousemove);

function draw() {
  ctx.clearRect(0, 0, 600, 300);
  ctx.drawImage(img, 0, 0, 600, 300);
  pointers.forEach(pointer => {
    pointer.draw();
  });
}
setInterval(draw, 100);
