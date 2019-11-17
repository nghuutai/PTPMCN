package com.ptpmcn.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.ptpmcn.entity.DMSanPham;


public class DMSanPhamDAO {
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public void setDataSource(DataSource dbGreenProduct) {
		this.jdbcTemplate = new JdbcTemplate(dbGreenProduct);
	}

	public List<DMSanPham> getListDMSanPham() {
		String sql = "select * from danhmucsp order by TenDanhMuc";
		List<DMSanPham> listDMSanPham = jdbcTemplate.query(sql, new RowMapper<DMSanPham>() {

			public DMSanPham mapRow(ResultSet rs, int rowNum) throws SQLException {
				DMSanPham dmsp = new DMSanPham();
				dmsp.setMaDM(rs.getString("MaDanhMuc"));
				dmsp.setTenDM(rs.getString("TenDanhMuc"));
				return dmsp;
			}
		});
		return listDMSanPham;
	}	
}
