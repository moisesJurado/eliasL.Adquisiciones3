package gui;

import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.table.DefaultTableModel;

import controlador.MySqlProveedor;

import entidad.Proveedor;
import ordenamiento.SortCategoria;

import ordenamiento.SortRazon;


import javax.swing.JLabel;
import javax.swing.JTextField;
import javax.swing.JRadioButton;
import javax.swing.JCheckBox;
import javax.swing.JButton;
import javax.swing.SwingConstants;
import java.awt.Color;
import java.awt.Font;
import java.util.ArrayList;
import java.util.Collections;

import javax.swing.JScrollPane;
import javax.swing.JTable;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.event.ItemListener;
import java.awt.event.ItemEvent;

public class frmBuscaProveedor extends JFrame {

	ArrayList<Proveedor> lista= new ArrayList<Proveedor>();
	MySqlProveedor objeto= new MySqlProveedor();
	DefaultTableModel modelo = new DefaultTableModel();

	private JPanel contentPane;
	private JTextField txtRazon;
	private JTable tblProveedor;
	private JScrollPane scrollPane;
	private JRadioButton rdbtnCategoria;
	private JRadioButton rdbtnRazon;
	private JCheckBox chckbxAscendente;
	private JButton btnMostrar;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					frmBuscaProveedor frame = new frmBuscaProveedor();
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
	public frmBuscaProveedor() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 757, 526);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel lblRazon = new JLabel("Razon :");
		lblRazon.setBounds(30, 89, 46, 14);
		contentPane.add(lblRazon);
		
		txtRazon = new JTextField();
		txtRazon.setBounds(128, 86, 206, 20);
		contentPane.add(txtRazon);
		txtRazon.setColumns(10);
		
		rdbtnRazon = new JRadioButton("Razon");
		rdbtnRazon.addItemListener(new ItemListener() {
			public void itemStateChanged(ItemEvent arg0) {
				itemStateChangedRdbtnRazon(arg0);
			}
		});
		rdbtnRazon.setBounds(30, 143, 109, 23);
		contentPane.add(rdbtnRazon);
		
		rdbtnCategoria = new JRadioButton("Categoria");
		rdbtnCategoria.addItemListener(new ItemListener() {
			public void itemStateChanged(ItemEvent arg0) {
				itemStateChangedRdbtnCategoria(arg0);
			}
		});
		rdbtnCategoria.setBounds(188, 143, 109, 23);
		contentPane.add(rdbtnCategoria);
		
		chckbxAscendente = new JCheckBox("Ascendente");
		chckbxAscendente.setSelected(true);
		chckbxAscendente.addItemListener(new ItemListener() {
			public void itemStateChanged(ItemEvent arg0) {
				itemStateChangedChckbxCategoria(arg0);
			}
		});
		chckbxAscendente.setBounds(591, 143, 97, 23);
		contentPane.add(chckbxAscendente);
		
		btnMostrar = new JButton("Mostrar");
		btnMostrar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				actionPerformedBtnMostrar(arg0);
			}
		});
		btnMostrar.setBounds(374, 85, 89, 23);
		contentPane.add(btnMostrar);
		
		JLabel lblConsultarProveedor = new JLabel("Consultar Proveedor");
		lblConsultarProveedor.setFont(new Font("Tahoma", Font.ITALIC, 18));
		lblConsultarProveedor.setBackground(Color.GRAY);
		lblConsultarProveedor.setHorizontalAlignment(SwingConstants.CENTER);
		lblConsultarProveedor.setBounds(249, 26, 308, 23);
		contentPane.add(lblConsultarProveedor);
		
		scrollPane = new JScrollPane();
		scrollPane.setBounds(30, 202, 701, 274);
		contentPane.add(scrollPane);
		
		tblProveedor = new JTable();
		scrollPane.setViewportView(tblProveedor);
		modelo.addColumn("Código");
		modelo.addColumn("Razon");
		modelo.addColumn("Ruc");
		modelo.addColumn("Direccion");
		modelo.addColumn("Telefono");
		modelo.addColumn("Correo");
		modelo.addColumn("Pais");
		modelo.addColumn("Categoria");
		modelo.addColumn("Estado");
		//enviar el objeto "modelo" al control tblLector
		tblProveedor.setModel(modelo);
		listar();
	}
	
	protected void actionPerformedBtnMostrar(ActionEvent arg0) {
		String razon;
		razon=txtRazon.getText();
		listar(razon);
	}
	void listar(String razon){
		modelo.setRowCount(0);
		lista=new MySqlProveedor().listaProveedorXRazon(razon);
		for(Proveedor pro:lista){
			
			Object fila[]={pro.getCodigo(),pro.getRazon(),pro.getRuc(),pro.getDireccion(),pro.getTelefono(),pro.getCorreo(),pro.getPais(),pro.getNombrecate(),pro.getEstado()};
			
			modelo.addRow(fila);
		}
	}
	
	
	
  
	protected void itemStateChangedRdbtnRazon(ItemEvent arg0) {
		if(rdbtnRazon.isSelected())
			Collections.sort(lista,new SortRazon());
		
		if(!chckbxAscendente.isSelected())
			Collections.reverse(lista);
		listar();
	}
	protected void itemStateChangedRdbtnCategoria(ItemEvent arg0) {
		if(rdbtnCategoria.isSelected())
			Collections.sort(lista,new SortCategoria());
		
		if(!chckbxAscendente.isSelected())
			Collections.reverse(lista);
		listar();
	}
	protected void itemStateChangedChckbxCategoria(ItemEvent arg0) {
		if(rdbtnRazon.isSelected())
			Collections.sort(lista,new SortRazon());
		
		if(rdbtnCategoria.isSelected())
			Collections.sort(lista,new SortCategoria());
		
		if(!chckbxAscendente.isSelected())//DESC
			Collections.reverse(lista);
		
		listar();
	}
void listar(){
		
		modelo.setRowCount(0);
		
		ArrayList<Proveedor> info=objeto.listProveedor();
		
		for(Proveedor pro:info){
			
			Object fila[]={pro.getCodigo(),pro.getNombrecate(),pro.getRuc(),pro.getDireccion(),pro.getTelefono(),pro.getCorreo(),pro.getPais(),pro.getCodcate(),pro.getEstado()};
		
			modelo.addRow(fila);
		}
	}
}	
