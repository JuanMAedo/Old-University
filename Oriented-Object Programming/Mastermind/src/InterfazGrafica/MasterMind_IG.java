/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package InterfazGrafica;

/**
 *
 * @author juanm
 */
import Principal.*;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;



public class MasterMind_IG extends javax.swing.JFrame {

    private AlmacenLogin almacenUsuarios;
    private Usuario usuario1,usuario2;
    private int rondasIG;
    private int intentosIG;
    private FileOutputStream Fichero1;
    private ObjectOutputStream Usuario_Escritura;
    private FileInputStream Fichero2; 
    private ObjectInputStream Usuario_Lectura;
    
    
    public MasterMind_IG() throws IOException, ClassNotFoundException {
        almacenUsuarios = CargarAlmacen();
        rondasIG = 6;
        intentosIG = 10;
        RegistarIdentificar_IG RegistrarIdentificar = new RegistarIdentificar_IG(almacenUsuarios);
        JOptionPane.showConfirmDialog(this, RegistrarIdentificar, "Registrar-Identificar",JOptionPane.OK_CANCEL_OPTION, JOptionPane.PLAIN_MESSAGE);
        usuario1 = RegistrarIdentificar.getUsuarioIdentReg();
        initComponents();
        jLabel2.setText(usuario1.GetUsuario()); 
        if (!usuario1.GetAdministrador()){BotConfiguracion.setEnabled(false); BotConfiguracion.setToolTipText("Sólo un administrador puede modificar la configuración");}
        SalirGuardando();
    }
    
    public  boolean indicarAdmin(){
        return(usuario1.GetAdministrador());
    }
    
    public AlmacenLogin GetAlmacenUsuarios(){return(almacenUsuarios);}
   
    public AlmacenLogin CargarAlmacen() throws IOException, ClassNotFoundException{
        return(cargarFichero("FicheroDatos.dat"));
    }
   public void SalirGuardando() {
       try{
            this.setDefaultCloseOperation(javax.swing.WindowConstants.DO_NOTHING_ON_CLOSE);
            addWindowListener (new WindowAdapter() {
                public void windowClosing(WindowEvent e){
                    try {
                        Salida();
                    } catch (IOException ex) {
                        Logger.getLogger(MasterMind_IG.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            });
         }catch(Exception ex){
           ex.printStackTrace();}
    }
    
    public void Salida() throws IOException{
        int valor = JOptionPane.showConfirmDialog(this,"¿Quieres guardar los datos de la sesión en un fichero?", "Salida  Guardando datos", JOptionPane.YES_NO_OPTION);
        if (valor == JOptionPane.YES_OPTION){
            FicheroNombre_IG FicherNombre = new FicheroNombre_IG();
            JOptionPane.showConfirmDialog(this,FicherNombre,"Nombre Fichero",JOptionPane.PLAIN_MESSAGE);
            String a = FicherNombre.getFichero();
            try{
                guardarFichero(a);
                
                System.exit(0);
            } catch (IOException ex) {
            }
        } else if(valor == JOptionPane.NO_OPTION){
            guardarFichero("FicheroDatos");
            System.exit(0);
        }
    }
    private void  AbrirFicheroEscritura(String nombreFichero) throws IOException{
        String nombre = nombreFichero + ".dat";
        Fichero1 = new FileOutputStream(nombre);
        Usuario_Escritura = new ObjectOutputStream(Fichero1);
    }

    private void CerrarFicheroEscritura() throws IOException{
        if(Usuario_Escritura != null)
            Usuario_Escritura.close();
    }

    private void EscribirFichero() throws IOException{
         if(Usuario_Escritura != null)
            Usuario_Escritura.writeObject(almacenUsuarios);
    }
    private void AbrirFicheroLectura(String nombreFichero) throws IOException{
        Fichero2 = new FileInputStream(nombreFichero);
        Usuario_Lectura = new ObjectInputStream(Fichero2);
    }
    private void CerrarFicheroLectura() throws IOException{
        if (Usuario_Lectura != null){
            Usuario_Lectura.close();
        }
    }
    private AlmacenLogin LecturaFichero() throws IOException, ClassNotFoundException {
        AlmacenLogin almacenAux = null;
        if (Usuario_Lectura != null){
            try{
                almacenAux = (AlmacenLogin) Usuario_Lectura.readObject();
            }catch (EOFException eof){}
        }
        return almacenAux;
    }
    public AlmacenLogin cargarFichero(String nombreFichero) throws IOException, ClassNotFoundException{
       AbrirFicheroLectura(nombreFichero);
       AlmacenLogin a = LecturaFichero();
       CerrarFicheroLectura();
       return a;
    }
    
    public void guardarFichero(String nombreFichero) throws IOException{
        AbrirFicheroEscritura(nombreFichero);
        EscribirFichero();
        CerrarFicheroEscritura();
    }         

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jButton1 = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        BotEntrenamiento = new javax.swing.JButton();
        BotEstadisticasPers = new javax.swing.JButton();
        BotPartida1v1 = new javax.swing.JButton();
        BotClasificacion = new javax.swing.JButton();
        BotConfiguracion = new javax.swing.JButton();
        BotRegistro = new javax.swing.JButton();
        BotIdentificar = new javax.swing.JButton();
        jLabel2 = new javax.swing.JLabel();

        jButton1.setText("jButton1");

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("MasterMind Grupo E");
        setBackground(new java.awt.Color(255, 255, 255));
        setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        setResizable(false);

        jLabel1.setFont(new java.awt.Font("Tempus Sans ITC", 3, 24)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(102, 102, 0));
        jLabel1.setText("USUARIO REGISTRADO:");

        jLabel4.setFont(new java.awt.Font("Tempus Sans ITC", 1, 24)); // NOI18N
        jLabel4.setForeground(new java.awt.Color(102, 102, 0));
        jLabel4.setText("MENÚ");

        BotEntrenamiento.setBackground(new java.awt.Color(102, 102, 0));
        BotEntrenamiento.setFont(new java.awt.Font("Dialog", 1, 18)); // NOI18N
        BotEntrenamiento.setForeground(new java.awt.Color(0, 0, 0));
        BotEntrenamiento.setText("Partida Entrenamiento");
        BotEntrenamiento.setBorder(javax.swing.BorderFactory.createBevelBorder(javax.swing.border.BevelBorder.RAISED));
        BotEntrenamiento.setBorderPainted(false);
        BotEntrenamiento.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BotEntrenamientoActionPerformed(evt);
            }
        });

