package com.ptpmcn.dao;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.ptpmcn.entity.HoaDon;

public class HoaDonDAO {

	private JdbcTemplate jdbcTemplate;
	@Autowired
	public void setDataSource(DataSource dbGreenProduct) {
		this.jdbcTemplate = new JdbcTemplate(dbGreenProduct);
	}
	
	public int addHoaDon(HoaDon hoaDon) {
		String sql = "INSERT INTO `GreenProduct`.`giohang` (`NgayTaoGioHang`, `Email`, `SoDienThoai`, `TenKhachHang`, `DiaChi`, `TinhTrangGioHang`) VALUES (?, ?, ?, ?, ?, ?);";
		int result = jdbcTemplate.update(sql, hoaDon.getNgayTao(), hoaDon.getEmail(), hoaDon.getSoDienThoai(), hoaDon.getTenKhachHang(), hoaDon.getDiaChi(), hoaDon.getTinhTrangHoaDon());
		return result;
	}
	
	public int getMaHoaDon() {
		String sql = "SELECT max(MaGioHang) FROM GreenProduct.giohang;";
		int result =jdbcTemplate.queryForObject(sql, Integer.class);
		return result;
	}
}
