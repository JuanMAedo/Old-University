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
import java.awt.Window;
import javax.swing.JOptionPane;
import javax.swing.SwingUtilities;

public class Partida1v1_IG extends javax.swing.JPanel {
    
    Combinacion adivinar;
    Usuario U1,U2;
    int rondas;
    int intentos;
    int contadorIntentos;
    int topeRondas;
    Partida part_1v1;
    Ronda [] rondasArray;
    Ronda ronds;
    String UsAdiv;
    /**
     * Creates new form Partida1v1
     */
    public Partida1v1_IG(Usuario U1, Usuario U2,Combinacion C,int rond, int intentos) {
        this.U1 = U1;
        this.U2 = U2;
        UsAdiv = U1.GetUsuario();
        rondas = rond;
        contadorIntentos = 0;
        topeRondas = 0;
        adivinar = C;
        this.intentos = intentos;
        initComponents();
        part_1v1 = new Partida(U1,U2,rondas);
        ronds = new Ronda(intentos,adivinar);    
        jLabel3.setText(U2.GetUsuario());

    }
    public void setRondaNueva(Combinacion C){
        adivinar = C;
        ronds = new Ronda(intentos,adivinar);
    }
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        JugarCombinacion = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTextArea1 = new javax.swing.JTextArea();
        jComboBox1 = new javax.swing.JComboBox<>();
        jComboBox2 = new javax.swing.JComboBox<>();
        jComboBox3 = new javax.swing.JComboBox<>();
        jComboBox4 = new javax.swing.JComboBox<>();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();

        jLabel1.setFont(new java.awt.Font("Tempus Sans ITC", 3, 24)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(102, 102, 0));
        jLabel1.setText("PARTIDA 1V1");

