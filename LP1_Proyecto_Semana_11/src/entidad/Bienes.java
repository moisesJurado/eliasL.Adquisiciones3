package entidad;

public class Bienes {
	/*`cod_bienes` int(11) NOT NULL,
	  `nom_bienes` varchar(150) NOT NULL,
	  `cod_categoria` int(11) NOT NULL,
	  `precio_base` decimal(19,4) NOT NULL,
	  `est_categoria` varchar(15) NOT NULL DEFAULT 'ACTIVO',*/
	  
	public Integer codigo;
	public String nombre;
	public Integer categoria;
	public Double precioBase;
	public String estado;
	public Integer getCodigo() {
		return codigo;
	}
	public void setCodigo(Integer codigo) {
		this.codigo = codigo;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public Integer getCategoria() {
		return categoria;
	}
	public void setCategoria(Integer categoria) {
		this.categoria = categoria;
	}
	public Double getPrecioBase() {
		return precioBase;
	}
	public void setPrecioBase(Double precioBase) {
		this.precioBase = precioBase;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}

	
	
	
}
