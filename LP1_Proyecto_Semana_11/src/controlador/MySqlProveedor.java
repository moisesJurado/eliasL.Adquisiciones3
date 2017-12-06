package controlador;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import entidad.Proveedor;
import util.MySqlConectar;

public class MySqlProveedor {
	// añadir un nuevo un proveedor
	public int addPRoveedor(Proveedor pro) {
		int estado = -1;
		Connection cn = null;
		PreparedStatement pstm = null;
		try {
			cn = new MySqlConectar().getConectar();
			String sql = "insert into proveedor values(?,?,?,?,?,?,?,?,?)";

			pstm = cn.prepareStatement(sql);
			pstm.setInt(1, pro.getCodigo());
			pstm.setString(2, pro.getRazon());
			pstm.setString(3, pro.getRuc());
			pstm.setString(4, pro.getDireccion());
			pstm.setString(5, pro.getTelefono());
			pstm.setString(6, pro.getCorreo());
			pstm.setString(7, pro.getPais());
			pstm.setInt(8, pro.getCodcate());
			pstm.setString(9, pro.getEstado());
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

	// metodo para modificar
	public int updaProveedor(Proveedor pro) {
		int estado = -1;
		Connection cn = null;
		PreparedStatement pstm = null;
		try {
			// Paso: 1
			cn = new MySqlConectar().getConectar();
			// Paso: 2
			String sql = "update proveedor set prov_razon_social=?,prov_ruc=?,prov_direccion=?,prov_telefono=?,prov_correo=?,prov_pais=?,cod_categoria=?,est_proveedor=? where cod_proveedor=?";
			// Paso: 3
			pstm = cn.prepareStatement(sql);

			pstm.setString(1, pro.getRazon());
			pstm.setString(2, pro.getRuc());
			pstm.setString(3, pro.getDireccion());
			pstm.setString(4, pro.getTelefono());
			pstm.setString(5, pro.getCorreo());
			pstm.setString(6, pro.getPais());
			pstm.setInt(7, pro.getCodcate());
			pstm.setString(8, pro.getEstado());
			pstm.setInt(9, pro.getCodigo());
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

	// eliminar

	public int deleteProveedor(int cod) {
		int estado = -1;
		Connection cn = null;
		PreparedStatement pstm = null;
		try {
			// Paso: 1
			cn = new MySqlConectar().getConectar();
			// Paso: 2
			String sql = "delete from proveedor where cod_proveedor=?";
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

	// listar lector arrayList
	public ArrayList<Proveedor> listProveedor() {
		ArrayList<Proveedor> data = new ArrayList<Proveedor>();
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {

			cn = new MySqlConectar().getConectar();

			String sql = "select *from proveedor";

			pstm = cn.prepareStatement(sql);

			rs = pstm.executeQuery();

			Proveedor pro = null;

			while (rs.next()) {

				pro = new Proveedor();

				pro.setCodigo(rs.getInt(1));
				pro.setRazon(rs.getString(2));
				pro.setRuc(rs.getString(3));
				pro.setDireccion(rs.getString(4));
				pro.setTelefono(rs.getString(5));
				pro.setCorreo(rs.getString(6));
				pro.setPais(rs.getString(7));
				pro.setCodcate(rs.getInt(8));
				pro.setEstado(rs.getString(9));

				data.add(pro);
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

	public ArrayList<Proveedor> listaProveedorXRazon(String razon) {
		ArrayList<Proveedor> data = new ArrayList<Proveedor>();
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		Proveedor pro = null;
		try {
			cn = new MySqlConectar().getConectar();
			String sql = "SELECT b.cod_bienes ,b.nom_bienes,b.cod_categoria,b.precio_base,b.est_categoria from bienes b where b.nom_bienes like 'd%'"
					+ "join categoria c on c.cod_categoria=p.cod_categoria where p.prov_razon_social like  ?";
			pstm = cn.prepareStatement(sql);
			pstm.setString(1, razon + "%");

			rs = pstm.executeQuery();
			while (rs.next()) {
				pro = new Proveedor();

				pro.setCodigo(rs.getInt(1));
				pro.setRazon(rs.getString(2));
				pro.setRuc(rs.getString(3));
				pro.setDireccion(rs.getString(4));
				pro.setTelefono(rs.getString(5));
				pro.setCorreo(rs.getString(6));
				pro.setPais(rs.getString(7));
				pro.setNombrecate(rs.getString(8));
				pro.setEstado(rs.getString(9));
				data.add(pro);
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
