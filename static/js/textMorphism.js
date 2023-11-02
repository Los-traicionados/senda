function rand(n) { return(Math.floor(Math.random() * n))}

class TextMorph {
  constructor(cv_id, iText, fText, x, y, opc) {
    this.canvas = document.getElementById(cv_id);
    this.ctx = this.canvas.getContext("2d");
    this.ctx.font = "20px Arial";
    this.ctx.fillStyle = "red";
    this.iText = iText;
    this.fText = fText;
    this.c = { "x" : x, "y" : y};
    this.m = opc.mod;
    let coords = this.getCoords(this.canvas, iText, x, y, opc.fFont, opc.iSpace);
    this.letters = [];
    let newline = false;
    let br, pos = 0;
    
    for (var i = 0; i < coords.length; i++) {
      var idx = i % this.fText.length;
      if (idx && !(idx % this.m))
        newline = true;
      if (newline && this.fText[idx] == " ") {
        newline = false;
        br++;
        idx++;
        if (i < coords.length - 1)
          i++;
        pos = 0;
      }
      if (!idx) pos = br = 0;
      var finalx = (i < this.fText.length) ? this.c.x + pos : this.canvas.width / 2 + 2 * this.canvas.width * Math.cos(i);
      var finaly = (i < this.fText.length) ? this.c.y + br * 20 : this.canvas.height / 2 + 2 * this.canvas.height * Math.sin(i);
      this.letters.push({l : this.fText[idx],
                         x : coords[i].x,
                         y : coords[i].y,
                         px : coords[i].x,
                         py : coords[i].y,
                         cx : finalx,
                         cy : finaly - y / 2});
      pos += this.ctx.measureText(this.fText[idx]).width;
    }
    this.drawFrame(0);
  };
  
  drawFrame(frame) {
    if (frame < 0)
      frame = 0;
    else if (frame > 20)
      frame = 20;
    this.letters.forEach(c => {
      this.ctx.fillText(c.l, c.px, c.py);
      c.px = c.x * (20 - frame) / 20 + c.cx * frame / 20;
      c.py = c.y * (20 - frame) / 20 + c.cy * frame / 20;
    });
  }
  
  getCoords (canvas, text, x, y, font, gap) {
    let ctx = canvas.getContext("2d");
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    ctx.fillStyle = "#000000";
    let temp = ctx.font;
    ctx.font = font;
    ctx.fillText(text, x, y);
    ctx.font = temp;

    var imageData, pixel, height, width;
    imageData = ctx.getImageData(0, 0, canvas.width, canvas.height);

    let coords = [];
    // quickly iterate over all pixels - leaving density gaps
    for(height = 0; height < canvas.height; height += gap)
      for(width = 0; width < canvas.width; width += gap) {   
        pixel = imageData.data[((width + (height * this.canvas.width)) * 4) - 1];
        //Pixel is black from being drawn on. 
        if(pixel == 255)
          coords.push({ x : width , y : height});
      }
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    return (coords);
  }
}

let travel = new TextMorph("cv_A",
                           "VIAJA",
                           "Nuestra agencia ha evolucionado con el tiempo y ha prosperado en Madrid capital, gracias a un equipo experimentado que trabaja incansablemente. Sin embargo, estamos decididos a llevarla a la era digital y alejarnos de los procesos manuales.", 
                           25, 225, {'iFont' : '200px impact' , 'fFont' : '200px impact' , 'iSpace' : 5, 'mod' : 50});

let fly = new TextMorph("cv_B",
                           "VUELA",
                           "Nuestra especialización abarca la venta de estancias en hoteles en destinos globales, con un enfoque particular en Europa. Además, ofrecemos opciones de vuelos a múltiples destinos en todo el mundo, con un énfasis en España, Europa y América. Si buscas paquetes más completos, nuestras ofertas incluyen combinaciones de alojamiento, vuelos y actividades de ocio. También disponemos de ofertas excepcionales en vuelos, alojamiento y escapadas.", 
                           25, 225, {'iFont' : '200px impact' , 'fFont' : '200px impact' , 'iSpace' : 5, 'mod' : 50});

let repeat = new TextMorph("cv_C",
                           "REPITE",
                           "Para ofrecerte una experiencia personalizada, te invitamos a registrarte en nuestro sitio web. Esto nos permitirá enviarte información y promociones adaptadas a tus preferencias y necesidades.", 
                           150, 225, {'iFont' : '200px impact' , 'fFont' : '200px impact' , 'iSpace' : 5, 'mod' : 92});

// travel.drawFrame(0);

let frame = -5;
let animation = [false, false, false];
let cv_array = [];
let ctx_array = [];
let morph_array = [travel, fly, repeat];
for (var i = 0; i < 3; i++) { 
  cv_array.push(document.getElementById(["cv_A","cv_B","cv_C"][i]));
  ctx_array.push(cv_array[i].getContext("2d"));
}

let act_ctx = ctx_array[0];
let act_text = travel;
let animate = false;
function draw() {
  if (frame > 50 || !animate)
    return ;
  act_ctx.clearRect(0, 0, 1200, 300);
  act_ctx.save();
  act_text.drawFrame(frame++);
  act_ctx.restore();
}

function setActive(a_idx) {
  if (animation[a_idx])
     return ;
  frame = -5;
  act_ctx = ctx_array[a_idx];
  act_text = morph_array[a_idx];
  for (var i = 0; i < animation.length; i++)
    animation[i] = false;
  animation[a_idx] = animate = true;
}

function animate_cv1(event) { setActive(0)}
function animate_cv2(event) { setActive(1)}
function animate_cv3(event) { setActive(2)}
cv_array[0].addEventListener('mousemove', animate_cv1);
cv_array[1].addEventListener('mousemove', animate_cv2);
cv_array[2].addEventListener('mousemove', animate_cv3);
setInterval(draw, 100);

/**let i = 0;
function draw() {
  if (!animation)
     return ;
  let letter = text[i];
  if (++i >= text.length - 1)
     i = 0;
}*/