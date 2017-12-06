package controlador;

import java.sql.Connection;
import java.sql.PreparedStatement;
import entidad.DetalleRequerimiento;
import util.MySqlConectar;

class MySqlDetalleRequerimiento {
	public int addDetalleRequerimiento(DetalleRequerimiento detaReq) {
		int estado = -1;
		Connection cn = null;
		PreparedStatement pstm = null;
		try {
			cn = new MySqlConectar().getConectar();
			String sql = "insert into detalle_requerimiento values(?,?,?,?,?)";
			pstm = cn.prepareStatement(sql);
			pstm.setInt(1, detaReq.getCodigoRequerimiento());
			pstm.setInt(2, detaReq.getCodigoBienes());
			pstm.setInt(3, detaReq.getCantidadBienes());
			pstm.setDouble(4, detaReq.getPrecioBase());
			pstm.setString(5, detaReq.getObsBienes());
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