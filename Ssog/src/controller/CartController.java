package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.CartDao;
import model.MemberDao;
import model.MyinfoDao;
import model.ProductDao;

@Controller
@RequestMapping("/cart")
public class CartController {
	@Autowired
	ProductDao pdao;
	@Autowired
	MemberDao mmdao;
	@Autowired
	MyinfoDao mdao;
	@Autowired
	CartDao cdao;
	
	public Map init(HttpSession session) {
		String id = (String) session.getAttribute("auth");
		Map grade = mdao.usergrade(id);
		Map info = mmdao.id_check_repetition(id);
		Map map = new HashMap<>();
		map.put("id", id);
		map.put("grade", grade);
		map.put("info", info);
		return map;
	}

	@RequestMapping("/form.j")
	public ModelAndView cart(HttpServletRequest resp, HttpSession session) {
		Map init = init(session);
		System.out.println(init.get("grade"));
		ModelAndView mav = new ModelAndView("tw_cart/form");
		mav.addObject("grade", init.get("grade"));
		mav.addObject("memberinfo", init.get("info"));
		Cookie[] cookies = resp.getCookies();
		List<Map> list = new ArrayList<>();
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getValue().startsWith("addcart")) {
					String cookiename = cookies[i].getName();
					String number = cookies[i].getValue().substring(7);
					System.out.println("cookiename : " + cookiename);
					Map map = pdao.cart(cookiename);
					map.put("number", number);
					list.add(map);
					int etc = list.size();
					mav.addObject("list", list);
					mav.addObject("etc", etc);
					System.out.println("list :" + list);
				}
			}
		}
		return mav;
	}

	@RequestMapping("/order.j")
	public ModelAndView order(HttpServletRequest resp, HttpSession session) {
		Map init = init(session);
		Map info = mmdao.id_check_repetition((String) init.get("id"));
		ModelAndView mav = new ModelAndView("tw_cart/order");
		System.out.println("order con :"+ init);
		String address = (String) info.get("ADDRESS");
		String phone = (String) info.get("PHONE");
		String[] spaddress = address.split("!");
		String[] phonenum = phone.split("-");
		mav.addObject("postcode", spaddress[0]);
		mav.addObject("address1", spaddress[1]);
		mav.addObject("address2", spaddress[2]);
		mav.addObject("phone1", phonenum[0]);
		mav.addObject("phone2", phonenum[1]);
		mav.addObject("phone3", phonenum[2]);
		mav.addObject("memberinfo", init.get("info"));
		List<Map> clist = cdao.couponlist((String) init.get("id"));
		Map point = cdao.point((String) init.get("id"));
		mav.addObject("point", point);
		mav.addObject("clist",clist);
		Cookie[] cookies = resp.getCookies();
		List<Map> list = new ArrayList<>();
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				System.out.println("cart : " + cookies[i].getName().indexOf("cart"));
				if (cookies[i].getValue().startsWith("addcart")) {
					int idx = cookies[i].getValue().indexOf("t");
					String cookiename = cookies[i].getName();
					String number = cookies[i].getValue().substring(idx + 1);
					System.out.println("cookiename : " + cookiename);
					Map map = pdao.cart(cookiename);
					list.add(map);
					mav.addObject("list", list);
					mav.addObject("number", number);
					System.out.println("list :" + list);
				}
			}
		}
		return mav;
	}
//	@RequestMapping("/order_rst.j")
//	@ResponseBody
//	public boolean order_rst(@RequestParam Map param) {
//		
//		
//	}
	@RequestMapping("/popup_couponlist.j")
	public ModelAndView popup(HttpSession session,@RequestParam (name="price") String price) {
		ModelAndView mav = new ModelAndView("cart/popup_couponlist");
		Map init = init(session);
		List<Map> list = cdao.couponlist((String) init.get("id"));
		mav.addObject("list",list);
		mav.addObject("price", price);
		
		return mav;
	}
}
