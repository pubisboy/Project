package model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SellerCounselDao {
	@Autowired
	SqlSessionFactory factory;
	
	//========================================================
	//1:1문의
	public boolean counselInsert(Map map){
		SqlSession session = factory.openSession();
		try {
			session.insert("seller.counsel_insert", map);
			session.commit();
			return true;
		} catch(Exception e){
			e.printStackTrace();
			session.rollback();
			return false;
		} finally{
			session.close();
		}
	}
	
	public List<Map<String,Object>> category(){
		SqlSession session = factory.openSession();
		try {
			List<Map<String,Object>> list = session.selectList("seller.counsel_cate");
			session.commit();
			return list;
		} catch(Exception e){
			e.printStackTrace();
			session.rollback();
			return null;
		} finally{
			session.close();
		}
	}
	
	public List<Map<String,Object>> counselList(Map map){
		SqlSession session = factory.openSession();
		try {
			List<Map<String,Object>> list =  session.selectList("seller.counsel_list", map);
			session.commit();
			return list;
		} catch(Exception e){
			e.printStackTrace();
			session.rollback();
			return null;
		} finally{
			session.close();
		}
	}
	
	//글이 총 몇개인지
	public Integer totalList(Map map){
		SqlSession session = factory.openSession();
		try{
			int r = session.selectOne("seller.counsel_total", map);
			return r;
		} catch(Exception e){
			e.printStackTrace();
			session.rollback();
			return 0;
		} finally{
			session.close();
		}
	}
	
	//===============================================================
	//리뷰
	public List<Map<String,Object>> reviewList(Map map){
		SqlSession session = factory.openSession();
		try {
			List<Map<String,Object>> list =  session.selectList("seller.review_list", map);
			session.commit();
			return list;
		} catch(Exception e){
			e.printStackTrace();
			session.rollback();
			return null;
		} finally{
			session.close();
		}
	}
	
	//글이 총 몇개인지
	public Integer reviewTotal(Map map){
		SqlSession session = factory.openSession();
		try{
			int r = session.selectOne("seller.review_total", map);
			return r;
		} catch(Exception e){
			e.printStackTrace();
			session.rollback();
			return 0;
		} finally{
			session.close();
		}
	}
}
