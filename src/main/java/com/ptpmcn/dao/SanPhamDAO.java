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
		String sql = "SELECT sanpham.MaDanhMuc,MaSanPham,TenSanPham,DonGia,SoLuong,HinhAnh,MoTa,HinhAnh,DonViTinh FROM danhmucsp, sanpham  where sanpham.MaDanhMuc = danhmucsp.MaDanhMuc and sanpham.MaDanhMuc = '" + maDanhMuc + "';";
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
		});
		return listSanPhamTheoDanhMuc;
	}
	
}
