package gui;

import java.awt.BorderLayout;
import java.awt.EventQueue;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.table.DefaultTableModel;
import componentes.JComboBoxBD;
import controlador.MySqlBienes;
import controlador.MySqlDetalleRequerimiento;
import controlador.MySqlRequerimiento;
import entidad.Bienes;
import entidad.DetalleRequerimiento;
import entidad.Requerimiento;
import javax.swing.JLabel;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.text.DateFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.swing.JTextField;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JComboBox;
import javax.swing.JSpinner;
import javax.swing.JButton;

public class frmRequerimiento extends JFrame {
	ArrayList<Requerimiento> lista = new ArrayList<Requerimiento>();
	ArrayList<DetalleRequerimiento> listadetalle = new ArrayList<DetalleRequerimiento>();
	MySqlRequerimiento objeto = new MySqlRequerimiento();
	MySqlDetalleRequerimiento objetodetalle = new MySqlDetalleRequerimiento();
	DefaultTableModel modelo = new DefaultTableModel();

	private JPanel contentPane;
	private JTextField txtCodRequerimiento;
	private JTextField txtCodEmpleado;
	private JTextField txtFechaEmision;
	private JTextField txtFechaEntrega;
	private JTextField txtObservaciones;
	private JTable tblDetalleRequerimiento;
	private JComboBoxBD cboBienes;
	private JSpinner spCantidad;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					frmRequerimiento frame = new frmRequerimiento();
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
	public frmRequerimiento() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 716, 460);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);

		JLabel lblRequerimiento = new JLabel("EMITIR REQUERIMIENTO");
		lblRequerimiento.setFont(new Font("Tahoma", Font.BOLD, 16));
		lblRequerimiento.setBounds(237, 22, 216, 14);
		contentPane.add(lblRequerimiento);

		JLabel lblCdigo = new JLabel("C\u00F3digo Requerimiento");
		lblCdigo.setBounds(10, 60, 111, 14);
		contentPane.add(lblCdigo);

		JLabel lblCdigoEmpleado = new JLabel("C\u00F3digo Empleado");
		lblCdigoEmpleado.setBounds(264, 57, 92, 14);
		contentPane.add(lblCdigoEmpleado);

		JLabel lblFecha = new JLabel("Fecha de Emisi\u00F3n");
		lblFecha.setBounds(508, 57, 82, 14);
		contentPane.add(lblFecha);

		JLabel lblFechaDeEntrega = new JLabel("Fecha de Entrega");
		lblFechaDeEntrega.setBounds(10, 88, 111, 14);
		contentPane.add(lblFechaDeEntrega);

		txtCodRequerimiento = new JTextField();
		txtCodRequerimiento.setBounds(125, 57, 86, 20);
		contentPane.add(txtCodRequerimiento);
		txtCodRequerimiento.setColumns(10);

		txtCodEmpleado = new JTextField();
		txtCodEmpleado.setColumns(10);
		txtCodEmpleado.setBounds(367, 54, 86, 20);
		contentPane.add(txtCodEmpleado);

		txtFechaEmision = new JTextField();
		txtFechaEmision.setEditable(false);
		txtFechaEmision.setColumns(10);
		txtFechaEmision.setBounds(604, 54, 86, 20);
		contentPane.add(txtFechaEmision);

		txtFechaEntrega = new JTextField();
		txtFechaEntrega.setColumns(10);
		txtFechaEntrega.setBounds(125, 85, 86, 20);
		contentPane.add(txtFechaEntrega);

		JLabel lblElegirBienesDe = new JLabel("Elegir bien");
		lblElegirBienesDe.setBounds(10, 113, 73, 14);
		contentPane.add(lblElegirBienesDe);

		cboBienes = new JComboBoxBD(new MySqlBienes().listBienes());
		cboBienes.setBounds(125, 113, 565, 17);
		contentPane.add(cboBienes);

		spCantidad = new JSpinner();
		spCantidad.setBounds(125, 200, 86, 20);
		contentPane.add(spCantidad);

		JLabel lblCantidad = new JLabel("Cantidad");
		lblCantidad.setBounds(10, 202, 73, 14);
		contentPane.add(lblCantidad);

		JLabel lblObservaciones = new JLabel("Observaciones");
		lblObservaciones.setBounds(10, 138, 73, 14);
		contentPane.add(lblObservaciones);

		txtObservaciones = new JTextField();
		txtObservaciones.setBounds(125, 142, 565, 47);
		contentPane.add(txtObservaciones);
		txtObservaciones.setColumns(10);

		JButton btnPasar = new JButton("Pasar");
		btnPasar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				actionPerformedBtnPasar(arg0);
			}
		});
		btnPasar.setBounds(321, 199, 89, 23);
		contentPane.add(btnPasar);

		JButton btnEliminar = new JButton("Eliminar");
		btnEliminar.setBounds(513, 199, 89, 23);
		contentPane.add(btnEliminar);

		JButton btnGenerar = new JButton("Generar");
		btnGenerar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				actionPerformedBtnGenerar(arg0);
			}
		});
		btnGenerar.setBounds(309, 387, 89, 23);
		contentPane.add(btnGenerar);

		JScrollPane scrollPane = new JScrollPane();
		scrollPane.setBounds(10, 231, 680, 142);
		contentPane.add(scrollPane);

		modelo.addColumn("C�digo");
		modelo.addColumn("Bien");
		modelo.addColumn("Precio Base");
		modelo.addColumn("Cantidad");
		modelo.addColumn("Observaciones");
		tblDetalleRequerimiento = new JTable(modelo);
		scrollPane.setViewportView(tblDetalleRequerimiento);
	}

	protected void actionPerformedBtnPasar(ActionEvent arg0) {
		String nombreDelBienEnCuestion = cboBienes.getSelectedItem().toString();
		Object[] objs = { txtCodRequerimiento.getText(), nombreDelBienEnCuestion,
				new MySqlBienes().listaBienesXnombre(nombreDelBienEnCuestion).get(0).precioBase, spCantidad.getValue(),
				txtObservaciones.getText() };
		modelo.addRow(objs);
		tblDetalleRequerimiento = new JTable(modelo);
	}

	protected void actionPerformedBtnGenerar(ActionEvent arg0) {
		Requerimiento elRequerimiento = new Requerimiento();
		elRequerimiento.setCodigoRequerimiento(Integer.parseInt(txtCodRequerimiento.getText()));
		elRequerimiento.setCodigoEmpleado(Integer.parseInt(txtCodEmpleado.getText()));
		DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
		elRequerimiento.setFechaEmision(df.format(new Date()));
		elRequerimiento.setFechaEntrega(txtFechaEntrega.getText());
		elRequerimiento.setEstadoRequerimiento("1"/* cboEstado.getValue() */);
		new MySqlRequerimiento().addRequerimiento(elRequerimiento);

		ArrayList<DetalleRequerimiento> tableSaved = new ArrayList<DetalleRequerimiento>();
		DetalleRequerimiento rowSaved;
		int rowCount = tblDetalleRequerimiento.getModel().getRowCount();
		int colCount = tblDetalleRequerimiento.getModel().getColumnCount();
		Object objAux;
		for (int row = 0; row < rowCount; row++) {
			rowSaved = new DetalleRequerimiento();
			for (int column = 0; column < colCount; column++) {
				objAux = tblDetalleRequerimiento.getModel().getValueAt(row, column);
				if (column == 0)
					rowSaved.codigoRequerimiento = Integer.parseInt(objAux.toString());
				if (column == 1)
					rowSaved.codigoBienes = new MySqlBienes().listaBienesXnombre(objAux.toString()).get(0).getCodigo();
				if (column == 2) {
					NumberFormat _format = NumberFormat.getInstance(Locale.US);
					Number number = null;
					try {
						number = _format.parse(objAux.toString());
						double _double = Double.parseDouble(number.toString());
						rowSaved.precioBase = _double;
					} catch (ParseException e) {
					}
				}
				if (column == 3)
					rowSaved.cantidadBienes = Integer.parseInt(objAux.toString());
				if (column == 4)
					rowSaved.obsBienes = objAux.toString();
			}
			tableSaved.add(rowSaved);
		}
		for (DetalleRequerimiento i : tableSaved)
			new MySqlDetalleRequerimiento().addDetalleRequerimiento(i);
	}
}
