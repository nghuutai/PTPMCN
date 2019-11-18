package com.ptpmcn.entity;

public class SanPham {
	 
	private int maSanPham;
	private String maDM;
	private String tenSanPham;
	private int donGia;
	private int soLuong;
	private String hinhAnh;
	private String moTa;
	private String donViTinh;
	
	
	public SanPham(int maSanPham, String maDM, String tenSanPham, int donGia, int soLuong, String hinhAnh, String moTa,
			String donViTinh) {
		super();
		this.maSanPham = maSanPham;
		this.maDM = maDM;
		this.tenSanPham = tenSanPham;
		this.donGia = donGia;
		this.soLuong = soLuong;
		this.hinhAnh = hinhAnh;
		this.moTa = moTa;
		this.donViTinh = donViTinh;
	}

	public SanPham() {
		
	}
	
	
	public int getMaSanPham() {
		return maSanPham;
	}

	public void setMaSanPham(int maSanPham) {
		this.maSanPham = maSanPham;
	}

	public String getMaDM() {
		return maDM;
	}
	public void setMaDM(String maDM) {
		this.maDM = maDM;
	}
	public String getTenSanPham() {
		return tenSanPham;
	}
	public void setTenSanPham(String tenSanPham) {
		this.tenSanPham = tenSanPham;
	}
	public int getDonGia() {
		return donGia;
	}
	public void setDonGia(int donGia) {
		this.donGia = donGia;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	public String getHinhAnh() {
		return hinhAnh;
	}
	public void setHinhAnh(String hinhAnh) {
		this.hinhAnh = hinhAnh;
	}
	public String getMoTa() {
		return moTa;
	}
	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}
	public String getDonViTinh() {
		return donViTinh;
	}
	public void setDonViTinh(String donViTinh) {
		this.donViTinh = donViTinh;
	}
	
	
	

}
