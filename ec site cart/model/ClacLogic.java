package model;

import java.util.List;

public class ClacLogic {
	private int pricetotal;
	private int tax;
	private int priceintax;

	public void priceClac(List<Integer> price) {
		for(Integer value: price) {
			pricetotal += value;
		}

		tax = (int)(pricetotal * 0.1);
		priceintax = pricetotal + tax;
	}

	public int getPriceTotal() {
		return pricetotal;
	}
	public int getTax() {
		return tax;
	}
	public int getPriceInTax() {
		return priceintax;
	}

}
