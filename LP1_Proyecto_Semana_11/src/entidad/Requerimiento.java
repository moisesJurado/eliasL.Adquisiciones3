package entidad;

public class Requerimiento {
	/*CREATE TABLE `requerimiento` (
	  `cod_requerimiento` int(11) NOT NULL,
	  `cod_empleado` int(11) NOT NULL,
	  `fec_requerimiento` date NOT NULL,
	  `fec_entrega` date NOT NULL,
	  `est_requerimiento` varchar(15) NOT NULL DEFAULT 'ACTIVO',*/
		public int codigoRequerimiento;
		public int codigoEmpleado;
		public String fechaEmision;
		public String fechaEntrega;
		public String estadoRequerimiento;
		
		
		public int getCodigoRequerimiento() {
			return codigoRequerimiento;
		}
		public void setCodigoRequerimiento(int codigoRequerimiento) {
			this.codigoRequerimiento = codigoRequerimiento;
		}
		public int getCodigoEmpleado() {
			return codigoEmpleado;
		}
		public void setCodigoEmpleado(int codigoEmpleado) {
			this.codigoEmpleado = codigoEmpleado;
		}
		public String getFechaEmision() {
			return fechaEmision;
		}
		public void setFechaEmision(String fechaEmision) {
			this.fechaEmision = fechaEmision;
		}
		public String getFechaEntrega() {
			return fechaEntrega;
		}
		public void setFechaEntrega(String fechaEntrega) {
			this.fechaEntrega = fechaEntrega;
		}
		public String getEstadoRequerimiento() {
			return estadoRequerimiento;
		}
		public void setEstadoRequerimiento(String estadoRequerimiento) {
			this.estadoRequerimiento = estadoRequerimiento;
		}
		
		
}
