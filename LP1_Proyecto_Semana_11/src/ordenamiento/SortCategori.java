package ordenamiento;

import java.util.Comparator;

import entidad.Bienes;

public class SortCategori implements Comparator<Bienes>{

	@Override
	public int compare(Bienes o1, Bienes o2) {
		// TODO Auto-generated method stub
		return o1.getCategoria().compareTo(o2.getCategoria());
	}

}
