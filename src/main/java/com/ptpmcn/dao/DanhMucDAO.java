package com.ptpmcn.dao;
import com.ptpmcn.entity.DanhMuc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class DanhMucDAO {
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public void setDataSource(DataSource dbGreenProduct) {
		this.jdbcTemplate = new JdbcTemplate(dbGreenProduct);
	}

	public List<DanhMuc> getListDanhMuc() {
		String sql = "select * from danhmucsp order by TenDanhMuc";
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
		int results = jdbcTemplate.update(sql, dm.getMaDanhMuc(), dm.getTenDanhMuc());
		
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
	
	public String layTenDanhMuc(String id){	
		String sql = "select TenDanhMuc from greenproduct.danhmucsp where MaDanhMuc = ? ;";
		String tenDM = jdbcTemplate.queryForObject(sql, String.class,id);
		return tenDM;
	}
	
	public boolean kiemTraMaDanhMuc(String id) {
		String sql = "SELECT count(*) from greenproduct.danhmucsp where MaDanhMuc = ? ;";
		int kq = jdbcTemplate.queryForObject(sql, Integer.class, id);
		if(kq == 0) {
			return true;
		}else {
			return false;
		}
	}
}
