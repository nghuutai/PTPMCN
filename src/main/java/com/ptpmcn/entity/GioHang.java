package com.ptpmcn.entity;

public class GioHang {

	private SanPham sanPham;
	private int soLuong;
	private int soLuongCon;
	
	public GioHang(SanPham sanPham, int soLuong, int soLuongCon) {
		super();
		this.sanPham = sanPham;
		this.soLuong = soLuong;
		this.soLuongCon = soLuongCon;
	}
	
	public GioHang() {
		
	}

	public SanPham getSanPham() {
		return sanPham;
	}

	public void setSanPham(SanPham sanPham) {
		this.sanPham = sanPham;
	}

	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

	public int getSoLuongCon() {
		return soLuongCon;
	}

	public void setSoLuongCon(int soLuongCon) {
		this.soLuongCon = soLuongCon;
	}
	
	public int tongTien() {
		return this.sanPham.getDonGia() * this.soLuong;
	}
	
}
