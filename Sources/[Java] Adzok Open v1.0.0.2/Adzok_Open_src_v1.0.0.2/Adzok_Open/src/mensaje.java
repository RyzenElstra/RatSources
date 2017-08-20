
/**
 *
 * @author AngelCruel
 */
import java.io.Serializable;

public class mensaje implements Serializable {

    private byte archivo[];
    private String mensaje;
    private StringBuffer bufferMensaje;
    private int dato;
    private String tipo;

    public mensaje() {
    }

    public byte[] getArchivo() {
        return archivo;
    }

    public void setArchivo(byte[] archivo) {
        this.archivo = archivo;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public StringBuffer getBufferMensaje() {
        return bufferMensaje;
    }

    public void setBufferMensaje(StringBuffer bufferMensaje) {
        this.bufferMensaje = bufferMensaje;
    }

    public int getDato() {
        return dato;
    }

    public void setDato(int dato) {
        this.dato = dato;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
}