package model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductDao {

	@Autowired
	SqlSessionFactory factory;
	
	public List<Map> pro_list(Map map){
		List<Map> list = new ArrayList<>();
		System.out.println("ㅇㅇㅇㅇㅇ"+map.get("category"));
		SqlSession session=factory.openSession();
		try {
		list=session.selectList("product.pro_list", map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
		session.close();
		}		
		return list;
	}
	
	public int paging(Map map) {
		int n=0;
		SqlSession session=factory.openSession();
		try {
			n=session.selectOne("list_count", map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}		
		return n;
	}
}
