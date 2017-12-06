package entidad;

public class DetalleRequerimiento {
	/*CREATE TABLE `detalle_requerimiento` (
	  `cod_requerimiento` int(11) NOT NULL,
	  `cod_bienes` int(11) NOT NULL,
	  `cantidad_requerida` int(11) NOT NULL,
	  precio base double not null,
	  `observaciones` varchar(500) NOT NULL,
	  PRIMARY KEY (`cod_requerimiento`,`cod_bienes`),*/
		public int codigoRequerimiento;
		public int codigoBienes;
		public int cantidadBienes;
		public double precioBase;
		public String obsBienes;
		
		
		
		public int getCodigoRequerimiento() {
			return codigoRequerimiento;
		}
		public void setCodigoRequerimiento(int codigoRequerimiento) {
			this.codigoRequerimiento = codigoRequerimiento;
		}
		public int getCodigoBienes() {
			return codigoBienes;
		}
		public void setCodigoBienes(int codigoBienes) {
			this.codigoBienes = codigoBienes;
		}
		public int getCantidadBienes() {
			return cantidadBienes;
		}
		public void setCantidadBienes(int cantidadBienes) {
			this.cantidadBienes = cantidadBienes;
		}
		public double getPrecioBase() {
			return precioBase;
		}
		public void setPrecioBase(double precioBase) {
			this.precioBase = precioBase;
		}
		public String getObsBienes() {
			return obsBienes;
		}
		public void setObsBienes(String obsBienes) {
			this.obsBienes = obsBienes;
		}
		
}
