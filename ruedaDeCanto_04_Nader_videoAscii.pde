import processing.video.*;

Capture cam;

////

int r, g, b, alpha;

////

PImage atardecer = createImage(640, 480, RGB);

/////////////////////////////////////

boolean cheatScreen;

String letterOrder1 = "DondeEstaTuPoesia?";

String letterOrder2 = "TuVerdadYEntendimiento?";

String letterOrder3 = "SiAlBeberDeEsteTormento,";

String letterOrder4 = "TodosTusSantosMoririan?";


///////////////////////

float anchoVideo = 2880;
float altoVideo = 2160;

///////////////////////

int rate; 
float medicionTinte;
float deltaTinte;

/////////////////

LetraChica letraChicaASCII;
LetraChica letraChicaASCIIv2;
LetraChica letraChicaASCIIv3;

LetraChica02 letraChicaASCII02;
LetraChica03 letraChicaASCII03;


LetraMediana letraMedianaASCII;


/////////////////

boolean grabar = false;
int contadorImagenes;

void setup() {

  fullScreen(P2D);
  //size(640, 480, P2D);
  smooth();
  rate = 14;

  frameRate(rate);

  println("paso el frameRate");

  int count = width * height;

  cheatScreen = false;

  fill(0);
  rect(0, 0, width, height);
  noFill();

  atardecer.loadPixels();
  for (int i = 0; i < atardecer.pixels.length; i++) 
  {
    atardecer.pixels[i] = color(i%255, abs((255-i))%255, abs((128-i)%255));
  }
  atardecer.updatePixels();

  println("paso el loadPixels");


  /////////////////////////////////



  letraChicaASCII = new LetraChica();

  letraChicaASCIIv2 = new LetraChica();
  letraChicaASCIIv3 = new LetraChica();


  letraChicaASCII02 = new LetraChica02();
  letraChicaASCII03 = new LetraChica03();

  letraMedianaASCII = new LetraMediana();

  println("paso el new LetraMediana()");


  /////////////////////////////////

  noCursor();
  deltaTinte = random(8000)/8000;

  ///////////////////////////////////////


  letraChicaASCII.setupZero();
  letraChicaASCIIv2.setupZero();
  letraChicaASCIIv3.setupZero();

  letraChicaASCII02.setupZero();
  letraChicaASCII03.setupZero();
  letraMedianaASCII.setupZero();



  println("paso el setupZero");

  String[] cameras = Capture.list();

  if (cameras == null) 
  {
    println("Failed to retrieve the list of available cameras, will try the default...");
    cam = new Capture(this, 640, 480);
  } 
  if (cameras.length == 0) 
  {
    println("There are no cameras available for capture.");
    exit();
  } else 
  {
    println("Available cameras:");
    printArray(cameras);

    // The camera can be initialized directly using an element
    // from the array returned by list():
    cam = new Capture(this, cameras[1]);
    // Or, the settings can be defined based on the text in the list
    //cam = new Capture(this, 640, 480, "Built-in iSight", 30);

    // Start capturing the images from the camera
    cam.start();
  }

  /////
  r = 255; //entre 141 y 255
  g = 101; // entre 101 y 141
  b = 101; // entre 41 y 101

  alpha = 48; //entre 28 y 120
  /////
}

float alphaVar, monoCromo;

