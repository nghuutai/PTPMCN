package com.ptpmcn.entity;

public class TaiKhoan {
	public String taiKhoan;
	private String matKhau;
	private boolean vaiTro;
	
	public TaiKhoan() {
	}
	
	public TaiKhoan(String taiKhoan, String matKhau) {
		super();
		this.taiKhoan = taiKhoan;
		this.matKhau = matKhau;
	}

	public String getTaiKhoan() {
		return taiKhoan;
	}
	public void setTaiKhoan(String taiKhoan) {
		this.taiKhoan = taiKhoan;
	}
	public String getMatKhau() {
		return matKhau;
	}
	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}
	public boolean getVaiTro() {
		return vaiTro;
	}
	public void setVaiTro(Boolean vaiTro) {
		this.vaiTro = vaiTro;
	}

}
