package controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@RequestMapping("/myinfo/info.j")
	public ModelAndView info(HttpSession session) {
		String id = (String)session.getAttribute("auth");
		Map grade = mdao.usergrade(id);
		Map info = mmdao.id_check_repetition(id);
		List<Map> llist = mdao.orderlist(id);
		List<Map> qlist = mdao.qanda(id);
		System.out.println("qlist : "+qlist);
		ModelAndView mav = new ModelAndView("t_el2");
		mav.addObject("section", "member/myinfo/info");
		mav.addObject("grade", grade);
		mav.addObject("memberinfo",info);
		mav.addObject("llist",llist);
		mav.addObject("qlist", qlist);
		return mav;
	}
}
