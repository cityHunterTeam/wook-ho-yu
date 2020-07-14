package questionboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import notice.noticeVO;

public class questionDAO {
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
	public List<questionVO> getquestionList(int startRow, int pageSize) {
		List<questionVO> questionlist = new ArrayList<questionVO>();
		try {
			con = getConnection();
			String query ="select * from question order by num desc limit ?,?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				questionVO q = new questionVO();
				q.setId(rs.getString("id"));
				q.setContent(rs.getString("content"));
				q.setDate(rs.getTimestamp("date"));
				q.setImageFile(rs.getString("imageFile"));
				q.setNum(rs.getInt("num"));
				q.setRe_lev(rs.getInt("re_lev"));
				q.setRe_ref(rs.getInt("re_ref"));
				q.setRe_seq(rs.getInt("re_seq"));
				q.setPassword(rs.getString("password"));
				q.setTitle(rs.getString("title"));
				questionlist.add(q);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();
		}
		return questionlist;
	}
	public questionVO getquestion(int num) {
		questionVO qvo = new questionVO();
		try {
			con = getConnection();
			String query = "select * from question where num=? ";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				qvo.setId(rs.getString("id"));
				qvo.setContent(rs.getString("content"));
				qvo.setDate(rs.getTimestamp("date"));
				qvo.setImageFile(rs.getString("imageFile"));
				qvo.setNum(rs.getInt("num"));
				qvo.setRe_lev(rs.getInt("re_lev"));
				qvo.setRe_ref(rs.getInt("re_ref"));
				qvo.setRe_seq(rs.getInt("re_seq"));
				qvo.setPassword(rs.getString("password"));
				qvo.setTitle(rs.getString("title"));
			}
			
		} catch (Exception e) {
			System.out.println("questionVO메서드에서 예외 발생 : " + e);
		}finally {
			freeResource();
		}
		return qvo;
	}
	public void insertquestion(questionVO q) {
		int num = 0;
		try {
			con = getConnection();			
			String query = "insert into question"
					+ "(id,title,imageFile,password,content,re_ref,re_lev,re_seq,date)"
					+ "values(?,?,?,?,?,0,0,0,now())";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, q.getId());
			pstmt.setString(2, q.getTitle());
			pstmt.setString(3, q.getImageFile());
			pstmt.setString(4, q.getPassword());			
			pstmt.setString(5, q.getContent());
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insertquestion메서드 예외발생 : " + e);
		}
	}//insertquestion끝
	public int questionReply(questionVO qvo) {
			int num = 0;			
		 	int re_ref = qvo.getRe_ref(); //원본글 번호
	        int re_lev = qvo.getRe_lev(); // 답변글의 깊이
	        int re_seq = qvo.getRe_seq(); //답변글의 순서	
	        String query = "";
	        String maxnum = "select max(num) from question";
	        
		try {
			con = getConnection();
			pstmt=con.prepareStatement(maxnum);
			rs = pstmt.executeQuery();
			if(rs.next())num = rs.getInt(1)+1;
			else num = 1;
			query  = "update question set re_seq = re_seq+1 where re_ref=? and re_seq>?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, re_ref);
			pstmt.setInt(2, re_seq);
			pstmt.executeUpdate(); 
			query = "insert into question"
					+ "(id,password,title,imageFile,content,re_ref,re_lev,re_seq)"
					+ "values(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, qvo.getId());
			pstmt.setString(2, qvo.getPassword());
			pstmt.setString(3, qvo.getTitle());
			pstmt.setString(4, "");
			pstmt.setString(5, qvo.getContent());
			pstmt.setInt(6, re_ref);
			pstmt.setInt(7, re_lev);
			pstmt.setInt(8, re_seq);						
			pstmt.executeUpdate();
			return num;
		} catch (Exception e) {
			System.out.println("questionReply메서드에서 예외 발생 : " + e);
		}finally {
			freeResource();
		}
		return 0;
	}
	public  int updatequestion(questionVO qvo, int num) {
		int check=0;
		try {
			con = getConnection();
			String qeury = "select passwd from question where num=?";
			pstmt = con.prepareStatement(qeury);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(qvo.getPassword().equals(rs.getString("passwd"))) {
					check = 1;
				qeury = "update question set id=?, title=?, content=? where num=?";
				pstmt = con.prepareStatement(qeury);
				pstmt.setString(1, qvo.getId());
				pstmt.setString(2, qvo.getTitle());
				pstmt.setString(3, qvo.getContent());
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
	public void questionCount(int num) { //조회수
		
		String sql="";

		try {
			con=getConnection();
			sql="update question set count=count+1 where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();
		}
	  }
	public int getquestionCount() {
		int count = 0;
		try {
			con = getConnection();
			String query = "select count(*) from question";
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getquestionCount메서드에서 오류 발생 : " + e);
		} finally {
			freeResource();
		}
		return count;
	}
	public void deletequestion(questionVO qvo) {
		try {
			con = getConnection();
			String query = "select password from question where num=?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, qvo.getNum());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
			  query = "delete from question where num=?";
			  pstmt = con.prepareStatement(query);
			  pstmt.setInt(1, qvo.getNum());
			  pstmt.executeUpdate();
			}
		} catch (Exception e) {
			System.out.println("deletqeustion메서드에서 오류 발생 : " +e);
		}finally {
			freeResource();
		}
	}
}// questionDAO 끝