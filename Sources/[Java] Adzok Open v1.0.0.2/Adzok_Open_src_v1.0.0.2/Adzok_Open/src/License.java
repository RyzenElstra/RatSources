
/**
 *
 * @author AngelCruel
 */
import java.awt.BorderLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Formatter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;

public class License extends JFrame implements ActionListener {

    JButton accept;
    JCheckBox checkAccept, noMostrar;
    private static String license = "\r\n" +
    	"El presente documento es un contrato de licencia entre el usuario final y Adzok.com" + 
		"(en adelante denominado \"Adzok\") de la que usted pudo haber comprado, descargado u " +
		"obtenido a través de otros recursos o medios tales como CD-ROM, disquetes, ó/a través " +
		"de una red en forma de código objeto o otros servicios relacionados y productos " +
		"(en adelante, \"software\" y \"nuestro software\")." +
        "\r\n\r\n" +
		"Después de la lectura, se le pedirá que acepte simbólicamente este acuerdo para continuar " +
		"utilizando el software, o, si no desea aceptar este acuerdo, salgase, en cuyo caso no " +
		"será capaz de operar, instalar o usar el software. Al utilizar este software, usted " +
		"acepta todos los términos y condiciones de este acuerdo." +
        "\r\n\r\n" +
		"Al acceder, descargar, almacenar, cargar, instalar, ejecutar, visualizar, copiar el software" +
		"en la memoria de un ordenador o de otra forma, se benefician del uso de la funcionalidad " +
		"del software de acuerdo con la documentación, usted acepta que quedará vinculado por " +
		"los términos de este acuerdo. Si usted no está de acuerdo con los términos y condiciones " +
		"de este acuerdo, Adzok no está dispuesto a conceder el uso del software para usted. En tal " +
		"caso, no podrá operar o usar el software de ninguna manera." +
        "\r\n\r\n" +
		"Mediante la lectura y el uso de nuestro software se interpreta como un símbolo de su firma " +
		"y que por lo tanto su consentimiento obligado de este acuerdo y acepta que este es ejecutado " +
		"al igual que cualquier acuerdo negociado por escrito firmado por usted. Si usted no está " +
		"de acuerdo con todos los términos de este acuerdo por favor elimine el software de su " +
		"ordenador y no lo use bajo ninguna circunstancia." +
        "\r\n\r\n" +
		"Mediante la ejecución de este software, usted está dando su consentimiento obligado de " +
		"este acuerdo. A la terminación de este acuerdo, usted ya no estará autorizado para operar " +
		"o usar el software de ninguna manera. El software no se ejecutará en el equipo a menos " +
		"que acepte los términos de este acuerdo." +
        "\r\n\r\n" +
		"1. DERECHOS DE PROPIEDAD INTELECTUAL." +
        "\r\n\r\n" +
		"Usted acepta que el software y las ideas asociadas, métodos de operación, documentación " +
		"y otra información contenida en el software, son propiedad intelectual de Adzok. " +
		"Usted reconoce que el código fuente del software es propiedad de Adzok. Usted se " +
		"compromete a no modificar, adaptar, traducir, realizar ingeniería inversa, descompilar, " +
		"desmontar o tratar de descubrir el código fuente del software. No puedes eliminar " +
		"ningún aviso de propiedad o etiquetas en el software." +
        "\r\n\r\n" +
		"2. LICENCIA DEL SOFTWARE" +
        "\r\n\r\n" +
		"El software está protegido por leyes y por tratados internacionales en materia de derechos " +
		"de autor, así como por otras leyes y tratados sobre propiedad intelectual e industrial. Esto " +
		"es una Licencia y no una \"venta\" del software. Adzok le otorga el derecho no exclusivo de " +
		"utilizar esta copia del software." +
        "\r\n\r\n" +
		"3. USO." +
        "\r\n\r\n" +
		"Adzok concede permiso para almacenar, cargar, instalar y ejecutar la versión especificada " +
		"del software en un número ilimitado de ordenadores, estaciones de trabajo, " +
		"asistentes personales digitales, teléfonos móviles, dispositivos portátiles u otros " +
		"dispositivos electrónicos para el cual el software fue diseñado suponiendo que esté " +
		"en conformidad con los términos y condiciones establecidos en este acuerdo. Al aceptar " +
		"este acuerdo, usted se compromete a no utilizar el software para:" +
        "\r\n\r\n" +
		"a.) El acceso no autorizado a sistemas informáticos o dispositivos electrónicos. usted, " +
		"el usuario, tendrán que rendir cuentas por el uso del software para obtener acceso no " +
		"autorizado a cualquier sistema informático o dispositivo. Al utilizar el software en un " +
		"equipo que no está autorizado para hacerlo, usted está violando los términos de esta " +
		"licencia y por lo tanto, el usuario, esta de acuerdo en aceptar la plena responsabilidad " +
		"de las consecuencias del mal uso del software." +
        "\r\n\r\n" +
		"b.) Poner en peligro la seguridad pública. usted acepta que el software de ninguna " +
		"manera o forma puede utilizar para poner en peligro público o de cometer cualquier " +
		"tipo de actividad ilícita. Propagación de aplicaciones agrede con fines maliciosos " +
		"o dañinos es un delito que se castiga con una multa o encarcelamiento. Al usar software " +
		"de productos de Adzok para fines maliciosos usted está violando los términos y " +
		"condiciones establecidos en este acuerdo y por lo tanto acepta la plena responsabilidad " +
		"de las consecuencias que puedan derivarse de sus acciones." +
        "\r\n\r\n" +
		"4. GARANTÍA LIMITADA." +
        "\r\n\r\n" +
		"El software se proporciona \"TAL CUAL\", sin ningún tipo de garantía, ya sea explícita o " +
		"implícita, incluyendo (entre otros) las garantías implícitas en cuanto a su uso mercantil," +
		"a su conveniencia para un propósito en particular o ausencia de infracción. Usted asume " +
		"todo riesgo que surja de la utilización o del rendimiento del software. Adzok no le " +
		"garantiza que las funcionalidades incluidas en el software estén libres de errores o " +
		"que puedan funcionar sin interrupción.	Si el software resultara defectuoso en cualquier " +
		"aspecto, el usuario, no Adzok o cualquiera de sus empleados o asociados y revendedores, " +
		"deberá asumir el costo de cualquier servicio y reparación." +
        "\r\n\r\n" +
		"5. LIMITACIÓN DE LA RESPONSABILIDAD." +
        "\r\n\r\n" +
		"Adzok no será responsable de ningún error del software que sea producto de accidentes, " +
		"abusos, malos usos, o modificaciones sin el permiso adecuado. En ningún caso Adzok " +
		"será responsable de daños indirectos, especiales, incidentales o consecuenciales " +
		"(incluyendo, entre otros, los daños relacionados con la pérdida de beneficios, " +
		"interrupción del negicio, con la pérdida de información o con cualquiero tipo de " +
		"pérdida) que se deriven del uso, o de la capacidad de usarlo, del producto de software," +
		"aun en el caso de que se hubiera informado a Adzok de la posibilidad de tales daños." +
        "\r\n\r\n" +
		"5,1 SIN GARANTÍAS IMPLÍCITAS O DE OTRO TIPO." +
        "\r\n\r\n" +
		"El software se proporciona \"TAL CUAL\", sin ningún tipo de garantía. Adzok no da, en " +
		"cualquier expresión, ya sea explícita o implícita, ninguna garantía, reclamaciones " +
		"o representaciones con respecto al software, incluyendo, pero sin limitarse, " +
		"garantías de calidad, rendimiento, infracciones, comerciabilidad o aptitud de uso o " +
		"un fin particular. Adzok adicionalmente no representa ni garantiza que el software " +
		"estará siempre disponible, accesible, interrumpible, adecuado, seguro, correcto, " +
		"completo y sin errores, Adzok no garantiza cualquier conexión o transmisión a través " +
		"de Internet utilizando el software." +
        "\r\n\r\n" +
		"Usted asume todos los riesgos y responsabilidades para la selección del software " +
		"para lograr los resultados deseados, por la instalación, uso y resultados obtenidos " +
		"del software. Adzok no garantiza que el software esté libre de errores, " +
		"interrupciones o averías, o de que es compatible con cualquier hardware o software, " +
		"en la máxima medida permitida por la ley aplicable, Adzok rechaza cualquier garantía," +
		"ya sea explícita o implícita, incluyendo, pero sin limitarse a las garantías " +
		"implícitas de comerciabilidad, no infrigiendo derechos de terceros, integración, " +
		"calidad satisfactoria o aptitud para un cualquier propósito particular con respecto " +
		"al software y los materiales escritos que lo acompañan o el uso del mismo. Por lo " +
		"tanto, Adzok expresamente renuncia a cualquier garantía explícita o implícita " +
		"con respecto a la disponibilidad del sistema, la accesibilidad, o el rendimiento." +
        "\r\n\r\n" +
		"Adzok se exime de toda responsabilidad por la pérdida de datos durante las " +
		"comunicaciones y cualquier responsabilidad que surja relacionados con cualquier " +
		"incumplimiento por parte de Adzok para transmitir información precisa o " +
		"completa a usted." +
        "\r\n\r\n" +
		"5.2 RESPONSABILIDAD LIMITADA, NO SE HACE RESPONSABLE POR DAÑOS." +
        "\r\n\r\n" +
		"Adzok no será responsable por el usuario o cualquiera tercera parte, sin limitarse a," +
		"daños por incapacidad en el uso del software o la pérdida de beneficios, " +
		"interrupción del negicio, computador falla o funciona mal o cualquiera y " +
		"todos los demás daños, pérdidas de datos ó con cualquiero tipo de pérdida, " +
		"que surja del uso o la incapacidad para utilizar el software y en a base cualquier " +
		"teoría de responsabilidad, incluyendo incumplimiento de contrato, incumplimiento " +
		"de garantía, agravio (incluyendo negligencia), responsabilidad por productos " +
		"defectuosos o de otra forma.";

