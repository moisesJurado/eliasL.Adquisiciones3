package gui;

import java.awt.BorderLayout;
import java.awt.EventQueue;
import java.util.ArrayList;

import javax.swing.DefaultBoundedRangeModel;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.table.DefaultTableModel;

import controlador.MySqlProveedor;

import entidad.Proveedor;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JLabel;
import javax.swing.JOptionPane;

import java.awt.Font;
import javax.swing.JTextField;
import javax.swing.JComboBox;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import javax.swing.DefaultComboBoxModel;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class frmProveedor extends JFrame {
	ArrayList<Proveedor> lista= new ArrayList<Proveedor>();
	MySqlProveedor objeto= new MySqlProveedor();
	DefaultTableModel modelo= new DefaultTableModel();

	private JPanel contentPane;
	private JTable tblProveedor;
	private JTextField txtCodigo;
	private JTextField txtRazon;
	private JTextField txtRuc;
	private JTextField txtDireccion;
	private JTextField txtTelefono;
	private JTextField txtCorreo;
	private JTextField txtPais;
	private JTextField txtCategoria;
	private JComboBox cboEstado;
	private JScrollPane scrollPane;
	private JButton btnGarbar;
	private JButton btnActualizar;
	private JButton btnEliminar;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					frmProveedor frame = new frmProveedor();
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
	public frmProveedor() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 899, 527);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		scrollPane = new JScrollPane();
		scrollPane.setBounds(414, 80, 459, 397);
		contentPane.add(scrollPane);
		
		tblProveedor = new JTable();
		tblProveedor.addKeyListener(new KeyAdapter() {
			@Override
			public void keyReleased(KeyEvent e) {
				keyReleasedTblProveedor(e);
			}
		});
		tblProveedor.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent arg0) {
				mouseClickedTblProveedor(arg0);
			}
		});
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
		
		JLabel lblMatenimientoDeProveedor = new JLabel("Matenimiento de Proveedor");
		lblMatenimientoDeProveedor.setFont(new Font("Tahoma", Font.ITALIC, 19));
		lblMatenimientoDeProveedor.setBounds(295, 11, 437, 41);
		contentPane.add(lblMatenimientoDeProveedor);
		
		JLabel lblCodigo = new JLabel("Codigo");
		lblCodigo.setBounds(36, 98, 46, 14);
		contentPane.add(lblCodigo);
		
		JLabel lblRazon = new JLabel("Razon");
		lblRazon.setBounds(36, 136, 46, 14);
		contentPane.add(lblRazon);
		
		JLabel lblRuc = new JLabel("Ruc");
		lblRuc.setBounds(36, 175, 46, 14);
		contentPane.add(lblRuc);
		
		JLabel lblDireccion = new JLabel("Direccion");
		lblDireccion.setBounds(36, 217, 70, 14);
		contentPane.add(lblDireccion);
		
		JLabel lblTelefono = new JLabel("Telefono");
		lblTelefono.setBounds(36, 253, 70, 14);
		contentPane.add(lblTelefono);
		
		JLabel lblCorreo = new JLabel("Correo");
		lblCorreo.setBounds(36, 293, 46, 14);
		contentPane.add(lblCorreo);
		
		JLabel lblPais = new JLabel("Pais");
		lblPais.setBounds(36, 333, 46, 14);
		contentPane.add(lblPais);
		
		JLabel lblCategoria = new JLabel("Categoria");
		lblCategoria.setBounds(36, 372, 80, 14);
		contentPane.add(lblCategoria);
		
		JLabel lblEstado = new JLabel("Estado");
		lblEstado.setBounds(36, 422, 46, 14);
		contentPane.add(lblEstado);
		
		txtCodigo = new JTextField();
		txtCodigo.setBounds(103, 95, 106, 20);
		contentPane.add(txtCodigo);
		txtCodigo.setColumns(10);
		
		txtRazon = new JTextField();
		txtRazon.setBounds(101, 133, 275, 20);
		contentPane.add(txtRazon);
		txtRazon.setColumns(10);
		
		txtRuc = new JTextField();
		txtRuc.setBounds(101, 172, 108, 20);
		contentPane.add(txtRuc);
		txtRuc.setColumns(10);
		
		txtDireccion = new JTextField();
		txtDireccion.setBounds(101, 214, 275, 20);
		contentPane.add(txtDireccion);
		txtDireccion.setColumns(10);
		
		txtTelefono = new JTextField();
		txtTelefono.setBounds(101, 250, 108, 20);
		contentPane.add(txtTelefono);
		txtTelefono.setColumns(10);
		
		txtCorreo = new JTextField();
		txtCorreo.setBounds(101, 290, 275, 20);
		contentPane.add(txtCorreo);
		txtCorreo.setColumns(10);
		
		txtPais = new JTextField();
		txtPais.setBounds(103, 330, 106, 20);
		contentPane.add(txtPais);
		txtPais.setColumns(10);
		
		txtCategoria = new JTextField();
		txtCategoria.setBounds(101, 369, 108, 20);
		contentPane.add(txtCategoria);
		txtCategoria.setColumns(10);
		
		cboEstado = new JComboBox();
		cboEstado.setModel(new DefaultComboBoxModel(new String[] {"Activo", "Desactivo"}));
		cboEstado.setBounds(103, 419, 133, 20);
		contentPane.add(cboEstado);
		
		btnGarbar = new JButton("Garbar");
		btnGarbar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				actionPerformedBtnGarbar(e);
			}
		});
		btnGarbar.setBounds(36, 454, 89, 23);
		contentPane.add(btnGarbar);
		
		btnActualizar = new JButton("Actualizar");
		btnActualizar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				actionPerformedBtnActualizar(e);
			}
		});
		btnActualizar.setBounds(167, 454, 89, 23);
		contentPane.add(btnActualizar);
		
		btnEliminar = new JButton("Eliminar");
		btnEliminar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				actionPerformedBtnEliminar(e);
			}
		});
		btnEliminar.setBounds(295, 454, 89, 23);
		contentPane.add(btnEliminar);
		listar();
	}
	void listar(){
		//limpiar el modelo
		modelo.setRowCount(0);//txtS.setText("")
		//recuperar el valor que retorna el método listLector
		ArrayList<Proveedor> info=objeto.listProveedor();
		//bucle
		for(Proveedor pro:info){
			//arreglo de Object
			Object fila[]={pro.getCodigo(),pro.getRazon(),pro.getRuc(),pro.getDireccion(),pro.getTelefono(),pro.getCorreo(),pro.getPais(),pro.getCodcate(),pro.getEstado()};
			//enviar el objeto "fila" al modelo
			modelo.addRow(fila);
		}
	}
	void mostrar(int fila){
		String codigo,razon,ruc,direccion,telefono,correo,pais,categoria,estados;
		codigo=tblProveedor.getValueAt(fila, 0).toString();//0 es la columna código
		razon=tblProveedor.getValueAt(fila, 1).toString();//1 es la columna nombre
		ruc=tblProveedor.getValueAt(fila, 2).toString();//2 es la columna apellido
		direccion=tblProveedor.getValueAt(fila, 3).toString();//3 es la columna dni
		telefono=tblProveedor.getValueAt(fila, 4).toString();
		correo=tblProveedor.getValueAt(fila, 5).toString();
		pais=tblProveedor.getValueAt(fila, 6).toString();
		categoria=tblProveedor.getValueAt(fila, 7).toString();
		estados=tblProveedor.getValueAt(fila, 8).toString();
		
		//getValueAt es un método que retorna un valor según la intersección de un fila y columna 
		txtCodigo.setText(codigo);
		txtRazon.setText(razon);
		txtRuc.setText(ruc);
		txtDireccion.setText(direccion);
		txtTelefono.setText(telefono);
		txtCorreo.setText(correo);
		txtPais.setText(pais);
		txtCategoria.setText(categoria);
		cboEstado.setSelectedItem(estados);
	}
	protected void mouseClickedTblProveedor(MouseEvent arg0) {
		int fila=tblProveedor.getSelectedRow();
		mostrar(fila);
	}
	protected void keyReleasedTblProveedor(KeyEvent e) {
		int fila=tblProveedor.getSelectedRow();
		mostrar(fila);

	}
	protected void actionPerformedBtnGarbar(ActionEvent e) {
		String codigo,razon,ruc,direccion,telefono,correo,pais,codcate,estados;
		codigo=txtCodigo.getText();
		razon=txtRazon.getText();
		ruc=txtRuc.getText();
		direccion=txtDireccion.getText();
		telefono=txtTelefono.getText();
		correo=txtCorreo.getText();
		pais=txtPais.getText();
		codcate=txtCategoria.getText();
		estados=cboEstado.getSelectedItem().toString();
		
		
		
		Proveedor pro=new Proveedor();
		pro.setCodigo(Integer.parseInt(codigo));
		pro.setRazon(razon);
		pro.setRuc(ruc);
		pro.setDireccion(direccion);
		pro.setTelefono(telefono);
		pro.setCorreo(correo);
		pro.setPais(pais);
		pro.setCodcate(Integer.parseInt(codcate));
		pro.setEstado(estados);
		
		int estado= objeto.addPRoveedor(pro);
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
	protected void actionPerformedBtnActualizar(ActionEvent e) {
		String codigo,razon,ruc,direccion,telefono,correo,pais,codcate,estados;
		codigo=txtCodigo.getText();
		razon=txtRazon.getText();
		ruc=txtRuc.getText();
		direccion=txtDireccion.getText();
		telefono=txtTelefono.getText();
		correo=txtCorreo.getText();
		pais=txtPais.getText();
		codcate=txtCategoria.getText();
		estados=cboEstado.getSelectedItem().toString();
		
		
		
		Proveedor pro=new Proveedor();
		pro.setCodigo(Integer.parseInt(codigo));
		pro.setRazon(razon);
		pro.setRuc(ruc);
		pro.setDireccion(direccion);
		pro.setTelefono(telefono);
		pro.setCorreo(correo);
		pro.setPais(pais);
		pro.setCodcate(Integer.parseInt(codcate));
		pro.setEstado(estados);
		
		int estado= objeto.updaProveedor(pro);
		if(estado==1){
			mensaje("actualizado ok");
			listar();
		}	
		else
			mensaje("Errorrrrrrr men");
		
		
		
	}
	//botom de eliminacion
	protected void actionPerformedBtnEliminar(ActionEvent e) {
		String codigo;
		codigo=txtCodigo.getText();
		int estado=objeto.deleteProveedor(Integer.parseInt(codigo));
		
		if(estado==1){
			mensaje("Registro eliminado");
			listar();
		}
		else
			mensaje("Errorrrrrrr");
	}
}
