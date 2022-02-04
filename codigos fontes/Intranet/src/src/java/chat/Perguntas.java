package chat;

import java.util.*;


public class Perguntas
{

   public ArrayList perguntas = new ArrayList();
   public ArrayList usuarios = new ArrayList();

   public Perguntas() 
   {
   }
   public void removeUsuario(Usuario usuario)
   {
	   this.usuarios.remove(usuario);
   }
 
   public void removePergunta(Pergunta pergunta)
   {
	   this.perguntas.remove(pergunta);
   }
   
   public void addPergunta( Pergunta pergunta )
   {
      this.perguntas.add(pergunta);
   }
      
  public void addUsuario( Usuario usuario )
  {
     this.usuarios.add(usuario);
  }
  
   public static void main(String[] args)
   {
   }

   
   public ArrayList getPerguntas()
   {
      return perguntas;
   }
   public ArrayList getUsuarios() 
   {
      return usuarios;
   }

   public String arrumaEspaco(String s, int tam) 
   {
		StringBuffer sb = new StringBuffer(s);
		while(sb.length() < tam)
			sb.append(" ");
		return sb.toString();	
	}
}