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
		mntmProveedor.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				actionPerformedMntmProveedor(arg0);
			}
		});
		mnMantenimiento.add(mntmProveedor);
		
		JMenuItem mntmBienes = new JMenuItem("Bienes");
		mntmBienes.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				actionPerformedMntmBienes(arg0);
			}
		});
		mnMantenimiento.add(mntmBienes);
		
		JMenuItem mntmEmpleado = new JMenuItem("Empleado");
		mntmEmpleado.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				actionPerformedMntm5(arg0);
			}
		});
		mnMantenimiento.add(mntmEmpleado);
		
		JMenu mnConsulta = new JMenu("Consulta");
		menuBar.add(mnConsulta);
		
		JMenuItem mntmBuscarProveedor = new JMenuItem("Buscar Proveedor");
		mntmBuscarProveedor.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				actionPerformedMntm4(arg0);
			}
		});
		mnConsulta.add(mntmBuscarProveedor);
		
		JMenuItem mntmBuscarBienes = new JMenuItem("Buscar Bienes");
		mntmBuscarBienes.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				actionPerformedMntm3(arg0);
			}
		});
		mnConsulta.add(mntmBuscarBienes);
		
		JMenuItem mntmBuscarEmpleado = new JMenuItem("Buscar Empleado");
		mntmBuscarEmpleado.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				actionPerformedMntm5(arg0);
			}
		});
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
	protected void actionPerformedMntmProveedor(ActionEvent arg0) {
		frmProveedor jframe = new frmProveedor();
		jframe.setVisible(true);
	}
	
	
	protected void actionPerformedMntm3(ActionEvent arg0) {
		frmBuscaBienes jframe = new frmBuscaBienes();
		jframe.setVisible(true);
	}
	
	protected void actionPerformedMntm4(ActionEvent arg0) {
		frmBuscaProveedor jframe = new frmBuscaProveedor();
		jframe.setVisible(true);
	}
	
	protected void actionPerformedMntm5(ActionEvent arg0) {
		frmEmpleado jframe = new frmEmpleado();
		jframe.setVisible(true);
	}
	
	protected void actionPerformedMntm6(ActionEvent arg0) {
		frmBienes jframe = new frmBienes();
		jframe.setVisible(true);
	}
}
