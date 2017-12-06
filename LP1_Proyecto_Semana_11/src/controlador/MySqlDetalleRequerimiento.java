package controlador;

import java.sql.Connection;
import java.sql.PreparedStatement;

import entidad.DetalleRequerimiento;
import util.MySqlConectar;

public class MySqlDetalleRequerimiento {
public int addDetalleRequerimiento (DetalleRequerimiento detaReq){
	int estado=-1;
	Connection cn=null;
	PreparedStatement pstm=null;
	try {
		cn= new MySqlConectar().getConectar();
		 String sql="insert into detalle_requerimiento values(?,?,?,?,?)";
		 
		   pstm=cn.prepareStatement(sql);
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
		estado=pstm.executeUpdate();
		
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		try {
			if(pstm!=null)pstm.close();
			if(cn!=null)cn.close();
		} catch (Exception e2) {
			e2.printStackTrace();
		}
	}
	
	return estado;
}
}
