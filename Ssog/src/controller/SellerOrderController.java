package controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.SellerOrderDao;
import paging.Paging;

@Controller
@RequestMapping("/seller/order")
public class SellerOrderController {
	@Autowired
	SellerOrderDao sdao;
	
	@Autowired
	Paging page;
	
	@RequestMapping("/list.j")
	public ModelAndView orderlList(@RequestParam Map map, HttpSession session, 
			@RequestParam(name="p", defaultValue="1") int p) {
		ModelAndView mav = new ModelAndView("t_el_seller");
		String id = (String)session.getAttribute("seller_id");
		map.put("id", id);
		
		int total = sdao.orderTotal(map);
		page.setDefaultSetting(10, 4); //줄 개수, 페이지 개수
		page.setNumberOfRecords(total);
		Map op = page.calcBetween(p);
		Map rst = page.calcPaging(p, total); //현재페이지, 총개수
			map.put("start", op.get("start"));
			map.put("end", op.get("end"));
//		System.out.println("op:" + op);
//		System.out.println("rst:" + rst);
//		System.out.println("map:" + map);
		
		List list = sdao.orderList(map);
		System.out.println(map);
		mav.addObject("section", "seller/order/list");
		mav.addObject("list", list);
		mav.addObject("p", p);
		mav.addObject("page", rst);
		mav.addObject("total", total);
		return mav;
	}
}
