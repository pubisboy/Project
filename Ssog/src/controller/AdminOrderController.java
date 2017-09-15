package controller;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.AdminOrderDao;
import paging.Paging;

@Controller
@RequestMapping("/admin/order")
public class AdminOrderController {

	@Autowired
	AdminOrderDao aod;
	
	@Autowired
	Paging pg;
	
	@RequestMapping("/order_list.ja")
	public String order_list(@RequestParam Map params, @RequestParam(name="p", defaultValue="1") Integer p, Map map){
		System.out.println("params : "+params);
		System.out.println("state : "+params.get("state"));
		/*if(params.get("state") != null){
			String s = (String)params.get("state");
			if(s.equals("")){
				params.remove("type");
				params.remove("value");
			}
		}*/
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
		pg.setDefaultSetting(10, 10);
		int rows = aod.order_list_count(params);
		pg.setNumberOfRecords(rows);
		Map paging = pg.calcPaging(p, rows);
		// System.out.println("paging : "+paging);
		Map se = pg.calcBetween(p);
		params.put("start", se.get("start"));
		params.put("end", se.get("end"));
		
		List list = aod.order_list(params);
		
		String[] typesEn = "order_num,pro_num,pro_name,user_id,seller_id".split(",");
		String[] typesKo = "주문번호,상품번호,상품이름,구매자,판매자".split(",");
		map.put("typesEn", typesEn);
		map.put("typesKo", typesKo);
		
		String[] stateNum = "1,2,3,4,5,6,7".split(",");
		String[] stateKo = "주문,결제완료,배송중,배송완료,구매확정,교환중,반품중".split(",");
		map.put("stateNum", stateNum);
		map.put("stateKo", stateKo);
		
		DecimalFormat df = new DecimalFormat("#,###");
		String total = df.format(rows);
		map.put("total", total);
		
		map.put("list", list);
		map.put("paging", paging);
		map.put("section", "/order/order_list");
		params.put("value", val);
		map.put("params", params);
		return "ad_order";
	}
	
	@RequestMapping("/order_detail.ja")
	public String order_detail(@RequestParam(name="order_num") Integer num, Map map){
		System.out.println("num : "+num);
		List liInfo = aod.order_detail(num);
		if(liInfo.size() > 0){
			System.out.println("liInfo : "+liInfo);
		}
		map.put("list", liInfo);
		map.put("section", "/order/order_detail");
		return "ad_order";
	}
}
