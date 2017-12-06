package ordenamiento;

import java.util.Comparator;

import entidad.Proveedor;

public class SortRazon implements Comparator<Proveedor>{

	@Override
	public int compare(Proveedor o1, Proveedor o2) {
		
		return o1.getRazon().compareTo(o2.getRazon());
	}

}
