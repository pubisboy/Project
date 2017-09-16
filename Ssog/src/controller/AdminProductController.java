package controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import model.AdminProductDao;
import paging.Paging;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
@RequestMapping("/admin/sales/product")
public class AdminProductController {

	@Autowired
	AdminProductDao apd;
	
	@Autowired
	Paging pg;
	
	@RequestMapping("/product_list.ja")
	public String product_list(@RequestParam Map params, @RequestParam(name="p", defaultValue="1") Integer p, Map map){
		System.out.println("params : "+params);
		
		String val = null;
		if(params.get("value") != null){
			val = (String)params.get("value");
			if(val.length() > 0){
				String tmp = "%"+val+"%";
				params.put("value", tmp);
			}else{
				params.put("value", "%");
			}
		}
		System.out.println("params의 value : "+params.get("value"));
		pg.setDefaultSetting(10, 5);
		int rows = apd.product_list_count(params);
		pg.setNumberOfRecords(rows);
		Map paging = pg.calcPaging(p, rows);
		// System.out.println("paging : "+paging);
		Map se = pg.calcBetween(p);
		params.put("start", se.get("start"));
		params.put("end", se.get("end"));
		
		List list = apd.product_list(params);
		System.out.println("상품 리스트"+list);
		for(int i = 0; i < list.size(); i++){
			Map m = (Map)list.get(i);
			String s = (String)m.get("PRO_NAME");
			if(s.length() > 10){
				s = s.substring(0, 7);
				StringBuilder sb = new StringBuilder(s);
				sb.append("...");
				s = sb.toString();
				System.out.println("잘린 이름 : "+s);
			}
			((Map)list.get(i)).put("PRO_NAME", s);
		}
		
		
		// 이건 ajax로 data를 보낼 때 사용해야 한다.
		/*List lc = apd.get_catefory_l();
		List sc = apd.get_catefory_s();
		map.put("lc", lc);
		map.put("sc", sc);*/
		
		String[] stateNum = "b_cate,cate".split(",");
		String[] stateKo = "대분류,소분류".split(",");
		map.put("stateNum", stateNum);
		map.put("stateKo", stateKo);
		
		String[] typesEn = "pro_num,pro_name,seller_id".split(",");
		String[] typesKo = "상품 번호,상품 이름,판매자".split(",");
		map.put("typesEn", typesEn);
		map.put("typesKo", typesKo);
		
		DecimalFormat df = new DecimalFormat("#,###");
		String total = df.format(rows);
		map.put("total", total);
		
		map.put("list", list);
		map.put("paging", paging);
		map.put("section", "/product/product_list");
		params.put("value", val);
		map.put("params", params);
		return "ad_sales";
	}
	
	@RequestMapping("/product_second.ja")
	@ResponseBody
	public Map product_second(@RequestParam Map params){
		List list = null;
		String first = (String)params.get("first");
		String name = null;
		String val = "NAME";
		if(first.equalsIgnoreCase("b_cate")){
			list = apd.get_catefory_l();
			name = "B_CATE";
		}else{
			list = apd.get_catefory_s();
			name = "S_CATE";
		}
		System.out.println("넘어오는 값 : "+params);
		System.out.println("list : "+list);
		System.out.println("name : "+name);
		
		String html = "<optgroup label='상세분류'>";
		for(Object o : list){
			Map m = (Map)o;
			BigDecimal tmp = (BigDecimal)m.get(name);
			int cate = tmp.intValue();
			String s = String.format("<option id='%ss' class='s_cate' value='%s'>%s</option>", cate, cate, (String)m.get(val));
			html += s;
		}
		html += "</optgroup>";
		
		Map map = new HashMap<>();
		map.put("html", html);
		return map;
	}
}
