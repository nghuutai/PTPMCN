package com.ptpmcn.entity;

public class DMSanPham {
	
	private String maDM;
	private String tenDM;
	
	public DMSanPham() {
		
	}
	public DMSanPham(String maDM, String tenDM) {
		super();
		this.maDM = maDM;
		this.tenDM = tenDM;
	}
	public String getMaDM() {
		return maDM;
	}
	public void setMaDM(String maDM) {
		this.maDM = maDM;
	}
	public String getTenDM() {
		return tenDM;
	}
	public void setTenDM(String tenDM) {
		this.tenDM = tenDM;
	}
	
	

}
