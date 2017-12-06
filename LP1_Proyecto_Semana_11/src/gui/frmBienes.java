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

import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.SwingConstants;
import java.awt.Font;
import java.util.ArrayList;

import javax.swing.JTextField;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.DefaultComboBoxModel;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

public class frmBienes extends JFrame {
	
	ArrayList<Bienes> lista= new ArrayList<Bienes>();
	MySqlBienes objeto= new MySqlBienes();
	DefaultTableModel modelo= new DefaultTableModel();
	
	private JPanel contentPane;
	private JTextField txtcodigo;
	private JTextField txtcategoria;
	private JTextField txtNombre;
	private JTextField txtPrecio;
	private JTable tblBienes;
	private JButton btnGrabar;
	private JButton btnEliminar;
	private JComboBox cboEstado;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					frmBienes frame = new frmBienes();
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
	public frmBienes() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 661, 529);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel lblMantenimientoDeBienes = new JLabel("Mantenimiento de Bienes");
		lblMantenimientoDeBienes.setFont(new Font("Tahoma", Font.ITALIC, 18));
		lblMantenimientoDeBienes.setHorizontalAlignment(SwingConstants.CENTER);
		lblMantenimientoDeBienes.setBounds(187, 11, 268, 47);
		contentPane.add(lblMantenimientoDeBienes);
		
		JLabel lblCodigo = new JLabel("Codigo :");
		lblCodigo.setBounds(24, 109, 46, 14);
		contentPane.add(lblCodigo);
		
		JLabel lblNombre = new JLabel("Nombre :");
		lblNombre.setBounds(236, 109, 46, 14);
		contentPane.add(lblNombre);
		
		JLabel lblCategoria = new JLabel("categoria :");
		lblCategoria.setBounds(24, 156, 71, 14);
		contentPane.add(lblCategoria);
		
		JLabel lblPrecio = new JLabel("Precio :");
		lblPrecio.setBounds(236, 156, 46, 14);
		contentPane.add(lblPrecio);
		
		JLabel lblEstado = new JLabel("Estado :");
		lblEstado.setBounds(418, 156, 46, 14);
		contentPane.add(lblEstado);
		
		txtcodigo = new JTextField();
		txtcodigo.setBounds(85, 106, 122, 20);
		contentPane.add(txtcodigo);
		txtcodigo.setColumns(10);
		
		txtcategoria = new JTextField();
		txtcategoria.setBounds(85, 153, 122, 20);
		contentPane.add(txtcategoria);
		txtcategoria.setColumns(10);
		
		txtNombre = new JTextField();
		txtNombre.setBounds(292, 106, 315, 20);
		contentPane.add(txtNombre);
		txtNombre.setColumns(10);
		
		txtPrecio = new JTextField();
		txtPrecio.setBounds(292, 153, 86, 20);
		contentPane.add(txtPrecio);
		txtPrecio.setColumns(10);
		
		JScrollPane scrollPane = new JScrollPane();
		scrollPane.setBounds(10, 246, 625, 233);
		contentPane.add(scrollPane);
		
		tblBienes = new JTable();
		tblBienes.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent arg0) {
				mouseClickedTblBienes(arg0);
			}
		});
		tblBienes.addKeyListener(new KeyAdapter() {
			@Override
			public void keyReleased(KeyEvent arg0) {
				keyReleasedTblBienes(arg0);
			}
		});
		scrollPane.setViewportView(tblBienes);
		modelo.addColumn("Código");
		modelo.addColumn("nombre");
		modelo.addColumn("categoria");
		modelo.addColumn("precio");
		modelo.addColumn("estado");
		
		//enviar el objeto "modelo" al control tblLector
		tblBienes.setModel(modelo);
		listar();
		
		btnGrabar = new JButton("Grabar");
		btnGrabar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				actionPerformedBtnGrabar(arg0);
			}
		});
		btnGrabar.setBounds(97, 210, 89, 23);
		contentPane.add(btnGrabar);
		
		JButton btnModificar = new JButton("Modificar");
		btnModificar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				actionPerformedBtnModificar(arg0);
			}
		});
		btnModificar.setBounds(218, 210, 89, 23);
		contentPane.add(btnModificar);
		
		btnEliminar = new JButton("Eliminar");
		btnEliminar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				actionPerformedBtnEliminar(arg0);
			}
		});
		btnEliminar.setBounds(366, 212, 89, 23);
		contentPane.add(btnEliminar);
		
		cboEstado = new JComboBox();
		cboEstado.setModel(new DefaultComboBoxModel(new String[] {"Activo", "Desactivo"}));
		cboEstado.setBounds(474, 153, 133, 20);
		contentPane.add(cboEstado);
	}
	
	

	protected void actionPerformedBtnGrabar(ActionEvent arg0) {
		String codigo,nombre,categoria,precio,estados;
		codigo=txtcodigo.getText();
		nombre=txtNombre.getText();
		categoria=txtcategoria.getText();
		precio=txtPrecio.getText();
		estados=cboEstado.getSelectedItem().toString();
		
		Bienes bie= new Bienes();
		bie.setCodigo(Integer.parseInt(codigo));
		bie.setNombre(nombre);
		bie.setCategoria(Integer.parseInt(categoria));
		bie.setPrecioBase(Double.parseDouble(precio));
		bie.setEstado(estados);
		
		
		int estado= objeto.addBienes(bie);
		if(estado==1){
			mensaje("Registro ok");
			listar();
		}	
		else
			mensaje("Errorrrrrrr");
		
		
		
		
	}
	void mensaje(String cad){
		JOptionPane.showMessageDialog(null, cad);
	}
	void listar(){
		
		modelo.setRowCount(0);
		ArrayList<Bienes> info=objeto.listBienes();
		
		for(Bienes bie:info){
			
			Object fila[]={bie.getCodigo(),bie.getNombre(),bie.getCategoria(),bie.getPrecioBase(),bie.getEstado()};
			
			modelo.addRow(fila);
		}
	}
	protected void actionPerformedBtnModificar(ActionEvent arg0) {
		String codigo,nombre,categoria,precio,estados;
		codigo=txtcodigo.getText();
		nombre=txtNombre.getText();
		categoria=txtcategoria.getText();
		precio=txtPrecio.getText();
		estados=cboEstado.getSelectedItem().toString();
		
		Bienes bie= new Bienes();
		bie.setCodigo(Integer.parseInt(codigo));
		bie.setNombre(nombre);
		bie.setCategoria(Integer.parseInt(categoria));
		bie.setPrecioBase(Double.parseDouble(precio));
		bie.setEstado(estados);
		
		
		int estado= objeto.updateBienes(bie);
		if(estado==1){
			mensaje("Registro ok");
			listar();
		}	
		else
			mensaje("Errorrrrrrr");
		
		
		
	}
	protected void keyReleasedTblBienes(KeyEvent arg0) {
		int fila=tblBienes.getSelectedRow();
		mostrar(fila);
	}
	protected void mouseClickedTblBienes(MouseEvent arg0) {
		int fila=tblBienes.getSelectedRow();
		mostrar(fila);
	}
	void mostrar(int fila){
		String codigo,nombre,categori,precio,estado;
		codigo=tblBienes.getValueAt(fila, 0).toString();
		nombre=tblBienes.getValueAt(fila, 1).toString();
		categori=tblBienes.getValueAt(fila, 2).toString();
		precio=tblBienes.getValueAt(fila, 3).toString();
		estado=tblBienes.getValueAt(fila, 4).toString();
		
		
		txtcodigo.setText(codigo);
		txtNombre.setText(nombre);
		txtcategoria.setText(categori);
		txtPrecio.setText(precio);
		cboEstado.setSelectedItem(estado);
		
	}
	protected void actionPerformedBtnEliminar(ActionEvent arg0) {
		
		String codigo;
		codigo=txtcodigo.getText();
		int estado=objeto.deleteBienes(Integer.parseInt(codigo));
		
		if(estado==1){
			mensaje("Registro eliminado");
			listar();
		}
		else
			mensaje("Errorrrrrrr");
	}
	
}
