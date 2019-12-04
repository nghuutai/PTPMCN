package service;

import static org.junit.Assert.*;

import java.util.HashMap;

import org.junit.Test;

import com.ptpmcn.entity.GioHang;
import com.ptpmcn.entity.SanPham;

public class GioHangServiceTest {

	@Test
	public void testGiamGioHang() {
		SanPham sp = new SanPham(1,"DM1","abc",10000,5,"abc.jpg","Day la mot san pham tot","cai");
		GioHang gh = new GioHang(sp,2,5);
		HashMap<Integer, GioHang> arr = new HashMap<Integer, GioHang>();
		arr.put(sp.getMaSanPham(),gh);
		HashMap<Integer, GioHang> arr1 = GioHangService.giamGioHang(arr, sp, sp.getMaSanPham(), 1, 5);
		assertTrue((arr1.get(1)).getSoLuong()==1);
	}

	@Test
	public void testXoaGioHang() {
		SanPham sp = new SanPham(1,"DM1","abc",10000,5,"abc.jpg","Day la mot san pham tot","cai");
		SanPham sp1 = new SanPham(2,"DM1","abcd",10000,5,"abcd.jpg","Day la mot san pham tot","cai");
		GioHang gh1 = new GioHang(sp,2,5);
		GioHang gh2 = new GioHang(sp1,3,5);
		HashMap<Integer, GioHang> arr = new HashMap<Integer, GioHang>();
		arr.put(sp.getMaSanPham(),gh1);
		arr.put(sp1.getMaSanPham(),gh2);
		HashMap<Integer, GioHang> arr1 = GioHangService.xoaGioHang(arr, sp.getMaSanPham());	
		assertTrue(GioHangService.tongSoLuongGioHang(arr1)==3);
	}


	@Test
	public void testTangGioHang() {
		SanPham sp = new SanPham(1,"DM1","abc",10000,5,"abc.jpg","Day la mot san pham tot","cai");
		GioHang gh = new GioHang(sp,2,5);
		HashMap<Integer, GioHang> arr = new HashMap<Integer, GioHang>();
		arr.put(sp.getMaSanPham(),gh);
		HashMap<Integer, GioHang> arr1 = GioHangService.tangGioHang(arr, sp, sp.getMaSanPham(), 1, 5);
		assertTrue((arr1.get(1)).getSoLuong()==3);
	}

	@Test
	public void testTongSoLuongGioHang() {
		SanPham sp = new SanPham(1,"DM1","abc",10000,5,"abc.jpg","Day la mot san pham tot","cai");
		SanPham sp1 = new SanPham(2,"DM1","abcd",10000,5,"abcd.jpg","Day la mot san pham tot","cai");
		GioHang gh1 = new GioHang(sp,2,5);
		GioHang gh2 = new GioHang(sp1,3,5);
		HashMap<Integer, GioHang> arr = new HashMap<Integer, GioHang>();
		arr.put(sp.getMaSanPham(),gh1);
		arr.put(sp1.getMaSanPham(),gh2);
		assertTrue(GioHangService.tongSoLuongGioHang(arr)==5);
	}

	@Test
	public void testTongGiaTriGioHang() {
		SanPham sp = new SanPham(1,"DM1","abc",10000,5,"abc.jpg","Day la mot san pham tot","cai");
		SanPham sp1 = new SanPham(2,"DM1","abcd",15000,5,"abcd.jpg","Day la mot san pham tot","cai");
		GioHang gh1 = new GioHang(sp,2,5);
		GioHang gh2 = new GioHang(sp1,3,5);
		HashMap<Integer, GioHang> arr = new HashMap<Integer, GioHang>();
		arr.put(sp.getMaSanPham(),gh1);
		arr.put(sp1.getMaSanPham(),gh2);
		assertTrue(GioHangService.tongGiaTriGioHang(arr)==65000);
	}

}
