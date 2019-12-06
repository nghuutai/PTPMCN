package com.ptpmcn.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ptpmcn.dao.TaiKhoanDAO;
import com.ptpmcn.entity.TaiKhoan;

@Controller
public class AdminController {
	private HttpSession session = null;
	ApplicationContext context = new ClassPathXmlApplicationContext("IoC.xml");
	TaiKhoanDAO db = (TaiKhoanDAO) context.getBean("dbtaikhoan");
	TaiKhoan tk = new TaiKhoan();
	
	
	@RequestMapping("/admin")
	public String trangLoginAdmin(ModelMap modelMap) {
		modelMap.addAttribute("loginFail", 1); // alert rỗng
		return "LoginAdmin";
	}
	 
	@PostMapping("/admin")
	public void dangNhap(@RequestParam String tenDangNhap, String matKhau,
			HttpServletResponse response, ModelMap modelMap) throws ServletException, IOException {
		
		tk.setTaiKhoan(tenDangNhap);
		tk.setMatKhau(matKhau);
		boolean test = db.kiemtraLogin(tk); // true dang nhap sai
		if(test) {
			modelMap.addAttribute("loginFail", 0);
			response.sendRedirect("admin");
		}
		else {
			session.setAttribute("userLogin", tk.getTaiKhoan());
			response.sendRedirect("qldanhmuc");
		}
	}
}

