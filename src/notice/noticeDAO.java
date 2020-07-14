package notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;





public class noticeDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
private Connection getConnection() throws Exception {
	Context init = new InitialContext();
	DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/travel");
	con = ds.getConnection();
	return con;
	}//getConnection 끝
private void freeResource() {
	try {
		if(rs != null) {rs.close();}
		if(pstmt != null) {pstmt.close();}
		if(con != null) {con.close();}
	} catch (Exception e) {
		e.printStackTrace();
	}
 }//freeResource끝
public void insertnotice(noticeVO n) {
	try {
		con = getConnection();
		
		 String query ="insert into notice "
				+ " (id,passwd,title,content,date,count)"
				+ " values(?,?,?,?,now(),0)";
				
		pstmt = con.prepareStatement(query);
		pstmt.setString(1, n.getId());
		pstmt.setString(2, n.getPasswd());
		pstmt.setString(3, n.getTitle());
		pstmt.setString(4, n.getContent());		
		pstmt.executeUpdate();								
	} catch (Exception e) {
		System.out.println("insertnotice메서드에서 오류 발생  :" + e);
	}finally {
		freeResource();	
	}
}//insertnotice끝
public int getnoticeCount() {
	int count = 0;
	try {
		con = getConnection();
		String query = "select count(*) from notice";
		pstmt = con.prepareStatement(query);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			count = rs.getInt(1);
		}
	} catch (Exception e) {
		System.out.println("getnoitceCount메서드에서 오류 발생 : " + e);
	} finally {
		freeResource();
	}
	return count;
}
public List<noticeVO> getnoticeList(int startRow , int pageSize){
	List<noticeVO> noticeList = new ArrayList<noticeVO>();
	try {
		con = getConnection();
		String query = "select * from notice order by num desc limit ?,?";
		pstmt = con.prepareStatement(query);
		pstmt.setInt(1, startRow);
		pstmt.setInt(2, pageSize);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			noticeVO v = new noticeVO();
			v.setId(rs.getString("id"));
			v.setContent(rs.getString("content"));
			v.setCount(rs.getInt("count"));
			v.setDate(rs.getTimestamp("date"));
			v.setNum(rs.getInt("num"));
			v.setPasswd(rs.getString("passwd"));
			v.setTitle(rs.getString("title"));
			noticeList.add(v);
		}
	} catch (Exception e) {
		System.out.println("getnoticeList메서드에서 오류 발생 : " + e);
	}finally {
		freeResource();
	}
	return noticeList;
}//getnoticeList끝
public  int updatenotice(noticeVO vo, int num) {
	int check=0;
	try {
		con = getConnection();
		String qeury = "select passwd from notice where num=?";
		pstmt = con.prepareStatement(qeury);
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			if(vo.getPasswd().equals(rs.getString("passwd"))) {
				check = 1;
			qeury = "update notice set id=?, title=?, content=? where num=?";
			pstmt = con.prepareStatement(qeury);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setInt(4, num);
			pstmt.executeUpdate();
		}else {
				check = 0;
			}
		}
	} catch (Exception e) {
		System.out.println("updatenotice메서드에서 오류 발생:" + e);
	}finally {
		freeResource();
	}
	return check;
}
public void deletenotice(noticeVO vo) {
	try {
		con = getConnection();
		String query = "select passwd from notice where num=?";
		pstmt = con.prepareStatement(query);
		pstmt.setInt(1, vo.getNum());
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
		  query = "delete from notice where num=?";
		  pstmt = con.prepareStatement(query);
		  pstmt.setInt(1, vo.getNum());
		  pstmt.executeUpdate();
		}
	} catch (Exception e) {
		System.out.println("deletenotice메서드에서 오류 발생 : " +e);
	}finally {
		freeResource();
	}
}
public noticeVO getnotice(int num) {
	noticeVO vo = new noticeVO();		
	try {
		con = getConnection();						
		String sql ="select * from notice where num=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			vo.setId(rs.getString("id"));
			vo.setNum(rs.getInt("num"));
			vo.setContent(rs.getString("content"));
			vo.setPasswd(rs.getString("passwd"));
			vo.setTitle(rs.getString("title"));
			vo.setCount(rs.getInt("count"));
			vo.setDate(rs.getTimestamp("date"));
															
		}
		
	} catch (Exception e) {
		System.out.println("getBoard메서드에서 오류 발생 : " +e);
	}finally {
		freeResource();
		
	}
	return vo;
}
public void noticeCount(int num) { //조회수
	
	String sql="";

	try {
		con=getConnection();
		sql="update notice set count=count+1 where num=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, num);
		pstmt.executeUpdate();
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		freeResource();
	}
  }
}//nitceDAO끝
