package ordenamiento;

import java.util.Comparator;

import entidad.Proveedor;

public class SortCategoria implements Comparator<Proveedor>{

	@Override
	public int compare(Proveedor o1, Proveedor o2) {
		// TODO Auto-generated method stub
		return  o1.getCodcate().compareTo(o2.getCodcate());
	}

}