void draw() 
{

  if (cam.available() == true) 
  {
    cam.read();
  }
  if (frameCount%14 == 0)
  {
    atardecer.copy(cam, 0, 0, cam.width, cam.height, 0, 0, cam.width, cam.height);
    println("paso el atardecer = cam");
  }
  
  if (frameCount%814 == 0)
  {
    contadorImagenes = (int)random(1, 9);

    // cachar que onda el texto

    switch(contadorImagenes)
    {
    case 1: 

      letterOrder1 = "MilesYMilesDeMundos,";
      letterOrder2 = "Flotan,SinVerseOTocarse,";
      letterOrder3 = "Mundos,QueAlMultiplicarse,";
      letterOrder4 = "HeredanCercosProfundos";
      break;

    case 2: 
      letterOrder1 = "EnLaSombraDelAmor";
      letterOrder2 = "Camina,Lento,LaVida,";
      letterOrder3 = "SonSusLlantosYSusHeridas";
      letterOrder4 = "ElNaufragioDelCantor";
      break;

    case 3: 
      letterOrder1 = "EnvueltoEnSedaYHarapos,";
      letterOrder2 = "SiendoRey,HeroeOMendigo,";
      letterOrder3 = "Solo,ConCienOContigo,";
      letterOrder4 = "VuelvoSinNadaEnLasManos";
      break;

    case 4: 
      letterOrder1 = "TenemeEnSuCorazon,";
      letterOrder2 = "QueYoLaTendreEnElMio,";
      letterOrder3 = "NoMeVayaAOlvidar,";
      letterOrder4 = "NiPienseDeQueLaOlvido";
      break;

    case 5: 
      letterOrder1 = "YAlVerQueNoCazo";
      letterOrder2 = "NiUnaPaloma,";
      letterOrder3 = "MeSientoEnUnaPeña";
      letterOrder4 = "YMePongoALlorar";
      break;

    case 6: 
      letterOrder1 = "PalEnfermo,Medicina,";
      letterOrder2 = "PalNovato,AltaCiencia";
      letterOrder3 = "Esto,YMas,EsLaFlorencia,";
      letterOrder4 = "Esto,YMas,EsNuestraGina";
      break;

    case 7: 
      letterOrder1 = "Tu,QueTiernoAmorPrometiste,";
      letterOrder2 = "MeJurasteMilDichas,SinFin,";
      letterOrder3 = "LaVozDeOtro,ApenasOiste,";
      letterOrder4 = "TeOlvidasteMeAmabasAMi";
      break;

    case 8: 
      letterOrder1 = "CuandoAlMundoFuiARodar,";
      letterOrder2 = "Dije¡EnNombreSeaDeDios!,";
      letterOrder3 = "YaLaMaireSeAcabo,";
      letterOrder4 = "AhoraHayQueExperimentar";
      break;
    }

    letraChicaASCII.setupZero();
    letraChicaASCIIv2.setupZero();
    letraChicaASCIIv3.setupZero();

    letraChicaASCII02.setupZero();
    letraChicaASCII03.setupZero();
    letraMedianaASCII.setupZero();
  }



  //image(cam, 0, 0, width, height);
  // The following does the same as the above image() line, but 
  // is faster when just drawing the image without any additional 
  // resizing, transformations, or tint.
  //set(0, 0, atardecer);

  alphaVar = 0+4*((1+(sin(((frameCount + deltaTinte)/100)*PI/2)))/2);
  monoCromo = (sin(frameCount*PI/800)+1)*255/4;
  //  fill(monoCromo , alpha);

  fill(monoCromo, 12);
  rect(0, 0, width, height);
  noFill();


  letraChicaASCII.setupInicial();
  letraChicaASCIIv2.setupInicial();
  letraChicaASCIIv3.setupInicial();

  letraChicaASCII02.setupInicial();
  letraChicaASCII03.setupInicial();

  letraMedianaASCII.setupInicial();

  //////////////////

  letraChicaASCII02.dibujo();
  letraChicaASCII03.dibujo();

  letraChicaASCII02.dibujo();
  letraChicaASCII03.dibujo();

  letraChicaASCII02.dibujo();
  letraChicaASCII03.dibujo();

  letraChicaASCII.dibujo();
  letraChicaASCIIv2.dibujo();
  letraChicaASCIIv3.dibujo();

  letraChicaASCII.dibujo();
  letraChicaASCIIv2.dibujo();
  letraChicaASCIIv3.dibujo();

  letraChicaASCII02.dibujo();
  letraChicaASCII03.dibujo();

  letraChicaASCII02.dibujo();
  letraChicaASCII03.dibujo();

  letraChicaASCII02.dibujo();
  letraChicaASCII03.dibujo();

  letraChicaASCII.dibujo();
  letraChicaASCIIv2.dibujo();
  letraChicaASCIIv3.dibujo();

  letraChicaASCII.dibujo();
  letraChicaASCIIv2.dibujo();
  letraChicaASCIIv3.dibujo();

  letraMedianaASCII.dibujo();
  //letraMedianaASCII.dibujo();



  //println("frameCount: "+frameCount+" - frameRate: "+frameRate+" - alpha: "+alpha+" - monoCromo"+monoCromo);




  if (grabar)
  {
    saveFrame("frame/frame.####.jpg"); //tif todo el rato
  }

  //if (frameCount > 214)
  //{
  //  exit();
  //}


  //fill(r, g, b, alpha);
  //rect(0, 0, width, height);
  //noFill();

  tint(255, 8);
  image(atardecer, 0, 0, width, height);
  noTint();

  if (cheatScreen)
  {
  image(atardecer, 0, 0, width, height);
  }
}

void keyPressed()
{

  if (key == 'c')
  {
    cheatScreen = !cheatScreen;
  }

  if ( key ==  's' || key == 'g')
  {
    grabar = !grabar;
  }

  //if (key == 'q')
  //{
  //  r = r + 10;
  //}

  //if (key == 'w')
  //{
  //  g = g + 10;
  //}

  //if (key == 'e')
  //{
  //  b = b + 10;
  //}

  //if (key == 'z')
  //{
  //  r = r - 10;
  //}

  //if (key == 'x')
  //{
  //  g = g - 10;
  //}

  //if (key == 'c')
  //{
  //  b = b - 10;
  //}


  //if (key == 'o')
  //{
  //  alpha = alpha + 4;
  //}

  //if (key == 'l')
  //{
  //  alpha = alpha - 4;
  //}

  //println("r: "+r+" - g: "+g+" - b: "+b+" - alpha: "+alpha);
}
