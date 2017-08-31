package controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.AdminDao;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	AdminDao ad;

	@RequestMapping("/login.ja")
	public String login() {
		return "/admin/login/login";
	}

	@RequestMapping("/loginExec.ja")
	public String loginExec(@RequestParam Map<String, Object> params) {
		boolean b = ad.login(params);
		System.out.println("b : "+b);
		if (b) {
			return "redirect:/admin/index.ja";
		} else {
			return "/admin/login/login";
		}
	}

	@RequestMapping("/index.ja")
	public String main(Map map) {
		
		// doc = daily order count
		map.put("doc", ad.doc());
		map.put("dpc", ad.dpc());
		map.put("duc", ad.duc());
		map.put("auc", ad.auc());
		map.put("luc", ad.luc());
		System.out.println("main 입장");
		return "ad_main";
	}
}