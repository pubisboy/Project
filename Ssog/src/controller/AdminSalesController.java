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
import org.springframework.web.bind.annotation.ResponseBody;

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

	@RequestMapping("/sales/sales_list.ja")
	public String getSales_list(@RequestParam Map params, @RequestParam(name="p", defaultValue="1") String pp, Map map) throws ParseException{
		int p = 0;
		try{
			p = Integer.parseInt(pp);
		}catch(Exception e){
			System.out.println("변환 불가능");
			p = 1;
		}
		params.put("p", p);
		System.out.println("params의 value : "+params.get("value"));
		System.out.println("진입 시의 params : "+params);
		
		String bTime = null;
		String fTime = null;
		
		Calendar c = GregorianCalendar.getInstance();
		
		
		
		String term = (String)params.get("term");
		
		if(params.get("term") == null){
			SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
			String f = sdf.format(c.getTime());
			c.add(Calendar.DATE, -7);
			String b = sdf.format(c.getTime());
			params.put("term", "yy/MM/dd");
			params.put("begin", b);
			params.put("final", f);
		}else{
			System.out.println("term : "+term);
			String by = (String)params.get("by");
			String bm = (String)params.get("bm");
			bm = bm.equals("none") ? "1" :  bm;
			String bd = (String)params.get("bd");
			bd = bd.equals("none") ? "1" :  bd;
			String ey = (String)params.get("ey");
			String em = (String)params.get("em");
			em = em.equals("none") ? "1" :  em;
			String ed = (String)params.get("ed");
			ed = ed.equals("none") ? "1" :  ed;
			
			SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");

			System.out.println(String.format("by : %s / bm : %s / bd : %s / ey : %s / em : %s / ed : %s", by,bm,bd,ey,em,ed));
			String tmp = String.format("%s/%s/%s", by,bm,bd);
			System.out.println("tmp : "+tmp);
			Date tes = sdf.parse(tmp);
			bTime = sdf.format(tes);
			tmp = String.format("%s/%s/%s", ey,em,ed);
			System.out.println("tmp : "+tmp);
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
		Calendar cal = Calendar.getInstance();
		int y = cal.get(Calendar.YEAR);
		int year = y;
		List li = new ArrayList<>();
		for(int i = 0; i < 10; i++){
			li.add(year-i);
		}
		
		map.put("years", li);
		DecimalFormat df = new DecimalFormat("#,###");
		String total = df.format(rows);
		
		map.put("total", total);
		map.put("list", list);
		map.put("paging", paging);
		if(params.get("term") != null){
			map.put("params", params);
		}
		map.put("section", "/sales/sales_list");
		return "ad_sales";
	}
	
	@RequestMapping("/sales/calc_day.ja")
	@ResponseBody
	public String calc_day(@RequestParam Map params){
		Map map = new HashedMap();
		System.out.println("날짜 ajax : "+params);
		Calendar c = Calendar.getInstance();
		String ys = (String)params.get("y");
		String ms = (String)params.get("m");
		String ds = (String)params.get("d");
		int y = c.get(Calendar.YEAR);
		if(!ys.equals("none")){
			y = Integer.parseInt(ys);
		}
		int m = Integer.parseInt((String)params.get("m"));
		int d = Integer.parseInt((String)params.get("d"));
		c.set(y, m-1, d);
		int day = c.getActualMaximum(Calendar.DAY_OF_MONTH);
		String be = (String)params.get("be");
		String target = null;
		if(be.equals("b")){
			target = "bd";
		}else{
			target = "ed";
		}
		
		String rst = "<option value='none'>--</option>";
		for(int i = 1; i <= day; i++){
			rst += String.format("<option value='%d' id='%d%s'>%d</option>", i, i, target, i);
		}
		return rst;
	}
	
	@RequestMapping("/sales/sales_excel.ja")
	public String sales_excel(@RequestParam Map params, Map map) throws ParseException{
		
		String bTime = null;
		String fTime = null;
		
		Calendar c = GregorianCalendar.getInstance();
		
		String term = (String)params.get("term");
		
		if(params.get("by") == "" && params.get("ey") == ""){
			SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
			String f = sdf.format(c.getTime());
			c.add(Calendar.DATE, -7);
			String b = sdf.format(c.getTime());
			params.put("term", "yy/MM/dd");
			bTime = b;
			fTime = f;
			params.put("begin", b);
			params.put("final", f);
		}else{
			System.out.println("term : "+term);
			String by = (String)params.get("by");
			String bm = (String)params.get("bm");
			bm = bm.equals("none") ? "1" :  bm;
			String bd = (String)params.get("bd");
			bd = bd.equals("none") ? "1" :  bd;
			String ey = (String)params.get("ey");
			String em = (String)params.get("em");
			em = em.equals("none") ? "1" :  em;
			String ed = (String)params.get("ed");
			ed = ed.equals("none") ? "1" :  ed;
			
			SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");

			System.out.println(String.format("by : %s / bm : %s / bd : %s / ey : %s / em : %s / ed : %s", by,bm,bd,ey,em,ed));
			String tmp = String.format("%s/%s/%s", by,bm,bd);
			System.out.println("tmp : "+tmp);
			Date tes = sdf.parse(tmp);
			bTime = sdf.format(tes);
			tmp = String.format("%s/%s/%s", ey,em,ed);
			System.out.println("tmp : "+tmp);
			tes = sdf.parse(tmp);
			fTime = sdf.format(tes);
			
			System.out.println("시작 : "+bTime);
			System.out.println("끝 : "+fTime);
			params.put("begin", bTime);
			params.put("final", fTime);
		}
		System.out.println("bTime : "+bTime);
		System.out.println("fTime : "+fTime);
		map.put("begin", bTime);
		map.put("end", fTime);
		List list = asd.getSales_excel(params);
		System.out.println("Excel용 list : "+list);
		map.put("list", list);
		return "salesExcel";
	}
}