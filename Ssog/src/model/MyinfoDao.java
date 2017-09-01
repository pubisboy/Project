package model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyinfoDao{
	@Autowired
	DataSource ds;
	@Autowired
	SqlSessionFactory factory;
	
	public Map usergrade(String id) {
		SqlSession session = factory.openSession();
		HashMap rst = null;
		try {
			 rst = session.selectOne("myinfo.usergrade", id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return rst;
	}
	public List<Map> orderlist(String id){
		List<Map>list = new ArrayList<>();
		SqlSession session = factory.openSession();
		try {
			list = session.selectList("myinfo.orderlist", id);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			session.close();
		}
	}
	public List<Map> qanda(String id){
		System.out.println(id);
		List<Map>list = new ArrayList<>();
		SqlSession session = factory.openSession();
		try {
			list = session.selectList("myinfo.qanda", id);
			System.out.println("dao list : "+list);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			session.close();
		}
	}
}
