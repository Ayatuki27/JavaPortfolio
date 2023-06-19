package model;

import java.io.Serializable;

public class Item implements Serializable {
	private String itemid;
	private int itemprice;
	private int categoryid;
	private String category;

	public String getItemid() {
		return itemid;
	}
	public int getItemprice() {
		return itemprice;
	}
	public int getCategoryid() {
		return categoryid;
	}
	public String getCategory() {
		return category;
	}
	public void setItemid(String itemid) {
		this.itemid = itemid;
	}
	public void setItemprice(int itemprice) {
		this.itemprice = itemprice;
	}
	public void setCategoryid(int categoryid) {
		this.categoryid = categoryid;
	}
	public void setCategory(String category) {
		this.category = category;
	}
}
