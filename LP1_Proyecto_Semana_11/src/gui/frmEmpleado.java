package gui;

import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.table.DefaultTableModel;

import controlador.MySqlEmpleado;
import controlador.MySqlProveedor;
import entidad.Empleado;
import entidad.Proveedor;

import javax.swing.JLabel;
import javax.swing.JOptionPane;

import java.awt.Font;
import java.util.ArrayList;

import javax.swing.JTextField;
import javax.swing.JComboBox;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.DefaultComboBoxModel;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

public class frmEmpleado extends JFrame {
	MySqlEmpleado objeto= new MySqlEmpleado();
	ArrayList<Empleado> lista= new ArrayList<Empleado>();
	DefaultTableModel modelo = new DefaultTableModel();
	
	private JPanel contentPane;
	private JTextField txtCodigo;
	private JTextField txtNombre;
	private JTextField txtApellido;
	private JTextField txtDistrito;
	private JTextField txtFecha;
	private JTextField txtFono;
	private JTextField txtCorreo;
	private JTextField txtCelular;
	private JTextField txtUsuario;
	private JTextField txtCargo;
	private JTable tblEmpeado;
	private JScrollPane scrollPane;
	private JComboBox cboEstado;
	private JButton btnGarbar;
	private JButton btnModificar;
	private JButton btnEliminar;
	private JLabel lblDireccion;
	private JTextField txtDireccion;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					frmEmpleado frame = new frmEmpleado();
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
	public frmEmpleado() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 838, 599);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel lblMantenimientoEmpleados = new JLabel("Mantenimiento Empleados");
		lblMantenimientoEmpleados.setFont(new Font("Tahoma", Font.ITALIC, 18));
		lblMantenimientoEmpleados.setBounds(226, 11, 274, 30);
		contentPane.add(lblMantenimientoEmpleados);
		
		JLabel lblCodigo = new JLabel("Codigo :");
		lblCodigo.setBounds(10, 94, 46, 14);
		contentPane.add(lblCodigo);
		
		JLabel lblNombre = new JLabel("Nombre :");
		lblNombre.setBounds(10, 129, 46, 14);
		contentPane.add(lblNombre);
		
		JLabel lblApellido = new JLabel("Apellido :");
		lblApellido.setBounds(365, 94, 46, 14);
		contentPane.add(lblApellido);
		
		JLabel lblDistrito = new JLabel("Distrito :");
		lblDistrito.setBounds(365, 129, 46, 14);
		contentPane.add(lblDistrito);
		
		JLabel lblFecnacimiento = new JLabel("Fec.Nacimiento :");
		lblFecnacimiento.setBounds(10, 169, 92, 14);
		contentPane.add(lblFecnacimiento);
		
		JLabel lblTelefono = new JLabel("Telefono :");
		lblTelefono.setBounds(612, 169, 92, 14);
		contentPane.add(lblTelefono);
		
		JLabel lblCorreo = new JLabel("Correo:");
		lblCorreo.setBounds(20, 205, 46, 14);
		contentPane.add(lblCorreo);
		
		JLabel lblEstado = new JLabel("Estado :");
		lblEstado.setBounds(377, 205, 46, 14);
		contentPane.add(lblEstado);
		
		JLabel lblCelular = new JLabel("Celular :");
		lblCelular.setBounds(20, 242, 46, 14);
		contentPane.add(lblCelular);
		
		JLabel lblUsuario = new JLabel("usuario :");
		lblUsuario.setBounds(224, 242, 46, 14);
		contentPane.add(lblUsuario);
		
		JLabel lblCargo = new JLabel("cargo :");
		lblCargo.setBounds(454, 242, 46, 14);
		contentPane.add(lblCargo);
		
		txtCodigo = new JTextField();
		txtCodigo.setBounds(103, 91, 86, 20);
		contentPane.add(txtCodigo);
		txtCodigo.setColumns(10);
		
		txtNombre = new JTextField();
		txtNombre.setBounds(103, 126, 241, 20);
		contentPane.add(txtNombre);
		txtNombre.setColumns(10);
		
		txtApellido = new JTextField();
		txtApellido.setBounds(433, 91, 241, 20);
		contentPane.add(txtApellido);
		txtApellido.setColumns(10);
		
		txtDistrito = new JTextField();
		txtDistrito.setBounds(433, 126, 216, 20);
		contentPane.add(txtDistrito);
		txtDistrito.setColumns(10);
		
		txtFecha = new JTextField();
		txtFecha.setBounds(103, 166, 167, 20);
		contentPane.add(txtFecha);
		txtFecha.setColumns(10);
		
		txtFono = new JTextField();
		txtFono.setBounds(681, 166, 109, 20);
		contentPane.add(txtFono);
		txtFono.setColumns(10);
		
		txtCorreo = new JTextField();
		txtCorreo.setBounds(103, 202, 241, 20);
		contentPane.add(txtCorreo);
		txtCorreo.setColumns(10);
		
		cboEstado = new JComboBox();
		cboEstado.setModel(new DefaultComboBoxModel(new String[] {"Activado", "Desactivado"}));
		cboEstado.setBounds(433, 202, 241, 20);
		contentPane.add(cboEstado);
		
		txtCelular = new JTextField();
		txtCelular.setBounds(103, 239, 86, 20);
		contentPane.add(txtCelular);
		txtCelular.setColumns(10);
		
		txtUsuario = new JTextField();
		txtUsuario.setBounds(306, 239, 92, 20);
		contentPane.add(txtUsuario);
		txtUsuario.setColumns(10);
		
		txtCargo = new JTextField();
		txtCargo.setBounds(510, 239, 92, 20);
		contentPane.add(txtCargo);
		txtCargo.setColumns(10);
		
		scrollPane = new JScrollPane();
		scrollPane.setBounds(10, 332, 788, 199);
		contentPane.add(scrollPane);
		
		
		
		tblEmpeado = new JTable();
		tblEmpeado.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent arg0) {
				mouseClickedTblEmpeado(arg0);
			}
		});
		tblEmpeado.addKeyListener(new KeyAdapter() {
			@Override
			public void keyReleased(KeyEvent arg0) {
				keyReleasedTblEmpeado(arg0);
			}
		});
		scrollPane.setViewportView(tblEmpeado);
		
		modelo.addColumn("codigo");
		modelo.addColumn("nombre");
		modelo.addColumn("apellido");
		modelo.addColumn("direccion");
		modelo.addColumn("distrito");
		modelo.addColumn("fecha");
		modelo.addColumn("telefono");
		modelo.addColumn("correo");
		modelo.addColumn("Estado");
		modelo.addColumn("celular");
		modelo.addColumn("usuario");
		modelo.addColumn("cargo");
		
		tblEmpeado.setModel(modelo);
		
		btnGarbar = new JButton("Garbar");
		btnGarbar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				actionPerformedBtnGarbar(arg0);
			}
		});
		btnGarbar.setBounds(138, 297, 89, 23);
		contentPane.add(btnGarbar);
		
		btnModificar = new JButton("Modificar");
		btnModificar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				actionPerformedBtnModificar(arg0);
			}
		});
		btnModificar.setBounds(277, 297, 89, 23);
		contentPane.add(btnModificar);
		
		btnEliminar = new JButton("Eliminar");
		btnEliminar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				actionPerformedBtnEliminar(arg0);
			}
		});
		btnEliminar.setBounds(435, 298, 89, 23);
		contentPane.add(btnEliminar);
		
		lblDireccion = new JLabel("Direccion");
		lblDireccion.setBounds(365, 169, 46, 14);
		contentPane.add(lblDireccion);
		
		txtDireccion = new JTextField();
		txtDireccion.setBounds(433, 166, 169, 20);
		contentPane.add(txtDireccion);
		txtDireccion.setColumns(10);
		listar();
	}
	void listar(){
		modelo.setRowCount(0);
		lista=new MySqlEmpleado().listEmpleado();
		for(Empleado emp:lista){
			
			Object fila[]={emp.getCodigo(),emp.getNombre(),emp.getApelli(),emp.getDireccion(),emp.getCodDistr(),
							emp.getFecnac(),emp.getFono(),emp.getCorreo(),emp.getEstado(),emp.getCell(),emp.getCodUs(),emp.getCodcar()};
			
			modelo.addRow(fila);
		}
	}
	protected void actionPerformedBtnGarbar(ActionEvent arg0) {
		String codigo,nombre,apellido,direccion,distrito,fecha,telefono,correo,estados,celular,codusu,cargo;
		codigo=txtCodigo.getText();
		nombre=txtNombre.getText();
		apellido=txtApellido.getText();
		direccion=txtDireccion.getText();
		distrito=txtDistrito.getText();
		fecha=txtFecha.getText();
		telefono=txtFono.getText();
		correo=txtCorreo.getText();
		estados=cboEstado.getSelectedItem().toString();
		celular=txtCelular.getText();
		codusu=txtUsuario.getText();
		cargo=txtCargo.getText();
		
		
		
		Empleado emp=new Empleado();
		emp.setCodigo(Integer.parseInt(codigo));
		emp.setNombre(nombre);
		emp.setApelli(apellido);
		emp.setDireccion(direccion);
		emp.setCodDistr(Integer.parseInt(distrito));
		emp.setFecnac(fecha);
		emp.setFono(telefono);
		emp.setCorreo(correo);
		emp.setEstado(estados);
		emp.setCell(celular);
		emp.setCodUs(Integer.parseInt(codusu));
		emp.setCodcar(Integer.parseInt(cargo));
		
		int estado= objeto.addEmpleado(emp);
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
	protected void keyReleasedTblEmpeado(KeyEvent arg0) {
		int fila=tblEmpeado.getSelectedRow();
		mostrar(fila);
	}
	protected void mouseClickedTblEmpeado(MouseEvent arg0) {
		int fila=tblEmpeado.getSelectedRow();
		mostrar(fila);
	}
	void mostrar(int fila){
		String codigo,nombre,apellido,direccion,distrito,fecha,telefono,correo,estados,celular,codusu,cargo;
		codigo=tblEmpeado.getValueAt(fila, 0).toString();//0 es la columna código
		nombre=tblEmpeado.getValueAt(fila, 1).toString();//1 es la columna nombre
		apellido=tblEmpeado.getValueAt(fila, 2).toString();//2 es la columna apellido
		direccion=tblEmpeado.getValueAt(fila, 3).toString();//3 es la columna dni
		distrito=tblEmpeado.getValueAt(fila, 4).toString();
		fecha=tblEmpeado.getValueAt(fila, 5).toString();
		telefono=tblEmpeado.getValueAt(fila, 6).toString();
		correo=tblEmpeado.getValueAt(fila, 7).toString();
		estados=tblEmpeado.getValueAt(fila, 8).toString();
		celular=tblEmpeado.getValueAt(fila, 9).toString();
		codusu=tblEmpeado.getValueAt(fila, 10).toString();
		cargo=tblEmpeado.getValueAt(fila, 11).toString();
		
		//getValueAt es un método que retorna un valor según la intersección de un fila y columna 
		txtCodigo.setText(codigo);
		txtNombre.setText(nombre);
		txtApellido.setText(apellido);
		txtDireccion.setText(direccion);
		txtDistrito.setText(distrito);
		txtFecha.setText(fecha);
		txtFono.setText(telefono);
		txtCorreo.setText(correo);
		cboEstado.setSelectedItem(estados);
		txtCelular.setText(celular);
		txtUsuario.setText(codusu);
		txtCargo.setText(cargo);
	}
	protected void actionPerformedBtnModificar(ActionEvent arg0) {
		String codigo,nombre,apellido,direccion,distrito,fecha,telefono,correo,estados,celular,codusu,cargo;
		codigo=txtCodigo.getText();
		nombre=txtNombre.getText();
		apellido=txtApellido.getText();
		direccion=txtDireccion.getText();
		distrito=txtDistrito.getText();
		fecha=txtFecha.getText();
		telefono=txtFono.getText();
		correo=txtCorreo.getText();
		estados=cboEstado.getSelectedItem().toString();
		celular=txtCelular.getText();
		codusu=txtUsuario.getText();
		cargo=txtCargo.getText();
		
		
		
		Empleado emp=new Empleado();
		emp.setCodigo(Integer.parseInt(codigo));
		emp.setNombre(nombre);
		emp.setApelli(apellido);
		emp.setDireccion(direccion);
		emp.setCodDistr(Integer.parseInt(distrito));
		emp.setFecnac(fecha);
		emp.setFono(telefono);
		emp.setCorreo(correo);
		emp.setEstado(estados);
		emp.setCell(celular);
		emp.setCodUs(Integer.parseInt(codusu));
		emp.setCodcar(Integer.parseInt(cargo));
		
		int estado= objeto.updaProveedor(emp);
		if(estado==1){
			mensaje("Actualizado ok");
			listar();
		}	
		else
			mensaje("Errorrrrrrr man");
	}
	protected void actionPerformedBtnEliminar(ActionEvent arg0) {
		String codigo;
		codigo=txtCodigo.getText();
		int estado=objeto.deleteEmpeado(Integer.parseInt(codigo));
		
		if(estado==1){
			mensaje("Registro eliminado");
			listar();
		}
		else
			mensaje("Errorrrrrrr");
	}
	
}
