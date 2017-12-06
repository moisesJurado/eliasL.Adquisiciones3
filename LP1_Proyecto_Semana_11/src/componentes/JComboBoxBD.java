package componentes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.swing.JComboBox;
import util.MySqlConectar;

public class JComboBoxBD extends JComboBox {
	
	public JComboBoxBD (String sql){ //sql --> select cod_dis, nom_dis, from tb_distrito
		
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null; //guarda todo lo que se hace de sql y se devuelve al gestor
		
		try {
			
			cn = new MySqlConectar().getConectar();
			pstm = cn.prepareStatement(sql);
			rs = pstm.executeQuery();
			
			while (rs.next()){
				addItem(rs.getString(2)); 
				// hace que se muestre la segunda columna de tu combito que es el parametro
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				
				if (rs != null) rs.close();
				if (pstm != null) pstm.close();
				if (cn != null) cn.close();
				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	
	

}
