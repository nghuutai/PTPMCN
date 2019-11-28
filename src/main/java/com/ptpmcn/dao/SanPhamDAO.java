package com.ptpmcn.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.ptpmcn.entity.SanPham;


public class SanPhamDAO {
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public void setDataSource(DataSource dbGreenProduct) {
		this.jdbcTemplate = new JdbcTemplate(dbGreenProduct);
	}

	public List<SanPham> getListSanPham() {
		String sql = "select * from sanpham";
		List<SanPham> listSanPham = jdbcTemplate.query(sql, new RowMapper<SanPham>() {

			public SanPham mapRow(ResultSet rs, int rowNum) throws SQLException {
				SanPham sp = new SanPham();
				sp.setMaSanPham(rs.getInt("MaSanPham"));
				sp.setMaDM(rs.getString("MaDanhMuc"));
				sp.setTenSanPham(rs.getString("TenSanPham"));
				sp.setDonGia(rs.getInt("DonGia"));
				sp.setSoLuong(rs.getInt("SoLuong"));
				sp.setHinhAnh(rs.getString("HinhAnh"));
				sp.setMoTa(rs.getString("MoTa"));
				sp.setDonViTinh(rs.getString("DonViTinh"));
				
				return sp;
			}
		});
		return listSanPham;
	}
	public List<SanPham> getListSanPhamMoi() {
		String sql = "select * from sanpham order by MaSanPham DESC limit 8";
		List<SanPham> listSanPhamMoi = jdbcTemplate.query(sql, new RowMapper<SanPham>() {

			public SanPham mapRow(ResultSet rs, int rowNum) throws SQLException {
				SanPham sp = new SanPham();
				sp.setMaSanPham(rs.getInt("MaSanPham"));
				sp.setMaDM(rs.getString("MaDanhMuc"));
				sp.setTenSanPham(rs.getString("TenSanPham"));
				sp.setDonGia(rs.getInt("DonGia"));
				sp.setSoLuong(rs.getInt("SoLuong"));
				sp.setHinhAnh(rs.getString("HinhAnh"));
				sp.setMoTa(rs.getString("MoTa"));
				sp.setDonViTinh(rs.getString("DonViTinh"));
				
				return sp;
			}
		});
		return listSanPhamMoi;
	}
	public List<SanPham> getListSanPhamBanChay() {
		String sql = "SELECT MaDanhMuc,chitietgiohang.MaSanPham,TenSanPham,DonGia,SoLuong,HinhAnh,MoTa,HinhAnh,DonViTinh,SUM(chitietgiohang.SoLuongMua) as TongSoLuong FROM chitietgiohang, sanpham  where sanpham.MaSanPham = chitietgiohang.MaSanPham group by MaSanPham order by TongSoLuong DESC LIMIT 8;";
		List<SanPham> listSanPhamBanChay = jdbcTemplate.query(sql, new RowMapper<SanPham>() {

			public SanPham mapRow(ResultSet rs, int rowNum) throws SQLException {
				SanPham sp = new SanPham();
				sp.setMaSanPham(rs.getInt("MaSanPham"));
				sp.setMaDM(rs.getString("MaDanhMuc"));
				sp.setTenSanPham(rs.getString("TenSanPham"));
				sp.setDonGia(rs.getInt("DonGia"));
				sp.setSoLuong(rs.getInt("SoLuong"));
				sp.setHinhAnh(rs.getString("HinhAnh"));
				sp.setMoTa(rs.getString("MoTa"));
				sp.setDonViTinh(rs.getString("DonViTinh"));
				
				return sp;
			}
		});
		return listSanPhamBanChay;
	}
	public List<SanPham> getListSanPhamTheoDanhMuc(String maDanhMuc) {
		String sql = "SELECT * FROM  sanpham  where MaDanhMuc =?";
		List<SanPham> listSanPhamTheoDanhMuc = jdbcTemplate.query(sql, new RowMapper<SanPham>() {

			public SanPham mapRow(ResultSet rs, int rowNum) throws SQLException {
				SanPham sp = new SanPham();
				sp.setMaSanPham(rs.getInt("MaSanPham"));
				sp.setMaDM(rs.getString("MaDanhMuc"));
				sp.setTenSanPham(rs.getString("TenSanPham"));
				sp.setDonGia(rs.getInt("DonGia"));
				sp.setSoLuong(rs.getInt("SoLuong"));
				sp.setHinhAnh(rs.getString("HinhAnh"));
				sp.setMoTa(rs.getString("MoTa"));
				sp.setDonViTinh(rs.getString("DonViTinh"));
				
				return sp;
			}
		},maDanhMuc);
		return listSanPhamTheoDanhMuc;
	}
	
	public SanPham getSanPhamById(int id) {
		String sql = "SELECT * FROM GreenProduct.SanPham where MaSanPham=?;";
		SanPham sp = jdbcTemplate.queryForObject(sql, new RowMapper<SanPham>() {
			public SanPham mapRow(ResultSet rs, int rowNum) throws SQLException {
				SanPham sanPham = new SanPham();
				sanPham.setMaSanPham(rs.getInt("MaSanPham"));
				sanPham.setMaDM(rs.getString("MaDanhMuc"));
				sanPham.setTenSanPham(rs.getString("TenSanPham"));
				sanPham.setDonGia(rs.getInt("DonGia"));
				sanPham.setSoLuong(rs.getInt("SoLuong"));
				sanPham.setHinhAnh(rs.getString("HinhAnh"));
				sanPham.setMoTa(rs.getString("MoTa"));
				sanPham.setDonViTinh(rs.getString("DonViTinh"));
				return sanPham;
            }
		}, id);
		return sp;
	}
	
	public int getSoLuong(int id) {
		String sql = "SELECT SoLuong FROM GreenProduct.SanPham where MaSanPham=?;";
		int result =jdbcTemplate.queryForObject(sql, new Object[]{id}, Integer.class);
		return result;
	}
	
	public int suaSoLuong(int sl, int id) {
		String sql = "UPDATE `GreenProduct`.`SanPham` SET `SoLuong` = `SoLuong` - ? WHERE (`MaSanPham` = ?);";
		int result = jdbcTemplate.update(sql, sl, id);
		return result;
	}
}
