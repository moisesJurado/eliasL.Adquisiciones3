package controlador;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import entidad.Bienes;
import entidad.Proveedor;
import util.MySqlConectar;

public class MySqlBienes {
	public int addBienes(Bienes bie) {
		int estado = -1;
		Connection cn = null;
		PreparedStatement pstm = null;
		try {
			cn = new MySqlConectar().getConectar();
			String sql = "insert into bienes values(?,?,?,?,?)";

			pstm = cn.prepareStatement(sql);
			pstm.setInt(1, bie.getCodigo());
			pstm.setString(2, bie.getNombre());
			pstm.setInt(3, bie.getCategoria());
			pstm.setDouble(4, bie.getPrecioBase());
			pstm.setString(5, bie.getEstado());
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

	public int updateBienes(Bienes bie) {
		int estado = -1;
		Connection cn = null;
		PreparedStatement pstm = null;
		try {
			cn = new MySqlConectar().getConectar();
			String sql = "update bienes set nom_bienes=?,cod_categoria=?,precio_base=?,est_categoria=? where cod_bienes=?";

			pstm = cn.prepareStatement(sql);

			pstm.setString(1, bie.getNombre());
			pstm.setInt(2, bie.getCategoria());
			pstm.setDouble(3, bie.getPrecioBase());
			pstm.setString(4, bie.getEstado());
			pstm.setInt(5, bie.getCodigo());
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

	public int deleteBienes(int codigo) {
		int estado = -1;
		Connection cn = null;
		PreparedStatement pstm = null;
		try {
			cn = new MySqlConectar().getConectar();
			String sql = "delete from bienes where cod_bienes=?";
			pstm = cn.prepareStatement(sql);
			pstm.setInt(1, codigo);
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

	public int deletebienes(int cod) {
		int estado = -1;
		Connection cn = null;
		PreparedStatement pstm = null;
		try {
			// Paso: 1
			cn = new MySqlConectar().getConectar();
			// Paso: 2
			String sql = "delete from bienes where cod_bienes=?";
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

	public ArrayList<Bienes> listBienes() {
		ArrayList<Bienes> data = new ArrayList<Bienes>();
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;// objeto que almacena el resultado de un SELECT
		try {
			// Paso 1:
			cn = new MySqlConectar().getConectar();
			// Paso 2:
			String sql = "select*from bienes";
			// PAso 3:
			pstm = cn.prepareStatement(sql);
			// Paso 4:
			// Paso 5: ejecutar la sentencia sql y almacenar su contenido en el objeto "rs"
			rs = pstm.executeQuery();
			// Paso 6: declarar un objeto de la clase Lector
			Bienes bie = null;
			// Paso 7: bucle
			while (rs.next()) {
				// Paso 8: crear el objeto "lec"
				bie = new Bienes();
				// Paso 9: obtener los valores del registro actual y enviarlos al objeto "lec"
				// setear

				bie.setCodigo(rs.getInt(1));// 1 es la columna cod_lec
				bie.setNombre(rs.getString(2));// 2 es la columna nom_lec
				bie.setCategoria(rs.getInt(3));// 3 es la columna ape_lec
				bie.setPrecioBase(rs.getDouble(4));// 3 es la columna dni_lec
				bie.setEstado(rs.getString(5));// 4 es la columna sexo_lec
				// Paso 10: enviar el objeto al arreglo "data"
				data.add(bie);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstm != null)
					pstm.close();
				if (cn != null)
					cn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return data;
	}

	public ArrayList<Bienes> listaBienesXnombre(String nombre) {
		ArrayList<Bienes> data = new ArrayList<Bienes>();
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;

		try {
			cn = new MySqlConectar().getConectar();
			String sql = "SELECT b.cod_bienes ,b.nom_bienes,b.cod_categoria,b.precio_base,b.est_categoria from bienes b where b.nom_bienes like ?";

			pstm = cn.prepareStatement(sql);
			pstm.setString(1, nombre + "%");

			rs = pstm.executeQuery();

			Bienes bie = null;
			while (rs.next()) {
				bie = new Bienes();

				bie.setCodigo(rs.getInt(1));// 1 es la columna cod_lec
				bie.setNombre(rs.getString(2));// 2 es la columna nom_lec
				bie.setCategoria(rs.getInt(3));// 3 es la columna ape_lec
				bie.setPrecioBase(rs.getDouble(4));// 3 es la columna dni_lec
				bie.setEstado(rs.getString(5));
				data.add(bie);
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
}
