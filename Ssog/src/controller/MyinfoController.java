package controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import model.MemberDao;
import model.MyinfoDao;

@Controller
@RequestMapping("/member")
public class MyinfoController {
	@Autowired
	MemberDao mmdao;
	@Autowired
	MyinfoDao mdao;
	@Autowired
	ServletContext application;
	
	public Map init(HttpSession session){
		String id = (String) session.getAttribute("auth");
		Map grade = mdao.usergrade(id);
		Map info = mmdao.id_check_repetition(id);
		Map map = new HashMap<>();
		map.put("id", id);
		map.put("grade", grade);
		map.put("info", info);
		return map;
	}
	
	
	@RequestMapping("/myinfo/info.j")
	public ModelAndView info(HttpSession session) {
		Map init = init(session);
		List<Map> llist = mdao.orderlist((String)init.get("id"));
		List<Map> qlist = mdao.qanda((String)init.get("id"));
		List<Map> clist = mdao.counsel((String)init.get("id"));
		ModelAndView mav = new ModelAndView("t_el2");
		mav.addObject("section", "member/myinfo/info");
		mav.addObject("grade", init.get("grade"));
		mav.addObject("memberinfo", init.get("info"));
		mav.addObject("llist", llist);
		mav.addObject("qlist", qlist);
		mav.addObject("clist", clist);
		return mav;
	}

	@RequestMapping("/myinfo/popup_grade.j")
	public ModelAndView popup() {
		ModelAndView mav = new ModelAndView("member/myinfo/popup_grade");
		return mav;
	}

	@RequestMapping("/myinfo/couponlist.j")
	public ModelAndView couponlist(HttpSession session) {
		Map init = init(session);
		ModelAndView mav = new ModelAndView("t_el2");
		mav.addObject("section", "member/myinfo/couponlist");
		mav.addObject("grade", init.get("grade"));
		mav.addObject("memberinfo", init.get("info"));
		return mav;
	}

	@RequestMapping("/myinfo/save.j")
	public ModelAndView save(HttpSession session) {
		Map init = init(session);
		Map info = mmdao.id_check_repetition((String)init.get("id"));
		ModelAndView mav = new ModelAndView("t_el2");
		mav.addObject("section", "member/myinfo/save");
		mav.addObject("grade", init.get("grade"));
		mav.addObject("memberinfo", init.get("info"));
		mav.addObject("memberinfo", info);
		return mav;
	}

	@RequestMapping("/myinfo/counsel.j")
	public ModelAndView counsel(HttpSession session) {
		Map init = init(session);
		List<Map> clist = mdao.counselAll((String)init.get("id"));
		ModelAndView mav = new ModelAndView("t_el2");
		mav.addObject("section", "member/myinfo/counsel");
		mav.addObject("grade", init.get("grade"));
		mav.addObject("memberinfo", init.get("info"));
		mav.addObject("clist", clist);
		return mav;
	}

	@RequestMapping("/myinfo/qna.j")
	public ModelAndView qna(HttpSession session) {
		Map init = init(session);
		List<Map> qlist = mdao.qanda((String)init.get("id"));
		ModelAndView mav = new ModelAndView("t_el2");
		mav.addObject("section", "member/myinfo/qna");
		mav.addObject("grade", init.get("grade"));
		mav.addObject("memberinfo", init.get("info"));
		mav.addObject("qlist", qlist);
		return mav;
	}

	@RequestMapping("/myinfo/info_revise.j")
	public ModelAndView inforevise(HttpSession session) {
		Map init = init(session);
		Map info = mmdao.id_check_repetition((String)init.get("id"));
		ModelAndView mav = new ModelAndView("t_el2");
		mav.addObject("section", "member/myinfo/info_revise");
		mav.addObject("grade", init.get("grade"));
		mav.addObject("memberinfo", init.get("info"));
		mav.addObject("memberinfo", info);
		return mav;
	}

	@RequestMapping("/myinfo/leave.j")
	public ModelAndView leave(HttpSession session) {
		Map init = init(session);
		Map info = mmdao.id_check_repetition((String)init.get("id"));
		ModelAndView mav = new ModelAndView("t_el2");
		mav.addObject("section", "member/myinfo/leave");
		mav.addObject("grade", init.get("grade"));
		mav.addObject("memberinfo", init.get("info"));
		mav.addObject("memberinfo", info);
		return mav;
	}

	@RequestMapping("/myinfo/userpass.j")
	public ModelAndView userpass(HttpSession session) {
		Map init = init(session);
		Map info = mmdao.id_check_repetition((String)init.get("id"));
		ModelAndView mav = new ModelAndView("t_el2");
		mav.addObject("section", "member/myinfo/userpass");
		mav.addObject("grade", init.get("grade"));
		mav.addObject("memberinfo", init.get("info"));
		mav.addObject("memberinfo", info);
		return mav;
	}

	@RequestMapping("/myinfo/counsel_detail.j")
	public ModelAndView counseldetail(HttpSession session) {
		String id = (String) session.getAttribute("auth");
		Map info = mmdao.id_check_repetition(id);
		List<Map> cate = mdao.counselcate();
		System.out.println(cate);
		ModelAndView mav = new ModelAndView("t_el3");
		mav.addObject("section", "member/myinfo/counsel_detail");
		mav.addObject("memberinfo", info);
		mav.addObject("cate", cate);
		return mav;
	}

	@RequestMapping("/myinfo/counsel_rst.j")
	public String counsel_rst(@RequestParam Map param, @RequestParam(name = "f") MultipartFile f,
			HttpSession session, Map map) throws IllegalStateException, IOException {
		String fu = UUID.randomUUID().toString();
		System.out.println(param);
		map.put("id", (String) session.getAttribute("auth"));
		map.put("cate", param.get("cate"));
		map.put("title", param.get("title"));
		map.put("content", param.get("content"));
		map.put("fileuuid", fu);
		System.out.println(map);
		mdao.counselup(map);
		String path = application.getRealPath("/resource/img_counsel");
		File dir = new File(path);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		boolean rst = false;
		File dst = new File(dir, fu);
		if (dst.exists())
			dst.delete();
		f.transferTo(dst);
		rst = true;
		return "redirect:/member/myinfo/counsel.j";
	}
}
