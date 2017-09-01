package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String loginExec(HttpSession session, @RequestParam Map<String, Object> params) {
		boolean b = ad.login(params);
		System.out.println("b : "+b);
		if (b) {
			session.setAttribute("admin", (String)params.get("id"));
			System.out.println("session의 admin : "+session.getAttribute("admin"));
			return "redirect:/admin/index.ja";
		} else {
			return "/admin/login/login";
		}
	}

	@RequestMapping({"/","/index.ja"})
	public String main(Map map) {
		// doc = daily order count
		map.put("doc", ad.getCnt("getCnt_dailyOrder"));
		map.put("dpc", ad.getCnt("getCnt_dailyPay"));
		map.put("duc", ad.getCnt("getCnt_dailyUser"));
		map.put("auc", ad.getCnt("getCnt_allUser"));
		map.put("luc", ad.getCnt("getCnt_leaveUser"));
		System.out.println("main 입장");
		return "ad_main";
	}
	
	@RequestMapping("/management.ja")
	public String management(Map map){
		map.put("section", "/section/main");
		return "ad_management";
	}
	
	@RequestMapping("/notice/notice_list.ja")
	public String notice_list(Map map){
		// List<Map> rst = ad.getValues("getValues_All", "notice");
		List<Map> rst = ad.getValues("getList_notice");
		map.put("list", rst);
		map.put("section", "/notice/notice_list");
		return "ad_management";
	}
	
	@RequestMapping("/notice/notice_detail.ja")
	public String notice_detail(@RequestParam(name="num") Integer num, Map map){
		Map rst = ad.getValues("getDetail_notice", num);
		map.put("list", rst);
		map.put("section", "/notice/notice_detail");
		return "ad_management";
	}
	
	@RequestMapping("/notice/notice_write.ja")
	public String notice_write(Map map){
		List<Map> rst = ad.getValues("getValues_All", "target");
		map.put("list", rst);
		map.put("section", "/notice/notice_write");
		return "ad_management";
	}
	
	@RequestMapping("/notice/notice_writeExec.ja")
	@ResponseBody
	public boolean notice_writeExec(@RequestParam Map params){
		boolean b = ad.putValues("put_notice", params);
		return b;
	}
}