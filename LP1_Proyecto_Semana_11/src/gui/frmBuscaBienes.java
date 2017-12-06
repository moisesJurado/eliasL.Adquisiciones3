package gui;

import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.table.DefaultTableModel;

import controlador.MySqlBienes;
import entidad.Bienes;
import entidad.Proveedor;
import ordenamiento.SortCategori;
import ordenamiento.SortCategoria;
import ordenamiento.SortNombre;
import ordenamiento.SortRazon;

import javax.swing.JLabel;
import javax.swing.JTextField;
import java.awt.Font;
import java.util.ArrayList;
import java.util.Collections;

import javax.swing.JRadioButton;
import javax.swing.JCheckBox;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.event.ItemListener;
import java.awt.event.ItemEvent;

public class frmBuscaBienes extends JFrame {
ArrayList<Bienes> lista = new ArrayList<Bienes>();
MySqlBienes objeto= new MySqlBienes();
DefaultTableModel modelo= new DefaultTableModel();

	private JPanel contentPane;
	private JTextField txtNombre;
	private JTable tblBuscaBienes;
	private JButton btnMostrar;
	private JCheckBox chckbxAscendente;
	private JRadioButton rdbtnCategoria;
	private JRadioButton rdbtnNombre;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					frmBuscaBienes frame = new frmBuscaBienes();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public frmBuscaBienes() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 817, 485);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel lblReporteDeBienes = new JLabel("Reporte de Bienes");
		lblReporteDeBienes.setFont(new Font("Tahoma", Font.BOLD | Font.ITALIC, 16));
		lblReporteDeBienes.setBounds(332, 27, 161, 14);
		contentPane.add(lblReporteDeBienes);
		
		JLabel lblNombre = new JLabel("Nombre");
		lblNombre.setBounds(41, 79, 46, 14);
		contentPane.add(lblNombre);
		
		txtNombre = new JTextField();
		txtNombre.setBounds(97, 76, 255, 20);
		contentPane.add(txtNombre);
		txtNombre.setColumns(10);
		
		rdbtnNombre = new JRadioButton("Nombre");
		rdbtnNombre.addItemListener(new ItemListener() {
			public void itemStateChanged(ItemEvent arg0) {
				itemStateChangedRdbtnProveedor(arg0);
			}
		});
		rdbtnNombre.setBounds(39, 122, 109, 23);
		contentPane.add(rdbtnNombre);
		
		rdbtnCategoria = new JRadioButton("Categoria");
		rdbtnCategoria.addItemListener(new ItemListener() {
			public void itemStateChanged(ItemEvent arg0) {
				itemStateChangedRdbtnCategoria(arg0);
			}
		});
		rdbtnCategoria.setBounds(165, 122, 109, 23);
		contentPane.add(rdbtnCategoria);
		
		chckbxAscendente = new JCheckBox("Ascendente");
		chckbxAscendente.addItemListener(new ItemListener() {
			public void itemStateChanged(ItemEvent arg0) {
				itemStateChangedChckbxAscendente(arg0);
			}
		});
		chckbxAscendente.setBounds(606, 122, 97, 23);
		contentPane.add(chckbxAscendente);
		
		JScrollPane scrollPane = new JScrollPane();
		scrollPane.setBounds(10, 155, 781, 280);
		contentPane.add(scrollPane);
		
		tblBuscaBienes = new JTable();
		scrollPane.setViewportView(tblBuscaBienes);
		modelo.addColumn("Código");
		modelo.addColumn("Nombre");
		modelo.addColumn("Categoría");
		modelo.addColumn("Precio Base");
		modelo.addColumn("Estado");
		tblBuscaBienes.setModel(modelo);
		listar();
		
		btnMostrar = new JButton("Mostrar");
		btnMostrar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				actionPerformedBtnMostrar(e);
			}
		});
		btnMostrar.setBounds(417, 75, 89, 23);
		contentPane.add(btnMostrar);
	}
	protected void actionPerformedBtnMostrar(ActionEvent e) {
		String nombre;
		nombre=txtNombre.getText();
		listar(nombre);
	}
  void listar(){
		modelo.setRowCount(0);
		ArrayList<Bienes> info=objeto.listBienes();
		for(Bienes bie:info){
			Object fila[]={bie.getCodigo(),bie.getNombre(),bie.getCategoria(),bie.getPrecioBase(),bie.getEstado()};
			modelo.addRow(fila);
		
	}
  }
  void listar(String nombre){
		modelo.setRowCount(0);
		ArrayList<Bienes> info=objeto.listaBienesXnombre(nombre);
		for(Bienes bie:info){
			Object fila[]={bie.getCodigo(),bie.getNombre(),bie.getCategoria(),bie.getPrecioBase(),bie.getEstado()};
			modelo.addRow(fila);
		
	}
}
	protected void itemStateChangedRdbtnProveedor(ItemEvent arg0) {
		if(rdbtnNombre.isSelected())
			Collections.sort(lista,new SortNombre());
		
		if(!chckbxAscendente.isSelected())
			Collections.reverse(lista);
		listar();
	}
	protected void itemStateChangedRdbtnCategoria(ItemEvent arg0) {
		if(rdbtnCategoria.isSelected())
			Collections.sort(lista,new SortCategori());
		
		if(!chckbxAscendente.isSelected())
			Collections.reverse(lista);
		listar();
	}
	protected void itemStateChangedChckbxAscendente(ItemEvent arg0) {
		if(rdbtnNombre.isSelected())
			Collections.sort(lista,new SortNombre());
		
		if(rdbtnCategoria.isSelected())
			Collections.sort(lista,new SortCategori());
		
		if(!chckbxAscendente.isSelected())//DESC
			Collections.reverse(lista);
		
		listar();
	}
}
