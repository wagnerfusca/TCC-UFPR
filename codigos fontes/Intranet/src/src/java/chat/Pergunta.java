package chat;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Pergunta {

   public Pergunta()
   {
	   
   }
   public Pergunta( Usuario usuario, String texto)
   {
      this.usuario = usuario;
      this.texto   = texto;
   }
   private Date data = new Date();
   private Usuario usuario;
   private String texto ;

   public static void main(String[] args) {
      Pergunta pergunta1 = new Pergunta();
   }
   public String getTexto() {
      return texto;
   }
   public Usuario getUsuario() {
      return usuario;
   }
   public void setTexto(String texto) {
      this.texto = texto;
   }
   public void setUsuario(Usuario usuario) {
      this.usuario = usuario;
   }

public String getData() {
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MMM/yy-hh:mm");
	return sdf.format(data);
}
}