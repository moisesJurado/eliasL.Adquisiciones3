package controlador;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import entidad.Empleado;
import entidad.Proveedor;
import util.MySqlConectar;

public class MySqlEmpleado {

	public int addEmpleado(Empleado emp) {
		int estado = -1;
		Connection cn = null;
		PreparedStatement pstm = null;
		try {
			cn = new MySqlConectar().getConectar();
			String sql = "insert into empleado values(?,?,?,?,?,?,?,?,?,?,?,?)";

			pstm = cn.prepareStatement(sql);
			pstm.setInt(1, emp.getCodigo());
			pstm.setString(2, emp.getNombre());
			pstm.setString(3, emp.getApelli());
			pstm.setString(4, emp.getDireccion());
			pstm.setInt(5, emp.getCodDistr());
			pstm.setString(6, emp.getFecnac());
			pstm.setString(7, emp.getFono());
			pstm.setString(8, emp.getCorreo());
			pstm.setString(9, emp.getEstado());
			pstm.setString(10, emp.getCell());
			pstm.setInt(11, emp.getCodUs());
			pstm.setInt(12, emp.getCodcar());
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

	public int updaProveedor(Empleado emp) {
		int estado = -1;
		Connection cn = null;
		PreparedStatement pstm = null;
		try {
			// Paso: 1
			cn = new MySqlConectar().getConectar();
			// Paso: 2
			String sql = "update empleado set nom_empleado=?,ape_empleado=?,dir_empleado=?,cod_distrito=?,fec_nac_empleado=?,tlf_empleado=?,correo=?,est_empleado=?,cel_empleado=?,cod_usuario=?,cod_cargo=? where cod_empleado= ?";
			// Paso: 3
			pstm = cn.prepareStatement(sql);

			pstm.setString(1, emp.getNombre());
			pstm.setString(2, emp.getApelli());
			pstm.setString(3, emp.getDireccion());
			pstm.setInt(4, emp.getCodDistr());
			pstm.setString(5, emp.getFecnac());
			pstm.setString(6, emp.getFono());
			pstm.setString(7, emp.getCorreo());
			pstm.setString(8, emp.getEstado());
			pstm.setString(9, emp.getCell());
			pstm.setInt(10, emp.getCodUs());
			pstm.setInt(11, emp.getCodcar());
			pstm.setInt(12, emp.getCodigo());
			// Paso: 5
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

	public ArrayList<Empleado> listEmpleado() {
		ArrayList<Empleado> data = new ArrayList<Empleado>();
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {

			cn = new MySqlConectar().getConectar();

			String sql = "select *from empleado";

			pstm = cn.prepareStatement(sql);

			rs = pstm.executeQuery();

			Empleado emp = null;

			while (rs.next()) {

				emp = new Empleado();

				emp.setCodigo(rs.getInt(1));
				emp.setNombre(rs.getString(2));
				emp.setApelli(rs.getString(3));
				emp.setDireccion(rs.getString(4));
				emp.setCodDistr(rs.getInt(5));
				emp.setFecnac(rs.getString(6));
				emp.setFono(rs.getString(7));
				emp.setCorreo(rs.getString(8));
				emp.setEstado(rs.getString(9));
				emp.setCell(rs.getString(10));
				emp.setCodUs(rs.getInt(11));
				emp.setCodcar(rs.getInt(12));

				data.add(emp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {

			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return data;
	}

	public int deleteEmpeado(int cod) {
		int estado = -1;
		Connection cn = null;
		PreparedStatement pstm = null;
		try {
			// Paso: 1
			cn = new MySqlConectar().getConectar();
			// Paso: 2
			String sql = "delete from empleado where cod_empleado=?";
			// Paso: 3
			pstm = cn.prepareStatement(sql);
			// Paso: 4
			pstm.setInt(1, cod);
			// Paso: 5
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
