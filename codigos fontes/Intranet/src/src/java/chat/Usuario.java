package chat;


public class Usuario {

   public Usuario( String nome )
   {
   }
   
   public Usuario(  )
   {
   }
   
   public String nome = null;
   public String ip = null;

   public static void main(String[] args)
   {
   }
   public String getNome() {
	   return nome;
   }
   public void setNome(String nome) {
      this.nome = nome;
   }

public String getIp() {
	return ip;
}

public void setIp(String ip) {
	this.ip = ip;
}


}