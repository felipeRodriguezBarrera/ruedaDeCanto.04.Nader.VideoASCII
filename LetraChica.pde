class LetraChica
{
  PFont font;
  float fontSize = 1.012; //1.4
  float divisor = 21;
  float numeroRandom;
  int contador;
  int intRandom; 
  int colorFondo = 255;
  int turno = 0;

  int faseTexto = 0;
  boolean escribirFrase = true; 
  boolean escribirTotal = true; 


  float hgap, vgap;

  int deltaTint;

  PImage frame;

  float fluir;

  LetraChica()
  {



    fontSize = 1.0*(random(1, 1.2)); //1.4

    deltaTint = (int)random(2550);
    contador = 1;

    font = loadFont("UniversLTStd-Light-48.vlw");

    println("Pasó esta gueá!!!!");


    hgap = divisor*(float)width / anchoVideo;
    vgap = divisor*(float)height / altoVideo;

    frame = createImage((int)(anchoVideo/divisor), (int)(altoVideo/divisor), ARGB);



    // atardecer = loadImage("fotoBaseProcessing.png");
    //atardecer = loadImage("GinaFlorencia.jpg");
    //atardecer = loadImage("afiche.ruedaDeCanto.jpg");



    fluir = random(8142);
  }

  void setupZero()
  {
    frame.copy(atardecer, 0, 0, (int)anchoVideo, (int)altoVideo, 0, 0, (int)(anchoVideo/divisor), (int)(altoVideo/divisor));
  }

  void setupInicial()
  {
    numeroRandom = random(1.8*rate, 8.4*rate);
    intRandom = (int)random(1.8*rate, 8.1*rate);
  }


  void dibujo()
  {

    if (random(100) < 12)
    {
      pushMatrix();
      scale(max(hgap, vgap) * fontSize);

      textFont(font, fontSize*(random(500, 1500))/1000);

      int index = 0;
      frame.loadPixels();
      for (int y = 1; y < frame.height; y++) {

        // Move down for next line
        translate(0, 1.0/fontSize);

        pushMatrix();
        for (int x = 0; x < frame.width; x++) {
          int pixelColor = frame.pixels[index];

          /////////////////////////////////////////
          /////////////////////////////////////////
          /////////////////////////////////////////
          /////////////////////////////////////////
          /////////////////////////////////////////

          fill(pixelColor, random(41, 141));

          //////////////////////////////////////////
          /////////////////////////////////////////
          /////////////////////////////////////////
          /////////////////////////////////////////
          /////////////////////////////////////////

          if (frameCount%intRandom == 0)
          {
            println("numero de cambios: "+contador);
            contador ++;
            intRandom = (int)random(1, 0.8*rate);
            //        println("intervalo en segundos: "+(float)intRandom/rate);

            turno = (int)random(4);
            faseTexto = frameCount%min(letterOrder1.length(), letterOrder2.length());
          }

          //CAMBIO

          if ( (index+faseTexto)%letterOrder1.length() == 0)
          {
            if (random(100) < 6+2*sin(4*(((fluir+frameCount)%814)/814)*PI/2))
            {
              escribirFrase = true;
            } else
            {
              escribirFrase = false;
            }
          }
          if (escribirFrase)
          {
            if (turno == 0)
            {
              text(letterOrder1.charAt((index+faseTexto)%letterOrder1.length()), 0, 0);
              //          println("El Miedo");
            } else if (turno == 1)
            {
              text(letterOrder2.charAt((index+faseTexto)%letterOrder2.length()), 0, 0);
              //          println("Trocando Ausencias");
            } else if (turno == 2)
            {
              text(letterOrder3.charAt((index+faseTexto)%letterOrder3.length()), 0, 0);
              //          println("Trocando Ausencias");
            } else if (turno == 3)
            {
              text(letterOrder4.charAt((index+faseTexto)%letterOrder4.length()), 0, 0);
              //          println("Trocando Ausencias");
            }
          }

          ///////////////

          index++;

          // Move over for next character
          translate(1.0/fontSize, 0);
        }
        popMatrix();
      }
      popMatrix();
    }
  }
}
