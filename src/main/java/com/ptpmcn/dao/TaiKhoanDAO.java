package com.ptpmcn.dao;
import com.ptpmcn.entity.TaiKhoan;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class TaiKhoanDAO {
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public void setDataSource(DataSource dbGreenProduct) {
		this.jdbcTemplate = new JdbcTemplate(dbGreenProduct);
	}

	public boolean kiemtraLogin(TaiKhoan tk){	
		String id = tk.getTaiKhoan();
		String pass = tk.getMatKhau();
		String sql = "select count(*) from taikhoan where TaiKhoan = ? and MatKhau = ?";
		Integer result =  jdbcTemplate.queryForObject(sql, Integer.class,id,pass);
		if(result == 0) {
			return true; // tk ko có trong csdl
		}
		else {
			return false;
		}
	}
	/*
	public List<DanhMuc> getListDanhMuc() {
		String sql = "select * from taikhoan";
		List<DanhMuc> listDanhMuc = jdbcTemplate.query(sql, new RowMapper<DanhMuc>() {

			public DanhMuc mapRow(ResultSet rs, int rowNum) throws SQLException {
				DanhMuc dm = new DanhMuc();
				dm.setMaDanhMuc(rs.getString("MaDanhMuc"));
				dm.setTenDanhMuc(rs.getString("TenDanhMuc"));
				
				return dm;
			}
		});
		return listDanhMuc;
	}
	
	public DanhMuc getDanhMucByID(String id) {
		String sql = "SELECT * FROM danhmucsp where MaDanhMuc = ?;";
		DanhMuc danhmuc = jdbcTemplate.queryForObject(sql, new RowMapper<DanhMuc>() {
			public DanhMuc mapRow(ResultSet rs, int rowNum) throws SQLException {
                DanhMuc dm = new DanhMuc();
                dm.setMaDanhMuc(rs.getString("MaDanhMuc"));
				dm.setTenDanhMuc(rs.getString("TenDanhMuc"));
                return dm;
            }
		}, id);
		return danhmuc;
	}
	
	public void themDanhMuc(final DanhMuc dm) {
		String sql = "INSERT INTO danhmucsp (`MaDanhMuc`,`TenDanhMuc`) VALUES (?, ?);";
		int result = jdbcTemplate.update(sql, dm.getMaDanhMuc(), dm.getTenDanhMuc());
	}
	
	public int suaDanhMuc(final DanhMuc dm) {
		String sql = "UPDATE danhmucsp SET `TenDanhMuc` = ? WHERE (`MaDanhMuc` = ?);";
		int result = jdbcTemplate.update(sql, dm.getTenDanhMuc(), dm.getMaDanhMuc());
		return result;
	}
	
	public int xoaDanhMuc(String id) {
		String sql = "DELETE FROM danhmucsp WHERE (`MaDanhMuc` = ?);";
		int result = jdbcTemplate.update(sql, id);
		return result;
	}
	
	public int kiemtraMaDanhMuc(String id) {
		String sql = "SELECT * FROM danhmucsp where MaDanhMuc = ?;";
		DanhMuc danhmuc = jdbcTemplate.queryForObject(sql, new RowMapper<DanhMuc>() {
			public DanhMuc mapRow(ResultSet rs, int rowNum) throws SQLException {
                DanhMuc dm = new DanhMuc();
                dm.setMaDanhMuc(rs.getString("MaDanhMuc"));
				dm.setTenDanhMuc(rs.getString("TenDanhMuc"));
                return dm;
            }
		}, id);
		if(danhmuc.equals(null)) {
			return 0; 
		}else {
			return 1;//1 la ma danh muc ton tai
		}
		
	}*/
}
