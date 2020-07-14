package tourPackage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

public class tourDAO {
		Connection con;
		PreparedStatement pstmt;
		ResultSet rs;
		
		//커넥션풀(DataSource)을 얻은 후 ConnecionDB접속
			private Connection getConnection() throws Exception{
				Context init = new InitialContext();
				DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/travel");
				//커넥션풀에 존재하는 커넥션 얻기
				Connection con = ds.getConnection();
				//커넥션 반환12
				return con;
			}
			
			private void freeResource() {
				try {
					if(rs != null) {rs.close();}
					if(pstmt != null) {pstmt.close();}
					if(con != null) {con.close();}
				} catch (SQLException e2) {
					e2.printStackTrace();
				}
			}
		
			public int getTourCount() {//전체글개수
				
				String sql="";
				int count=0;
				try {
					con=getConnection();
					sql="select count(*) from tboard";
					pstmt=con.prepareStatement(sql);
					rs=pstmt.executeQuery();
					
					if(rs.next()) {
						count=rs.getInt(1);
					}
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					freeResource();
				}
				return count;
			}
			
			public ArrayList<Map<String, Object>> getTourList(int startRow, int pageSize){
				String sql = "";
				ArrayList<Map<String, Object>> tourList = new ArrayList<Map<String, Object>>();
				
				try {
					//DB연결 
					
					con = getConnection();
					//SQL문 만들기 
					//정렬 re_ref 내림차순 정렬하여 검색한 후 re_seq 오름차순정렬하여 검색해 오는데 
					//limit 각 페이지마다 맨위에 첫번째로 보여질 시작글 번호, 한 페이지당 보여줄 글개수 
					
					sql = "select b.num, b.title, b.id, b.readcount, b.date, b.img1, b.img2, b.img3, b.img4, b.img5, b.tour_num, t.price from tboard b join tour t on b.tour_num = t.tour_num order by num desc limit ?,?";
					
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, startRow);
					pstmt.setInt(2, pageSize);
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						Map<String, Object> map = new HashMap<String, Object>();
						
						map.put("id",rs.getString("b.id"));
						map.put("num",rs.getInt("b.num"));
						map.put("title",rs.getString("b.title"));
						map.put("tour_num",rs.getInt("b.tour_num"));
						map.put("price",rs.getString("t.price"));
						map.put("img1", rs.getString("b.img1"));
						map.put("img2", rs.getString("b.img2"));
						map.put("img3", rs.getString("b.img3"));
						map.put("img4", rs.getString("b.img4"));
						map.put("img5", rs.getString("b.img5"));
						map.put("date",rs.getTimestamp("b.date"));
						map.put("readcount",rs.getInt("b.readcount"));
						 
						tourList.add(map);
					}//while반복
				}catch (Exception e) {
					System.out.println("getTourList메소드에서 예외발생 : " + e);
					// TODO: handle exception
				}finally {
					freeResource();
				}
				return tourList; //ArrayList를 notice.jsp로 리턴 
			}//getBoardList메소드 끝
						
			public int insertTour(tboardVO vo) {
				int num =0;
				try {
					con = getConnection();
					String title = vo.getTitle();
					String id = vo.getId();
					int tour_num = vo.getTour_num();
					String img1 = vo.getImg1();
					String img2 = vo.getImg2();
					String img3 = vo.getImg3();
					String img4 = vo.getImg4();
					String img5 = vo.getImg5();
					
					String query = "INSERT INTO tboard (id,title,date,readcount,tour_num,img1,img2,img3,img4,img5)"
							+ " VALUES (?,?,now(),0,?,?,?,?,?,?)";
					System.out.println(query);
					pstmt = con.prepareStatement(query);
					
					pstmt.setString(1, id);
					pstmt.setString(2, title);
					pstmt.setInt(3, tour_num);
					pstmt.setString(4, img1);
					pstmt.setString(5, img2);
					pstmt.setString(6, img3);
					pstmt.setString(7, img4);
					pstmt.setString(8, img5);
					
					pstmt.executeUpdate();
					
					query = "SELECT  max(num) from tboard ";
					System.out.println(query);
					pstmt = con.prepareStatement(query);
					ResultSet rs = pstmt.executeQuery(query);
					if (rs.next())
						 num = rs.getInt(1);
					pstmt.close();
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				return num;
			}
			
			public void tourReadCount(int num) { //조회수
				
				String sql="";
			
				try {
					con=getConnection();
					sql="update tboard set readcount=readcount+1 where num=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setInt(1, num);
					pstmt.executeUpdate();
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					if(rs!=null)try {rs.close();}catch(SQLException ex) {}
					if(pstmt!=null)try {pstmt.close();}catch(SQLException ex) {}
					if(con!=null)try {con.close();}catch(SQLException ex) {}
				}
				
			}
			
			public ArrayList<Map<String, Object>> getupload(int num){ //글 상세보기
				ArrayList<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
				try {
					
					con = getConnection();
					
					String sql = "select b.num, b.title, b.id, b.readcount, b.date, b.img1, b.img2, b.img3, b.img4, b.img5, b.tour_num, t.price from tboard b join tour t on b.tour_num = t.tour_num where b.num=?";
					
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, num);			
					rs = pstmt.executeQuery();  			
					if(rs.next()) {			
						Map<String, Object> map = new HashMap<String, Object>();
						
						map.put("id",rs.getString("b.id"));
						map.put("num",rs.getInt("b.num"));
						map.put("title",rs.getString("b.title"));
						map.put("tour_num",rs.getInt("b.tour_num"));
						map.put("price",rs.getString("t.price"));
						map.put("img1", rs.getString("b.img1"));
						map.put("img2", rs.getString("b.img2"));
						map.put("img3", rs.getString("b.img3"));
						map.put("img4", rs.getString("b.img4"));
						map.put("img5", rs.getString("b.img5"));
						map.put("date",rs.getTimestamp("b.date"));
						list.add(map);
					}
				} catch (Exception e) {
					System.out.println("getupload 얻기 실패 : "+e);
				} finally {
					freeResource();
				}//finally					
				return list; //getupload 끝
			}
			
			public void updateTour(tboardVO vo,tourVO tvo, int num,int chk) { //글수정
				String sql ="";
				
				try {
						con=getConnection();
		
					if (chk == 1) {
						sql = "update tboard b join tour t on b.tour_num = t.tour_num set b.title=?,t.tour_num=?,t.price=?,b.img1=?,b.img2=?,b.img3=?,b.img4=?,b.img5=? where b.num=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, vo.getTitle());
						pstmt.setInt(2, tvo.getTour_num());
						pstmt.setString(3, tvo.getPrice());
						pstmt.setString(4, vo.getImg1());
						pstmt.setString(5, vo.getImg2());
						pstmt.setString(6, vo.getImg3());
						pstmt.setString(7, vo.getImg4());
						pstmt.setString(8, vo.getImg5());
						pstmt.setInt(9, num);
						pstmt.executeUpdate();
					} else if (chk == 0) {
						sql = "update tboard b join tour t on b.tour_num = t.tour_num set b.title=?,t.tour_num=?,t.price=? where b.num=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, vo.getTitle());
						pstmt.setInt(2, tvo.getTour_num());
						pstmt.setString(3, tvo.getPrice());
						pstmt.setInt(4, num);
						pstmt.executeUpdate();
					}
				}catch(Exception e) {
					e.printStackTrace();
				}finally{
					if(rs!=null)try {rs.close();}catch(SQLException ex) {}
					if(pstmt!=null)try {pstmt.close();}catch(SQLException ex) {}
					if(con!=null)try {con.close();}catch(SQLException ex) {}
				}
			}
			
			public void deleteTour(tboardVO vo,int num) {
				
				String sql = "";
				try {
					con = getConnection();
					
			
					sql = "delete from tboard where num=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, num);
					pstmt.executeUpdate();
						
					
				} catch (Exception e) {
					System.out.println("deleteTour메서드에서 예외발생 : " + e);
				}finally {
					if(rs!=null)try {rs.close();}catch(SQLException ex) {}
					if(pstmt!=null)try {pstmt.close();}catch(SQLException ex) {}
					if(con!=null)try {con.close();}catch(SQLException ex) {}
				}			
			}
			
			
}
