package com.ptpmcn.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GioHangController {
	
	@RequestMapping("/giohang")
	public String Index() {
		return "GioHang";
	}

}
