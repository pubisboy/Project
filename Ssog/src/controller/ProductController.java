package controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.tiles.autotag.core.runtime.annotation.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.ProductDao;
import paging.Paging;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	ProductDao pdao;
	
	@Autowired
	Paging pg;
	
	@RequestMapping("/list.j")
	public ModelAndView pro_list(@RequestParam Map param) {
		pg.setDefaultSetting(3, 5);
		String category=(String) param.get("category");
		ModelAndView mav=new ModelAndView("t_base");
		mav.addObject("section","product/list");
		System.out.println("넘어온 파라미터"+param);
		List<Map> list=new ArrayList<>();
		int r=pdao.paging(param);
		int page = Integer.parseInt((String)param.get("page"));
		Map m = pg.calcBetween(page);
		param.put("start", m.get("start"));
		param.put("end", m.get("end"));
		pg.setNumberOfRecords(r);		
		Map mm = pg.calcPaging(page, r);		
		list=pdao.pro_list(param);
		mav.addObject("list", list);
		mav.addObject("paging",mm);
		
		return mav;
	}
}
