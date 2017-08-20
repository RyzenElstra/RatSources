
/**
 *
 * @author AngelCruel
 */
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class RecursoClientes {
    
    private boolean disponible = true;
    private ArrayList<ManejadorCliente> lista;
    private static RecursoClientes recurso = new RecursoClientes();
    
    private RecursoClientes() {
        lista = new ArrayList<ManejadorCliente>();
    }
    
    public static synchronized RecursoClientes getInstance() {
        return recurso;
    }
    
    public synchronized void addManejadorCliente(ManejadorCliente cliente) {
        while (!disponible) {
            try {
                wait();
            } catch (InterruptedException ex) {
                Logger.getLogger(RecursoClientes.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        disponible = false;
        notify();
        
        lista.add(cliente);
        
        disponible = true;
        notify();
    }
    
    public synchronized void removeManejadorCliente(ManejadorCliente mcliente) {
        while (!disponible) {
            try {
                wait();
            } catch (InterruptedException ex) {
                Logger.getLogger(RecursoClientes.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        disponible = false;
        notify();
        
        mcliente.guiOpciones.setVisible(false);
        lista.remove(mcliente);
        cliente.actualizarLista();
        
        disponible = true;
        notify();
    }
    
    public synchronized ManejadorCliente getManejadorCliente(int indice) {
        return lista.get(indice);
    }
    
    public synchronized int size() {
        return lista.size();
    }
}
