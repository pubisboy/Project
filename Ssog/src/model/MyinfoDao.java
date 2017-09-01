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
		List<Map>list = new ArrayList<>();
		SqlSession session = factory.openSession();
		try {
			list = session.selectList("myinfo.qanda", id);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			session.close();
		}
	}
	public List<Map> counsel(String id){
		List<Map>list = new ArrayList<>();
		SqlSession session = factory.openSession();
		try {
			list = session.selectList("myinfo.counsel", id);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			session.close();
		}
	}
	public List<Map> counselAll(String id){
		List<Map>list = new ArrayList<>();
		SqlSession session = factory.openSession();
		try {
			list = session.selectList("myinfo.counselAll", id);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			session.close();
		}
	}
	public List<Map> counselcate(){
		List<Map>list = new ArrayList<>();
		SqlSession session = factory.openSession();
		try {
			list = session.selectList("myinfo.counselcate");
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			session.close();
		}
	}
	public int counselup(Map map) {
		SqlSession session = factory.openSession();
		try {
			return session.insert("myinfo.counselup",map);
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
			return -1;
		}finally {
			session.close();
		}
	}
//	public int userpass(String pass) {
//		SqlSession session = factory.openSession();
//			try {
//				session.selectOne("myinfo.pass_confirm", pass);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}finally {
//				
//			}
//	}
}
