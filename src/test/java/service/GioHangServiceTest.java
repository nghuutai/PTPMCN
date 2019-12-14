package service;

import static org.junit.Assert.*;

import java.util.HashMap;

import org.junit.Before;
import org.junit.Test;

import com.ptpmcn.entity.GioHang;
import com.ptpmcn.entity.SanPham;

public class GioHangServiceTest {
	
	SanPham sp,sp1;
	GioHang gh,gh1;
	HashMap<Integer, GioHang> arr;
	
	@Before
	public void setUp() throws Exception {
		sp = new SanPham(1,"DM1","tui vai",100000,5,"tuivai.jpg","Day la mot san pham tot","cai");
		sp1 = new SanPham(2,"DM2","ong hut",30000,5,"onghut.jpg","Day la mot san pham tot","hop");
		gh = new GioHang(sp,2,5);
		gh1 = new GioHang(sp1,3,5);
		arr = new HashMap<Integer, GioHang>();
		arr.put(sp.getMaSanPham(),gh);
		arr.put(sp1.getMaSanPham(),gh1);
	}
	@Test
	public void testGiamGioHang() {
		arr = GioHangService.giamGioHang(arr, sp, sp.getMaSanPham(), 1, 5);
		assertTrue((arr.get(1)).getSoLuong()==1);
		assertTrue((arr.get(2)).getSoLuong()==3);
	}

	@Test
	public void testXoaGioHang() {
		arr = GioHangService.xoaGioHang(arr, sp.getMaSanPham());	
		assertTrue(GioHangService.tongSoLuongGioHang(arr)==3);
	}


	@Test
	public void testTangGioHang() {
		arr = GioHangService.tangGioHang(arr, sp, sp.getMaSanPham(), 1, 5);
		assertTrue((arr.get(1)).getSoLuong()==3);
		assertTrue((arr.get(2)).getSoLuong()==3);
	}

	@Test
	public void testTongSoLuongGioHang() {
		assertTrue(GioHangService.tongSoLuongGioHang(arr)==5);
	}

	@Test
	public void testTongGiaTriGioHang() {
		assertTrue(GioHangService.tongGiaTriGioHang(arr)==290000);
	}

}
