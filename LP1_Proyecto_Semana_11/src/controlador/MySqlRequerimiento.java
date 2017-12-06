package controlador;

import java.sql.Connection;
import java.sql.PreparedStatement;
import entidad.Requerimiento;
import util.MySqlConectar;

public class MySqlRequerimiento {
	public int addRequerimiento(Requerimiento req) {
		int estado = -1;
		Connection cn = null;
		PreparedStatement pstm = null;			
		try {
			cn = new MySqlConectar().getConectar();
			String sql = "insert into Requerimiento values(?,?,?,?,?)";
			pstm = cn.prepareStatement(sql);
			pstm.setInt(1, req.getCodigoRequerimiento());
			pstm.setInt(2, req.getCodigoEmpleado());
			pstm.setString(3, req.getFechaEmision());
			pstm.setString(4, req.getFechaEntrega());
			pstm.setString(5, req.getEstadoRequerimiento());
			estado = pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null)
					pstm.close();
				if (cn != null)
					cn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return estado;
	}
}