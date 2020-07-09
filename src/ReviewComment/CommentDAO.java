package ReviewComment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class CommentDAO {

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
				if(rs == null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
				if(con != null) {con.close();}
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		
		public void insertComment(CommentVO vo) {
			String sql = "";
			int num = 0; //글번호 증가 
			
			try {
				con = getConnection();
				sql = "select max(cnum) from Comment"; //가장 큰 글번호 검색 
				pstmt = con.prepareStatement(sql);
				
				rs = pstmt.executeQuery(); //검색 후 값 얻기 
				
				if(rs.next()) { 
					num = rs.getInt("max(cnum)") + 1;  
				}else {
					num  = 1;  
				}
				
				//insert SQL문만들기 
				sql = "insert into comment(bnum,cnum,c_id,"
						+ "c_content,c_date)"
						+ "values(?,?,?,?,now())";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, vo.getBnum());
				pstmt.setInt(2, num);
				pstmt.setString(3, vo.getC_id());
				pstmt.setString(4, vo.getC_content());
				
				System.out.println(num);
				
				pstmt.executeUpdate();	//insert실행
				
			}catch (Exception e) {
				System.out.println("insertcomment메서드 내부에서 예외발생하였습니다:" +e.getMessage());
			}finally {
				freeResource();
			}
		}
		
		public CommentVO getLastComment() { //댓글의 마지막번호를 가져옴
			String sql = "";
			int num = 0;
			
			try {
				con = getConnection();
				sql = "select max(cnum) from comment";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					num = rs.getInt(1);
				} else {
					num = 1;
				}
				
				sql = "select * from comment where cnum = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);

				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					CommentVO commentVO = new CommentVO();
					
					commentVO.setBnum(rs.getInt("bnum"));
					commentVO.setCnum(rs.getInt("cnum"));
					commentVO.setC_id(rs.getString("c_id"));
					commentVO.setC_content(rs.getString("c_content"));
					commentVO.setC_date(rs.getTimestamp("c_date"));
								
					return commentVO;
				}

			} catch (Exception e) {
				System.out.println("getlastcomment()메소드 내부에서 예외발생 : " + e.toString());
			} finally {
				freeResource();
			}
			
			return null;
		}//ReplyBean
		
		//글 하나의 정보를 검색하여 글정보를 제공해주는 메소드 
				public List<CommentVO> Commentlist(int bnum) {
						

					//매개변수로 전달 받은 글 번호에 해당하는 글을 검색해서 저장할 Boardvo객체 생성
					
					List<CommentVO> commentList = new ArrayList<CommentVO>();
					try {
						//커넥션풀로 커넥션 얻기(DB접속) 
						con = getConnection();
						
						//매개변수로 전달 받은 글번호에 해당 되는 글 하나의 정보를 검색하는 SELECT구문 만들기 
						String sql = "select * from comment where bnum = ? order by cnum asc ";	
						//?기호 해당되는 값을 제외한 나머지 SELECT문장을 저장한? PreparedStatement실행 객체 얻기
						pstmt = con.prepareStatement(sql);
						//?기호에 해당되는 글번호를 설정
						pstmt.setInt(1, bnum);
						//SELECT구문 실행한 후 검색된 글 하나의 정보를 ResultSet에 저장 후 반환 받기
						rs = pstmt.executeQuery();
						
						//ResultSet임시 저장소에 검색한 데이터(글 하나의 정보)가 존재하면?
						while(rs.next()) {
							CommentVO vo = new CommentVO();
							//ResultSet에서 검색한 글의 정보들을 꺼내와서 Boardvo객체의 각 변수에 저장  
							vo.setCnum(rs.getInt("cnum"));
							vo.setC_id(rs.getString("c_id"));
							vo.setC_content(rs.getString("c_content"));
							vo.setC_date(rs.getTimestamp("c_date"));
							vo.setBnum(rs.getInt("bnum"));
							
							commentList.add(vo);
						}
						
					} catch (Exception e) {
						
						System.out.println("getrvboard메소드 내부에서 오류 : " + e.getMessage());
						
					}finally {
						if(rs != null) try{rs.close();}catch(Exception e) {e.printStackTrace();}
						if(pstmt != null) try{pstmt.close();}catch(Exception e) {e.printStackTrace();}
						if(con != null) try{con.close();}catch(Exception e) {e.printStackTrace();}
					}
					
					return commentList;	

				}
				
				public CommentVO getComment(int bnum) {
					
					String sql = "";

					CommentVO vo = new CommentVO();

					try {
						con = getConnection();
						sql = "select * from comment where bnum = ?";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, bnum);
						rs = pstmt.executeQuery();
						while (rs.next()) {
							vo.setBnum(rs.getInt("bnum"));
							vo.setCnum(rs.getInt("cnum"));
							vo.setC_id(rs.getString("c_id"));
							vo.setC_date(rs.getTimestamp("c_date"));
							vo.setC_content(rs.getString("c_content"));
						}
					} catch (Exception e) {
						System.out.println("getBoard()메소드 내부에서 예외발생 : " + e.toString());
					} finally {
						if(rs!=null)try {rs.close();}catch(SQLException ex) {}
						if(pstmt!=null)try {pstmt.close();}catch(SQLException ex) {}
						if(con!=null)try {con.close();}catch(SQLException ex) {}
					}

					return vo;
				}//

				public int deleteComment(CommentVO cvo) {
					String sql = "";
					
					sql = "select c_id from comment where cnum=?";
					
					try {
						con = getConnection();
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, cvo.getCnum());
						rs = pstmt.executeQuery();
						if (rs.next()) {				
								sql = "delete from comment where cnum=?";
								pstmt = con.prepareStatement(sql);
								pstmt.setInt(1, cvo.getCnum());
								System.out.println(pstmt);
								return pstmt.executeUpdate();
								
							}else {
								return -1;
							}
						
					} catch (Exception e) {
						System.out.println("deleteComment()메소드 내부에서 예외발생 : " + e.toString());
					} finally {
						freeResource();
					}
					
					return 0;
				}//deleteReply
				
				
}
