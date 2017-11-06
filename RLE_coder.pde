PImage img;
int mat[][];
int matdecode[][];

int noire=0,blanc=0;
int tab[][];
int colorr;
PrintWriter output;
boolean first=false,b=true,bb=true;

String code="",code1="";
int hexa=0,cpt;
int h,w;
void setup()
{
  
   img=loadImage("img2.bmp");
    h=img.height;
    w =img.width;
 size(900,313);
  mat = new int [w][h];
  matdecode= new int[w][h];
  tab= new int[img.pixels.length][2];
  colorr=0;
  
  output= createWriter("code.txt");
  output.println(h);
  output.println(w);
  
  for (int i=0; i<h; i++) {
    for (int j=0; j<w; j++) {
      if(color(img.pixels[i*img.width+j])==color(0)) mat[j][i]=0;
      else if(color(img.pixels[i*img.width+j])==color(255)) mat[j][i]=1;
    }
  }
  
}

void draw()
{
  if(!first){
    tab[colorr][0]=mat[0][0];
    tab[colorr][1]=0;
  for (int i=0; i<h; i++) {
    for (int j=0; j<w; j++) {
      //remplir tableau
      if(tab[colorr][0]!=mat[j][i])
      {
        colorr++;
        tab[colorr][0]=mat[j][i];
        tab[colorr][1]=1;
      }
      else{
      if(tab[colorr][1]>= 32767)
      {
        colorr++;
        tab[colorr][0]=mat[j][i];
        tab[colorr][1]=1;
      }
        tab[colorr][1]++;
      }
    }
  }
  }
  first=true;
  if(b)
     { codage(tab);
      //print(code,"\n");}
  }  
  b=false;
 }