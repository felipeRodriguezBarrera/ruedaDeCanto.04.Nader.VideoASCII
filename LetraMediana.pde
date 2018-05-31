class LetraMediana
{
  PFont font;
  float fontSize = 1.8; //1.4
  float divisor = 21;
  float numeroRandom;
  int contador;
  int intRandom; 
  int colorFondo = 255;
  int turno = -1;

  int faseTexto = 0;
  boolean escribirFrase1, escribirFrase2, escribirFrase3, escribirFrase4 = true; 


  float hgap, vgap;



  PImage frame;

  LetraMediana()
  {
    numeroRandom = random(1.4*rate, 2.4*rate);
    intRandom = (int)random(1.8*rate, 2.4*rate);

    contador = 1;

    font = loadFont("UniversLTStd-Light-48.vlw");

    hgap = divisor*(float)width / anchoVideo;
    vgap = divisor*(float)height / altoVideo;

    frame = createImage((int)(anchoVideo/divisor), (int)(altoVideo/divisor), ARGB);
  }

  void setupZero()
  {
    frame.copy(atardecer, 0, 0, (int)anchoVideo, (int)altoVideo, 0, 0, (int)(anchoVideo/divisor), (int)(altoVideo/divisor));
  }

  void setupInicial()
  {
  }


  void dibujo()
  {


    if (random(100) < 18)
    {
      turno++;
      if (turno == 4)
      {
        turno=0;
      }

      pushMatrix();
      scale(max(hgap, vgap) * fontSize);

      textFont(font, fontSize*(random(900, 1100))/1000);

      int index = 0;
      frame.loadPixels();
      for (int y = 1; y < frame.height; y++) {

        // Move down for next line
        translate(0, 4.8/fontSize);

        pushMatrix();
        for (int x = 0; x < frame.width; x++) {
          int pixelColor = frame.pixels[index];

          /////////////////////////////////////////
          /////////////////////////////////////////
          /////////////////////////////////////////
          /////////////////////////////////////////
          /////////////////////////////////////////

          fill(pixelColor, random(141, 255));

          //////////////////////////////////////////
          /////////////////////////////////////////
          /////////////////////////////////////////
          /////////////////////////////////////////
          /////////////////////////////////////////

          if (frameCount%intRandom == 0)
          {
            numeroRandom = random(2.4*rate, 8.4*rate);
            intRandom = (int)random(2.8*rate, 8.4*rate);

            println("numero de cambios: "+contador);
            contador ++;

            faseTexto = frameCount%min(letterOrder1.length(), letterOrder2.length());
          }

          /////////////////////
          //CAMBIO

          if ( (index+faseTexto)%letterOrder1.length() == 0)
          {          
            if (random(100) < 0.41)
            {
              escribirFrase1 = true;
            } else
            {
              escribirFrase1 = false;
            }
          }
          if (turno == 0 && escribirFrase1)
          {
            text(letterOrder1.charAt((index+faseTexto)%letterOrder1.length()), 0, 0);
          }

          if ( (index+faseTexto)%letterOrder2.length() == 0)
          {          
            if (random(100) < 1)
            {
              escribirFrase2 = true;
            } else
            {
              escribirFrase2 = false;
            }
          }
          if (turno == 1 && escribirFrase2)
          {
            text(letterOrder2.charAt((index+faseTexto)%letterOrder2.length()), 0, 0);
          }

          if ( (index+faseTexto)%letterOrder3.length() == 0)
          {          
            if (random(100) < 1)
            {
              escribirFrase3 = true;
            } else
            {
              escribirFrase3 = false;
            }
          }
          if (turno == 2 && escribirFrase3)
          {
            text(letterOrder3.charAt((index+faseTexto)%letterOrder3.length()), 0, 0);
          }

          if ( (index+faseTexto)%letterOrder4.length() == 0)
          {          
            if (random(100) < 1)
            {
              escribirFrase4 = true;
            } else
            {
              escribirFrase4 = false;
            }
          }
          if (turno == 3 && escribirFrase4)
          {
            text(letterOrder4.charAt((index+faseTexto)%letterOrder4.length()), 0, 0);
          }
          ///////////////

          index++;

          // Move over for next character
          translate(4.8/fontSize, 0);
        }
        popMatrix();
      }
      popMatrix();
    }
  }
}