        BotEstadisticasPers.setBackground(new java.awt.Color(102, 102, 0));
        BotEstadisticasPers.setFont(new java.awt.Font("Dialog", 1, 18)); // NOI18N
        BotEstadisticasPers.setForeground(new java.awt.Color(0, 0, 0));
        BotEstadisticasPers.setText("Estadísticas Personales");
        BotEstadisticasPers.setBorder(javax.swing.BorderFactory.createBevelBorder(javax.swing.border.BevelBorder.RAISED));
        BotEstadisticasPers.setBorderPainted(false);
        BotEstadisticasPers.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BotEstadisticasPersActionPerformed(evt);
            }
        });

        BotPartida1v1.setBackground(new java.awt.Color(102, 102, 0));
        BotPartida1v1.setFont(new java.awt.Font("Dialog", 1, 18)); // NOI18N
        BotPartida1v1.setForeground(new java.awt.Color(0, 0, 0));
        BotPartida1v1.setText("Partida 1v1");
        BotPartida1v1.setBorder(javax.swing.BorderFactory.createBevelBorder(javax.swing.border.BevelBorder.RAISED));
        BotPartida1v1.setBorderPainted(false);
        BotPartida1v1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BotPartida1v1ActionPerformed(evt);
            }
        });

        BotClasificacion.setBackground(new java.awt.Color(102, 102, 0));
        BotClasificacion.setFont(new java.awt.Font("Dialog", 1, 18)); // NOI18N
        BotClasificacion.setForeground(new java.awt.Color(0, 0, 0));
        BotClasificacion.setText("Clasificación");
        BotClasificacion.setBorder(javax.swing.BorderFactory.createBevelBorder(javax.swing.border.BevelBorder.RAISED));
        BotClasificacion.setBorderPainted(false);
        BotClasificacion.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BotClasificacionActionPerformed(evt);
            }
        });

        BotConfiguracion.setBackground(new java.awt.Color(102, 102, 0));
        BotConfiguracion.setFont(new java.awt.Font("Dialog", 1, 18)); // NOI18N
        BotConfiguracion.setForeground(new java.awt.Color(0, 0, 0));
        BotConfiguracion.setText("Configuración");
        BotConfiguracion.setBorder(javax.swing.BorderFactory.createBevelBorder(javax.swing.border.BevelBorder.RAISED));
        BotConfiguracion.setBorderPainted(false);
        BotConfiguracion.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BotConfiguracionActionPerformed(evt);
            }
        });

        BotRegistro.setBackground(new java.awt.Color(102, 102, 0));
        BotRegistro.setFont(new java.awt.Font("Dialog", 1, 18)); // NOI18N
        BotRegistro.setForeground(new java.awt.Color(0, 0, 0));
        BotRegistro.setText("Registro");
        BotRegistro.setBorder(javax.swing.BorderFactory.createBevelBorder(javax.swing.border.BevelBorder.RAISED));
        BotRegistro.setBorderPainted(false);
        BotRegistro.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BotRegistroActionPerformed(evt);
            }
        });

        BotIdentificar.setBackground(new java.awt.Color(102, 102, 0));
        BotIdentificar.setFont(new java.awt.Font("Dialog", 1, 18)); // NOI18N
        BotIdentificar.setForeground(new java.awt.Color(0, 0, 0));
        BotIdentificar.setText("Identificar");
        BotIdentificar.setBorder(javax.swing.BorderFactory.createBevelBorder(javax.swing.border.BevelBorder.RAISED));
        BotIdentificar.setBorderPainted(false);
        BotIdentificar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BotIdentificarActionPerformed(evt);
            }
        });

        jLabel2.setFont(new java.awt.Font("Tempus Sans ITC", 3, 24)); // NOI18N
        jLabel2.setForeground(new java.awt.Color(102, 102, 0));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(171, 171, 171)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(BotConfiguracion, javax.swing.GroupLayout.PREFERRED_SIZE, 235, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(BotClasificacion, javax.swing.GroupLayout.PREFERRED_SIZE, 235, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(BotPartida1v1, javax.swing.GroupLayout.PREFERRED_SIZE, 235, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(BotEntrenamiento, javax.swing.GroupLayout.PREFERRED_SIZE, 235, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(BotEstadisticasPers, javax.swing.GroupLayout.PREFERRED_SIZE, 235, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(0, 0, Short.MAX_VALUE))
            .addGroup(layout.createSequentialGroup()
                .addContainerGap(41, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(BotIdentificar, javax.swing.GroupLayout.PREFERRED_SIZE, 193, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(68, 68, 68)
                        .addComponent(BotRegistro, javax.swing.GroupLayout.PREFERRED_SIZE, 195, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 293, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 141, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(55, Short.MAX_VALUE))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jLabel4, javax.swing.GroupLayout.PREFERRED_SIZE, 96, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(225, 225, 225))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(10, 10, 10)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 33, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 27, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 27, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(BotRegistro, javax.swing.GroupLayout.PREFERRED_SIZE, 47, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(BotIdentificar, javax.swing.GroupLayout.PREFERRED_SIZE, 47, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addComponent(jLabel4)
                .addGap(18, 18, 18)
                .addComponent(BotEstadisticasPers, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(27, 27, 27)
                .addComponent(BotEntrenamiento, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(26, 26, 26)
                .addComponent(BotPartida1v1, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(27, 27, 27)
                .addComponent(BotClasificacion, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(28, 28, 28)
                .addComponent(BotConfiguracion, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(31, 31, 31))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void BotEstadisticasPersActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BotEstadisticasPersActionPerformed
        EstadisticasPersonales_IG e = new EstadisticasPersonales_IG(this,true,usuario1);
        e.rellenar(usuario1);
        e.setVisible(true);
    }//GEN-LAST:event_BotEstadisticasPersActionPerformed

    private void BotClasificacionActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BotClasificacionActionPerformed
       Clasificacion_IG c = new Clasificacion_IG(almacenUsuarios,usuario1);
       JOptionPane.showConfirmDialog(this, c, "Clasificación MasterMind",JOptionPane.OK_CANCEL_OPTION, JOptionPane.PLAIN_MESSAGE);
    }//GEN-LAST:event_BotClasificacionActionPerformed

    private void BotEntrenamientoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BotEntrenamientoActionPerformed
       IntroducirIntentos_IG intenIG = new IntroducirIntentos_IG();
       if (JOptionPane.showConfirmDialog(this, intenIG, "Entrenamiento MasterMind",JOptionPane.OK_CANCEL_OPTION, JOptionPane.PLAIN_MESSAGE) == JOptionPane.OK_OPTION){
            int numer = intenIG.GetNumIntentos();
            Entrenamiento_IG e = new Entrenamiento_IG(indicarAdmin(), numer);
           JOptionPane.showConfirmDialog(this, e, "Entrenamiento MasterMind",JOptionPane.OK_CANCEL_OPTION, JOptionPane.PLAIN_MESSAGE);
       }
    }//GEN-LAST:event_BotEntrenamientoActionPerformed

    private void BotConfiguracionActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BotConfiguracionActionPerformed
       Configuracion_IG c = new Configuracion_IG(rondasIG,intentosIG); 
       if(JOptionPane.showConfirmDialog(this, c, "Entrenamiento MasterMind",JOptionPane.OK_CANCEL_OPTION, JOptionPane.PLAIN_MESSAGE) == JOptionPane.OK_OPTION){
           rondasIG = c.getRondas();
           intentosIG = c.getIntentos();
       }
       
    }//GEN-LAST:event_BotConfiguracionActionPerformed

    private void BotRegistroActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BotRegistroActionPerformed
       Registrarse_IG a = new Registrarse_IG();
       if(JOptionPane.showConfirmDialog(this, a, "Registrarse",JOptionPane.OK_CANCEL_OPTION, JOptionPane.PLAIN_MESSAGE) == JOptionPane.OK_OPTION){
            Usuario u = a.getUsuario();
             if(almacenUsuarios.registrar(u)){
                JOptionPane.showConfirmDialog(this, "Usuario registrado correctamente, bienvenido " + u.GetUsuario(), "Confirmar Usuario Registrado", JOptionPane.OK_OPTION, JOptionPane.INFORMATION_MESSAGE);
                usuario1 = almacenUsuarios.devolverUsuario(u); 
                jLabel2.setText(usuario1.GetUsuario());
                jLabel4.setVisible(true);
                if (!usuario1.GetAdministrador()){BotConfiguracion.setEnabled(false);
                BotConfiguracion.setToolTipText("Sólo un administrador puede modificar la configuración");
                }else{BotConfiguracion.setEnabled(true);}
        }else{
            JOptionPane.showConfirmDialog(this, "Ya existe un usuario con ese nombre, pruebe con otro ", "Fallo Registro Usuario", JOptionPane.OK_CANCEL_OPTION,JOptionPane.WARNING_MESSAGE);}
        }
    }//GEN-LAST:event_BotRegistroActionPerformed

    private void BotIdentificarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BotIdentificarActionPerformed
        Identificarse_IG a = new Identificarse_IG();
        
        if(JOptionPane.showConfirmDialog(this, a, "Identificarse",JOptionPane.OK_CANCEL_OPTION, JOptionPane.PLAIN_MESSAGE) == JOptionPane.OK_OPTION){
           Usuario u = a.getUsuario();
           if(almacenUsuarios.identificar(u)){
                JOptionPane.showConfirmDialog(this, "Usuario identificado, bienvenido " + u.GetUsuario() + ". Pulse OK si desea continuar con este usuario", "Confirmar Usuario Identificado", JOptionPane.OK_OPTION, JOptionPane.INFORMATION_MESSAGE);
                usuario1 = almacenUsuarios.devolverUsuario(u); 

                jLabel2.setText( usuario1.GetUsuario());
                jLabel4.setVisible(true);
                if (!(usuario1.GetAdministrador())){
                    BotConfiguracion.setEnabled(false);
                    BotConfiguracion.setToolTipText("Sólo un administrador puede modificar la configuración");
                }else{BotConfiguracion.setEnabled(true);}
            }else{
                JOptionPane.showConfirmDialog(this, "Usuario no identificado, pruebe a registrarse ", "Confirmar Usuario Identificado", JOptionPane.OK_CANCEL_OPTION,JOptionPane.WARNING_MESSAGE);
            }

      }
    }//GEN-LAST:event_BotIdentificarActionPerformed

    private void BotPartida1v1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BotPartida1v1ActionPerformed
        RegistarIdentificar_IG RegUs2 = new RegistarIdentificar_IG(almacenUsuarios);
        JOptionPane.showConfirmDialog(this, RegUs2, "Identificarse",JOptionPane.OK_CANCEL_OPTION, JOptionPane.PLAIN_MESSAGE);
        usuario2 = RegUs2.getUsuarioIdentReg();
        CombinacionAdiv_IG CombinacionAdivinar = new CombinacionAdiv_IG(usuario1.GetUsuario());
        if(JOptionPane.showConfirmDialog(this, CombinacionAdivinar, "Añadir Combinación para adivinar ", JOptionPane.OK_OPTION,JOptionPane.INFORMATION_MESSAGE) == JOptionPane.OK_OPTION){
            Partida1v1_IG PartidaNueva = new Partida1v1_IG(usuario1,usuario2,CombinacionAdivinar.getCombinacionAdiv(),rondasIG, intentosIG);
            JOptionPane.showConfirmDialog(this, PartidaNueva, "Partida 1v1",JOptionPane.OK_CANCEL_OPTION, JOptionPane.PLAIN_MESSAGE);
        }
    }//GEN-LAST:event_BotPartida1v1ActionPerformed
    
    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(MasterMind_IG.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(MasterMind_IG.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(MasterMind_IG.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(MasterMind_IG.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                try {
                    new MasterMind_IG().setVisible(true);
                } catch (IOException | ClassNotFoundException ex) {
                    Logger.getLogger(MasterMind_IG.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton BotClasificacion;
    private javax.swing.JButton BotConfiguracion;
    private javax.swing.JButton BotEntrenamiento;
    private javax.swing.JButton BotEstadisticasPers;
    private javax.swing.JButton BotIdentificar;
    private javax.swing.JButton BotPartida1v1;
    private javax.swing.JButton BotRegistro;
    private javax.swing.JButton jButton1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel4;
    // End of variables declaration//GEN-END:variables
}