        JugarCombinacion.setBackground(new java.awt.Color(102, 102, 0));
        JugarCombinacion.setFont(new java.awt.Font("Dialog", 3, 18)); // NOI18N
        JugarCombinacion.setForeground(new java.awt.Color(0, 0, 0));
        JugarCombinacion.setText("Jugar Combinación");
        JugarCombinacion.setBorder(javax.swing.BorderFactory.createBevelBorder(javax.swing.border.BevelBorder.RAISED));
        JugarCombinacion.setBorderPainted(false);
        JugarCombinacion.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                JugarCombinacionActionPerformed(evt);
            }
        });

        jTextArea1.setColumns(20);
        jTextArea1.setRows(5);
        jScrollPane1.setViewportView(jTextArea1);

        jComboBox1.setFont(new java.awt.Font("Dialog", 3, 18)); // NOI18N
        jComboBox1.setForeground(new java.awt.Color(102, 102, 0));
        jComboBox1.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "B", "N", "A", "R", "V", "M" }));
        jComboBox1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jComboBox1ActionPerformed(evt);
            }
        });

        jComboBox2.setFont(new java.awt.Font("Dialog", 3, 18)); // NOI18N
        jComboBox2.setForeground(new java.awt.Color(102, 102, 0));
        jComboBox2.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "B", "N", "A", "R", "V", "M" }));

        jComboBox3.setFont(new java.awt.Font("Dialog", 3, 18)); // NOI18N
        jComboBox3.setForeground(new java.awt.Color(102, 102, 0));
        jComboBox3.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "B", "N", "A", "R", "V", "M" }));

        jComboBox4.setFont(new java.awt.Font("Dialog", 3, 18)); // NOI18N
        jComboBox4.setForeground(new java.awt.Color(102, 102, 0));
        jComboBox4.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "B", "N", "A", "R", "V", "M" }));

        jLabel2.setFont(new java.awt.Font("Dialog", 3, 14)); // NOI18N
        jLabel2.setForeground(new java.awt.Color(102, 102, 0));
        jLabel2.setText("Turno de Adivinar de:");

        jLabel3.setFont(new java.awt.Font("Dialog", 3, 14)); // NOI18N
        jLabel3.setForeground(new java.awt.Color(102, 102, 0));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane1))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(javax.swing.GroupLayout.Alignment.LEADING, layout.createSequentialGroup()
                        .addGap(93, 93, 93)
                        .addComponent(JugarCombinacion)
                        .addGap(48, 48, 48)
                        .addComponent(jLabel2)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jLabel3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addGap(12, 12, 12))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addGap(22, 22, 22)
                                .addComponent(jComboBox1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(131, 131, 131)
                                .addComponent(jComboBox2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 133, Short.MAX_VALUE)
                                .addComponent(jComboBox3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 182, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(17, 17, 17)))
                        .addGap(93, 93, 93)
                        .addComponent(jComboBox4, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(36, 36, 36))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1)
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jComboBox3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jComboBox2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jComboBox1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jComboBox4, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel3, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(JugarCombinacion)
                        .addComponent(jLabel2)))
                .addGap(18, 18, 18)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 149, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(46, 46, 46))
        );
    }// </editor-fold>//GEN-END:initComponents

    private void jComboBox1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jComboBox1ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jComboBox1ActionPerformed

    private void JugarCombinacionActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_JugarCombinacionActionPerformed
            String aS = (String) jComboBox1.getSelectedItem();
            String bS = (String) jComboBox2.getSelectedItem();
            String cS = (String) jComboBox3.getSelectedItem();
            String dS = (String) jComboBox4.getSelectedItem();
            char a = aS.charAt(0);
            char b = bS.charAt(0);
            char c = cS.charAt(0);
            char d = dS.charAt(0);
            char [] combi = {a,b,c,d};
            Combinacion cs = new Combinacion(combi);
            String s = ("Intento nº: "+ (contadorIntentos+1) + "\n" +"Posición 1º: " + a + "\n" + "Posición 2º: " + b + "\n" + "Posición 3º: " + c + "\n" + "Posición 4º: " + d  + "\n");   
            s += ronds.jugar(cs);
            jTextArea1.append(s);
            contadorIntentos++;
            if (adivinar.esGanadora(cs)){
                part_1v1.setRondaInd(topeRondas, ronds);
                topeRondas++;
                if ((topeRondas % 2) == 0){UsAdiv = U1.GetUsuario();}
                else{UsAdiv = U2.GetUsuario();}
                CombinacionAdiv_IG CombinacionAdivinar = new CombinacionAdiv_IG(UsAdiv);
                contadorIntentos = 0;
                if(topeRondas == rondas){
                    part_1v1.darResultado();
                    Usuario alt = part_1v1.esGanador();
                    if(alt.equals(U1)){
                        JOptionPane.showConfirmDialog(this,  "El ganador es: " + part_1v1.esGanador().GetUsuario() + " con un total de " + part_1v1.getPuntosU1() + " puntos","Partida Finalizada", JOptionPane.OK_OPTION,JOptionPane.INFORMATION_MESSAGE);
                        Window w = SwingUtilities.getWindowAncestor(this);
                        w.setVisible(false);
                    }else{
                        JOptionPane.showConfirmDialog(this,  "El ganador es: " + part_1v1.esGanador().GetUsuario() + " con un total de " + part_1v1.getPuntosU2() + " puntos","Partida Finalizada", JOptionPane.OK_OPTION,JOptionPane.INFORMATION_MESSAGE);
                        Window w = SwingUtilities.getWindowAncestor(this);
                        w.setVisible(false);}
                    JugarCombinacion.setEnabled(false);
                }else if(JOptionPane.showConfirmDialog(this, CombinacionAdivinar, "Añadir Combinación para adivinar ", JOptionPane.OK_OPTION,JOptionPane.INFORMATION_MESSAGE) == JOptionPane.OK_OPTION){
                    setRondaNueva(CombinacionAdivinar.getCombinacionAdiv());
                    if ((topeRondas % 2) == 0){jLabel3.setText(U2.GetUsuario());}
                    else{jLabel3.setText(U1.GetUsuario());}   
                }  
            } else if(contadorIntentos == intentos){
                ronds.devolverRes();
                 JOptionPane.showConfirmDialog(this, "Número de Intentos Finalizados. La combinación correcta era: " + adivinar.toString(), "Entrenamiento Terminado ", JOptionPane.OK_OPTION,JOptionPane.PLAIN_MESSAGE);
                part_1v1.setRondaInd(topeRondas, ronds);
                topeRondas++;
                if ((topeRondas % 2) == 0){UsAdiv = U1.GetUsuario();}
                else{UsAdiv = U2.GetUsuario();}
                CombinacionAdiv_IG CombinacionAdivinar = new CombinacionAdiv_IG(UsAdiv);
                contadorIntentos = 0;
                if(topeRondas == rondas){
                    part_1v1.darResultado();
                    Usuario alt = part_1v1.esGanador();
                    if(alt.equals(U1)){
                        JOptionPane.showConfirmDialog(this,  "El ganador es: " + part_1v1.esGanador().GetUsuario() + "con un total de " + part_1v1.getPuntosU1() + " puntos","Partida Finalizada", JOptionPane.OK_OPTION,JOptionPane.INFORMATION_MESSAGE);
                        Window w = SwingUtilities.getWindowAncestor(this);
                        w.setVisible(false);
                    }else{
                        JOptionPane.showConfirmDialog(this,  "El ganador es: " + part_1v1.esGanador().GetUsuario() + " con un total de " + part_1v1.getPuntosU2() + " puntos","Partida Finalizada", JOptionPane.OK_OPTION,JOptionPane.INFORMATION_MESSAGE);
                        Window w = SwingUtilities.getWindowAncestor(this);
                        w.setVisible(false);}
                    JugarCombinacion.setEnabled(false);
                }else if(JOptionPane.showConfirmDialog(this, CombinacionAdivinar, "Añadir Combinación para adivinar ", JOptionPane.OK_OPTION,JOptionPane.INFORMATION_MESSAGE) == JOptionPane.OK_OPTION){
                    setRondaNueva(CombinacionAdivinar.getCombinacionAdiv());
                    if ((topeRondas % 2) == 0){jLabel3.setText(U2.GetUsuario());}
                    else{jLabel3.setText(U1.GetUsuario());}
                } 
            }  
    }//GEN-LAST:event_JugarCombinacionActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton JugarCombinacion;
    private javax.swing.JComboBox<String> jComboBox1;
    private javax.swing.JComboBox<String> jComboBox2;
    private javax.swing.JComboBox<String> jComboBox3;
    private javax.swing.JComboBox<String> jComboBox4;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTextArea jTextArea1;
    // End of variables declaration//GEN-END:variables
}
