package model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CccenterDao {
	@Autowired
	DataSource ds;
	@Autowired
	SqlSessionFactory factory;
	
	public List<Map> faq(){
		List<Map>list = new ArrayList<>();
		SqlSession session = factory.openSession();
		try {
			list = session.selectList("cccenter.faq");
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			session.close();
		}
	}
	public List<Map> notice(){
		List<Map>list = new ArrayList<>();
		SqlSession session = factory.openSession();
		try {
			list = session.selectList("cccenter.notice");
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			session.close();
		}
	}
	public List<Map> noticeAll(){
		List<Map>list = new ArrayList<>();
		SqlSession session = factory.openSession();
		try {
			list = session.selectList("cccenter.notice");
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			session.close();
		}
	}
}
