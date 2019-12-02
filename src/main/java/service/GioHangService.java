package service;

import java.util.HashMap;

import com.ptpmcn.entity.GioHang;
import com.ptpmcn.entity.SanPham;

public class GioHangService {

	public static HashMap<Integer,GioHang> giamGioHang(HashMap<Integer,GioHang> arrGioHang, SanPham sanPham, int id, int sl, int soLuongCon){
		if (arrGioHang == null) {
            arrGioHang = new HashMap<Integer,GioHang>();
        }
		GioHang gioHang = new GioHang();
		if(sanPham != null) {
			if(arrGioHang.containsKey(id)) {
				gioHang = arrGioHang.get(id);
				gioHang.setSanPham(sanPham);
				gioHang.setSoLuong(gioHang.getSoLuong() - sl);
				gioHang.setSoLuongCon(soLuongCon);
				arrGioHang.put(id, gioHang);
			}
		}
		return arrGioHang;
	}
	
	public static HashMap<Integer,GioHang> xoaGioHang(HashMap<Integer,GioHang> arrGioHang, int id){
		if (arrGioHang == null) {
        	arrGioHang = new HashMap<Integer,GioHang>();
        }
        if (arrGioHang.containsKey(id)) {
        	arrGioHang.remove(id);
        }
		return arrGioHang;
	}
	
	public static GioHang getGioHang(HashMap<Integer,GioHang> arrGioHang, int id){
		if (arrGioHang == null) {
            arrGioHang = new HashMap<Integer,GioHang>();
        }
		GioHang gh = new GioHang();
		
		if(arrGioHang.containsKey(id)) {
			gh = arrGioHang.get(id);
		}
		return gh;
	}
	
	public static HashMap<Integer,GioHang> tangGioHang(HashMap<Integer,GioHang> arrGioHang, SanPham sanPham, int id, int sl, int soLuongCon){
		if (arrGioHang == null) {
            arrGioHang = new HashMap<Integer,GioHang>();
        }
		GioHang gioHang = new GioHang();
		if(sanPham != null) {
			if(arrGioHang.containsKey(id)) {
				gioHang = arrGioHang.get(id);
				gioHang.setSanPham(sanPham);
				gioHang.setSoLuong(gioHang.getSoLuong() + sl);
				gioHang.setSoLuongCon(soLuongCon);
				arrGioHang.put(id, gioHang);
			}else {
				gioHang.setSanPham(sanPham);
				gioHang.setSoLuong(sl);
				gioHang.setSoLuongCon(soLuongCon);
				arrGioHang.put(id, gioHang);
			}
		}
		return arrGioHang;
	}
	
	public static int tongSoLuongGioHang(HashMap<Integer,GioHang> arrGioHang) {
		int tongSoLuong = 0;
		for(GioHang gh:arrGioHang.values()) {
			int sl = gh.getSoLuong();
			tongSoLuong = tongSoLuong + sl;
		}
		return tongSoLuong;
	}
	
	public static int tongGiaTriGioHang(HashMap<Integer,GioHang> arrGioHang) {
		int tongGiaTri = 0;
		for(GioHang gh:arrGioHang.values()) {
			int dg = gh.getSanPham().getDonGia();
			int sl = gh.getSoLuong();
			int tt = dg * sl;
			tongGiaTri = tongGiaTri + tt;
		}
		return tongGiaTri;
	}
}
