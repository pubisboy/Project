package controller;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.AdminSalesDao;
import paging.Paging;
import paging.Title;

@Controller
@RequestMapping("/admin/sales")
public class AdminSalesController {
	
	@Autowired
	Paging pg;
	
	@Autowired
	Title tt;
	
	@Autowired
	AdminSalesDao asd;

	@RequestMapping("/sales/sales_chart_list.ja")
	public String getSales_list(@RequestParam Map params, @RequestParam(name="p", defaultValue="1") String pp, Map map) throws ParseException{
		int p = 0;
		try{
			p = Integer.parseInt(pp);
		}catch(Exception e){
			System.out.println("변환 불가능");
			p = 1;
		}
		System.out.println("params의 value : "+params.get("value"));
		
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		Calendar c = Calendar.getInstance();
		
		String now = sdf.format(c.getTime());
		Date tmp = sdf.parse(now);
		long t = tmp.getTime() - (1000 * 60 * 60 * 24);
		Date b = new Date(t);
		String begin = sdf.format(b);
		params.put("begin", begin);
		params.put("final", now);
		System.out.println("begin : "+begin + " / now : "+now);
		
		pg.setDefaultSetting(10, 10);
		int rows = asd.getSales_list_count(params);
		pg.setNumberOfRecords(rows);
		Map paging = pg.calcPaging(p, rows);
		// System.out.println("paging : "+paging);
		Map se = pg.calcBetween(p);
		params.put("start", se.get("start"));
		params.put("end", se.get("end"));
		System.out.println("params : "+params);
		List list = asd.getSales_list(params);
		System.out.println("매출액 : "+list);

		DecimalFormat df = new DecimalFormat("#,###");
		String total = df.format(rows);
		map.put("total", total);
		map.put("list", list);
		map.put("paging", paging);
		map.put("params", params);
		map.put("section", "/sales/chart_list");
		return "ad_sales";
	}
	
	@RequestMapping("/sales/sales_chart.ja")
	public String getSales_chart(@RequestParam Map params, @RequestParam(name="p", defaultValue="1") String pp, Map map) throws ParseException{
		int p = 0;
		try{
			p = Integer.parseInt(pp);
		}catch(Exception e){
			System.out.println("변환 불가능");
			p = 1;
		}
		System.out.println("params의 value : "+params.get("value"));
		
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		
		String bTime = null;
		String fTime = null;
		Calendar c = GregorianCalendar.getInstance();
		
		if(params.get("bd") == null && params.get("fd") == null){
			String f = sdf.format(c.getTime());
			c.add(Calendar.DATE, -7);
			String b = sdf.format(c.getTime());
			params.put("begin", b);
			params.put("final", f);
		}else{
			String tmp = String.format("%s/%s/%s", (String)params.get("by"), (String)params.get("bm"), (String)params.get("bd"));
			Date tes = sdf.parse(tmp);
			bTime = sdf.format(tes);
			tmp = String.format("%s/%s/%s", (String)params.get("fy"), (String)params.get("fm"), (String)params.get("fd"));
			tes = sdf.parse(tmp);
			fTime = sdf.format(tes);
			System.out.println("시작 : "+bTime);
			System.out.println("끝 : "+fTime);
			params.put("begin", bTime);
			params.put("final", fTime);
		}
		
		pg.setDefaultSetting(10, 10);
		int rows = asd.getSales_list_count(params);
		pg.setNumberOfRecords(rows);
		Map paging = pg.calcPaging(p, rows);
		// System.out.println("paging : "+paging);
		Map se = pg.calcBetween(p);
		params.put("start", se.get("start"));
		params.put("end", se.get("end"));
		System.out.println("params : "+params);
		List list = asd.getSales_list(params);
		System.out.println("매출액 : "+list);

		Date f = sdf.parse(fTime);
		Date b = sdf.parse(bTime);
		
		c.setTimeInMillis(b.getTime());
		String tmp = bTime;
		
		List days = new ArrayList<>();
		while(list != null){
			Map mtmp = new HashedMap();
			tmp = sdf.format(c.getTime());
			boolean bb = false;
			for(Object o : list){
				Map m = (Map)o;
				String t = (String)m.get("PAY_DATE");
				if(t.equals(tmp)){
					BigDecimal bd = (BigDecimal)m.get("PRICE");
					mtmp.put("day", tmp);
					mtmp.put("price", bd.intValue());
					bb = true;
					break;
				}
			}
			if(!bb){
				mtmp.put("day", tmp);
				mtmp.put("price", 0);
			}
			days.add(mtmp);
			System.out.println("날짜 : "+tmp);
			if(tmp.equals(fTime)){
				break;
			}
			c.add(Calendar.DATE, 1);
		}
		System.out.println("days : "+days);
		DecimalFormat df = new DecimalFormat("#,###");
		String total = df.format(rows);
		map.put("total", total);
		map.put("list", list);
		map.put("paging", paging);
		map.put("params", params);
		map.put("section", "/sales/chart");
		return "ad_sales";
	}
}