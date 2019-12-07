package com.ptpmcn.dao;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.ptpmcn.entity.ChiTietHoaDon;

public class ChiTietHoaDonDAO {

	private JdbcTemplate jdbcTemplate;
	@Autowired
	public void setDataSource(DataSource dbGreenProduct) {
		this.jdbcTemplate = new JdbcTemplate(dbGreenProduct);
	}
	
	public int addChiTietHoaDon(ChiTietHoaDon chiTietHoaDon) {
		String sql = "INSERT INTO `GreenProduct`.`chitiethoadon` (`MaHoaDon`, `MaSanPham`, `SoLuongMua`) VALUES (?, ?, ?);";
		int result = jdbcTemplate.update(sql, chiTietHoaDon.getHoaDon().getMaHoaDon(), chiTietHoaDon.getSanPham().getMaSanPham(), chiTietHoaDon.getSoLuongMua());
		return 1;
	}
}
