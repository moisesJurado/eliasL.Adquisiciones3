package Vista;

import java.awt.BorderLayout;
import java.awt.EventQueue;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JMenuBar;
import javax.swing.JMenu;
import javax.swing.JMenuItem;
import gui.*;

public class frmPrincipal extends JFrame {

	private JPanel contentPane;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					frmPrincipal frame = new frmPrincipal();
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
	public frmPrincipal() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 656, 457);
		
		JMenuBar menuBar = new JMenuBar();
		setJMenuBar(menuBar);
		
		JMenu mnMantenimiento = new JMenu("Mantenimiento");
		menuBar.add(mnMantenimiento);
		
		JMenuItem mntmProveedor = new JMenuItem("Proveedor");
		mnMantenimiento.add(mntmProveedor);
		
		JMenuItem mntmBienes = new JMenuItem("Bienes");
		mntmBienes.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				actionPerformedMntmBienes(arg0);
			}
		});
		mnMantenimiento.add(mntmBienes);
		
		JMenuItem mntmEmpleado = new JMenuItem("Empleado");
		mnMantenimiento.add(mntmEmpleado);
		
		JMenu mnConsulta = new JMenu("Consulta");
		menuBar.add(mnConsulta);
		
		JMenuItem mntmBuscarProveedor = new JMenuItem("Buscar Proveedor");
		mnConsulta.add(mntmBuscarProveedor);
		
		JMenuItem mntmBuscarBienes = new JMenuItem("Buscar Bienes");
		mnConsulta.add(mntmBuscarBienes);
		
		JMenuItem mntmBuscarEmpleado = new JMenuItem("Buscar Empleado");
		mnConsulta.add(mntmBuscarEmpleado);
		
		JMenu mnProceso = new JMenu("Proceso");
		menuBar.add(mnProceso);
		
		JMenu mnSalir = new JMenu("Salir");
		menuBar.add(mnSalir);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
	}
	
	protected void actionPerformedMntmBienes(ActionEvent arg0) {
		frmBienes ofrmBienes = new frmBienes();
		ofrmBienes.setVisible(true);
	}
	
	/*protected void actionPerformedMntmBienes(ActionEvent arg0) {
		frmBienes ofrmBienes = new frmBienes();
		ofrmBienes.setVisible(true);
	}
	
	protected void actionPerformedMntmBienes(ActionEvent arg0) {
		frmBienes ofrmBienes = new frmBienes();
		ofrmBienes.setVisible(true);
	}
	
	protected void actionPerformedMntmBienes(ActionEvent arg0) {
		frmBienes ofrmBienes = new frmBienes();
		ofrmBienes.setVisible(true);
	}
	
	protected void actionPerformedMntmBienes(ActionEvent arg0) {
		frmBienes ofrmBienes = new frmBienes();
		ofrmBienes.setVisible(true);
	}
	
	protected void actionPerformedMntmBienes(ActionEvent arg0) {
		frmBienes ofrmBienes = new frmBienes();
		ofrmBienes.setVisible(true);
	}*/
}
