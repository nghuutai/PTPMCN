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
}
