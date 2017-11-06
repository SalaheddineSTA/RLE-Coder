void codage(int [][] tab)
{
  
  for (int i=0; i<=colorr; i++) {            
      if(tab[i][1]>=3){ 
             if(cpt>0){
              hexa=0;
              code+=hex(cpt,4)+"H "+code1 +"";
              cpt=0;
              code1="";
             }
            hexa=32768;
             if(tab[i][0]==0)
              code+=hex(hexa+tab[i][1],4)+"H "+hex(0,2)+"H ";
              else 
                  code+=hex(hexa+tab[i][1],4)+"H "+hex(255,2)+"H ";
         }
          else {
               for(int j=0;j<tab[i][1];j++)
               {
                  if(tab[i][0]==0) 
                                code1+=hex(0,2)+"H ";
                 else    
                     code1+=hex(255,2)+"H ";
               }
               cpt+=tab[i][1];
            }
            if(i==colorr && cpt>0) 
            code+=hex(cpt,4)+"H "+code1 +"";
  }
  output.println(code);
  output.flush();
  output.close();
}