    public License() {

        String temp = "";
        File f = new File("Licencia.txt");
        if (f.exists()) {
            try {
                FileReader fr = new FileReader(new File("Licencia.txt"));
                BufferedReader br = new BufferedReader(fr);

                String temp2;
                temp = temp + br.readLine();
                while ((temp2 = br.readLine()) != null) {
                    temp = temp + "\r\n";
                    temp = temp + temp2;
                }

                if (license.equals(temp)) {
                    cliente cl = new cliente();
                    cl.funIniciar();
                } else {
                    Mostrar();
                }
            } catch (IOException ex) {
                Logger.getLogger(License.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            Mostrar();
        }
    }

    public void Mostrar() {
        setLayout(new BorderLayout());
        setTitle("Licencia de Usuario Final");
        setSize(600, 625);
        setIconImage(new ImageIcon(getClass().getResource("resources/icono.png")).getImage());

        JTextArea text = new JTextArea();
        text.setLineWrap(true);
        text.setWrapStyleWord(true);
        text.setText(license);
        text.setEditable(false);
        add("Center", new JScrollPane(text));

        JPanel check = new JPanel(new GridLayout(3, 1, 0, 0));
        checkAccept = new JCheckBox("Acepto los terminos y condiciones para usar este software");
        check.add(checkAccept);
        noMostrar = new JCheckBox("No volver a mostrar este mensaje");
        check.add(noMostrar);

        JPanel botones = new JPanel();
        accept = new JButton("Accept");
        accept.addActionListener(this);
        botones.add(accept);
        check.add(botones);
        add("South", check);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setVisible(true);
    }

    public void guardar() {
        Formatter archivo = null;
        try {
            archivo = new Formatter("Licencia.txt");
        } catch (FileNotFoundException ex) {
            Logger.getLogger(License.class.getName()).log(Level.SEVERE, null, ex);
        }
        archivo.format("%s", license);
        archivo.flush();
        archivo.close();
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource() == accept) {
            if (noMostrar.isSelected() && checkAccept.isSelected()) {
                setVisible(false);
                guardar();
                cliente cl = new cliente();
                cl.funIniciar();
            } else if (checkAccept.isSelected()) {
                setVisible(false);
                cliente cl = new cliente();
                cl.funIniciar();
            } else {
                System.exit(0);
            }
        }
    }
}
