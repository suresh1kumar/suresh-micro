package com.servlet.bean;

public class Product {
	private int regionid;
	private String r_shortname;
	private String r_fullname;
	public int getRegionid() {
		return regionid;
	}
	public void setRegionid(int regionid) {
		this.regionid = regionid;
	}
	public String getR_shortname() {
		return r_shortname;
	}
	public void setR_shortname(String r_shortname) {
		this.r_shortname = r_shortname;
	}
	public String getR_fullname() {
		return r_fullname;
	}
	public void setR_fullname(String r_fullname) {
		this.r_fullname = r_fullname;
	}
	@Override
	public String toString() {
		return "Product [regionid=" + regionid + ", r_shortname=" + r_shortname + ", r_fullname=" + r_fullname + "]";
	}
	
	
	/*private int productId;
	private String productName;
	private double price;
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "Product [productId=" + productId + ", productName=" + productName + ", price=" + price + "]";
	}
	*/
	
}
