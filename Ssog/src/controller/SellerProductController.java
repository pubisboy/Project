package controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.SellerProductDao;

@Controller
@RequestMapping("/seller/product")
public class SellerProductController {
	@Autowired
	SellerProductDao sdao;
	
	@RequestMapping("/list.j")
	public ModelAndView productList(@RequestParam Map map, HttpSession session, 
			@RequestParam(name="p", defaultValue="1") int p) {
		ModelAndView mav = new ModelAndView("t_el_seller");
		String id = (String)session.getAttribute("seller_id");
		
		int size = 10; //줄 단위
		int start = (p-1)*size+1; //시작하는 숫자
		int end = p * size;
			map.put("start", start);
			map.put("end", end);
			map.put("id", id);
		List list = sdao.productList(map);
		mav.addObject("section", "seller/product/list");
		mav.addObject("list", list);
		
		//int total = (sdao.totalList(map)%size==0)? ddao.totalList(map)/size : sdao.totalList(map)/size+1; //페이지 개수
		//System.out.println("total : " + total);
		//mav.addObject("total", total);
		mav.addObject("p", p);
		return mav;
	}
	
	//상품 목록에서 검색
	@RequestMapping("/search.j")
	public ModelAndView search(@RequestParam Map map){
		ModelAndView mav = new ModelAndView("t_el_seller");
			mav.addObject("search_type", map.get("search_type"));
			mav.addObject("search_word", map.get("search_word"));
			mav.addObject("section", "seller/product/list"); 
		return mav;
	}
}
