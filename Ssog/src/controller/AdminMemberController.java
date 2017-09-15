package controller;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import model.AdminMemberDao;
import paging.Paging;

@Controller
@RequestMapping("/admin/member")
public class AdminMemberController {
	
	@Autowired
	AdminMemberDao amd;
	
	@Autowired
	Paging pg;

	@RequestMapping("/member_user/user_list.ja")
	public String user_list(@RequestParam Map params, @RequestParam(name="p", defaultValue="1") Integer p, Map map){
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
		int rows = amd.user_list_count(params);
		pg.setNumberOfRecords(rows);
		Map paging = pg.calcPaging(p, rows);
		// System.out.println("paging : "+paging);
		Map se = pg.calcBetween(p);
		params.put("start", se.get("start"));
		params.put("end", se.get("end"));
		
		List list = amd.user_list(params);
		
		String[] typesEn = "id,name,email,phone".split(",");
		String[] typesKo = "아이디,이름,이메일,연락처".split(",");
		map.put("typesEn", typesEn);
		map.put("typesKo", typesKo);
		
		DecimalFormat df = new DecimalFormat("#,###");
		String total = df.format(rows);
		map.put("total", total);
		map.put("list", list);
		map.put("paging", paging);
		map.put("section", "/member_user/user_list");
		params.put("value", val);
		map.put("params", params);
		
		return "ad_member";
	}
	
	@RequestMapping("/member_user/user_detail.ja")
	public String user_detail(@RequestParam Map params, @RequestParam(name="id") String id, Map map, HttpSession session){
		map.put("params", params);
		List liInfo = amd.user_detail_info(id);
		if(liInfo.size() > 0){
			Map tmp = (Map)liInfo.get(0);
			System.out.println("tml : "+tmp.hashCode());
			System.out.println("(Map)liInfo.get(0) : "+((Map)liInfo.get(0)).hashCode());
			String[] addr = ((String)tmp.get("ADDRESS")).split("!");
			tmp.put("ADDRESS", addr);
			String[] birth = ((String)tmp.get("BIRTH")).split("/");
			tmp.put("BIRTH", birth);
			String gender = (((String)tmp.get("GENDER")).equals("M") ? "남자" : "여자");
			tmp.put("GENDER", gender);
			BigDecimal b = (BigDecimal)(tmp.get("BUY_TOTAL") == null ? BigDecimal.valueOf(0) : tmp.get("BUY_TOTAL"));
			int buy_total = b.intValue();
			tmp.put("BUY_TOTAL", buy_total);
			
			List liGrade = amd.user_detail_grade(buy_total);
			List liOrder9 = amd.user_detail_order_top9(id);
			if(liOrder9.size() > 0){
				tmp = (Map)liOrder9.get(0);
				b = (BigDecimal)(tmp.get("CUPON_TYPE") == null ? BigDecimal.valueOf(0) : tmp.get("CUPON_TYPE"));
				int cupon_rate = b.intValue();
				tmp.put("CUPON_TYPE", cupon_rate);
			}
			System.out.println("liInfo : "+liInfo);
			System.out.println("liGrade : "+liGrade);
			System.out.println("liOrder9 : "+liOrder9);
			int buyc = amd.user_detail_buyCount(id);
			System.out.println("buyc : "+buyc);
			map.put("info", liInfo);
			map.put("grade", liGrade);
			map.put("order9", liOrder9);
			map.put("buyCount", buyc);
			
			List liCounsel9 = amd.user_detail_counsel_top9(id);
			map.put("counsel9", liCounsel9);
			map.put("section", "member_user/user_detail");
		}
		return "ad_member";
	}
	
	@RequestMapping("/member_user/user_detail_memo_update.ja")
	@ResponseBody
	public Map user_detail_memo_update(@RequestParam Map memos){
		Map map = new HashMap<>();
		boolean b = amd.user_detail_memo_update(memos);
		map.put("rst", b);
		return map;
	}
	
	@RequestMapping("/member_seller/seller_list.ja")
	public String seller_list(Map map){
		map.put("section", "/member_seller/seller_list");
		return "ad_member";
	}
	
}
