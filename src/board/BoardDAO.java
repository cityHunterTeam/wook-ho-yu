package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	//커넥션풀(DataSource)을 얻은 후 ConnecionDB접속
		private Connection getConnection() throws Exception{
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/travel");
			//커넥션풀에 존재하는 커넥션 얻기
			Connection con = ds.getConnection();
			//커넥션 반환
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
		
		
		
		//게시판 board테이블에 새글정보를 추가 시키는 메소드
				public void insertBoard(BoardVO vo) {
					String sql="";
					int num = 0; //새글 추가 시 글번호를 만들어서 저장할 변
					
					try {
						con = getConnection(); //DB연결			
						//insert SQL문만들기 
						
						sql = "select max(num) from board"; //가장 큰 글번호 검색 
						pstmt = con.prepareStatement(sql);
						rs = pstmt.executeQuery(); //검색 후 값 얻기 
						
						if(rs.next()) {//가장 큰 글번호가 검색되면 
							//가장 큰 글번호에 + 1한 글번호를 ? 새글의 글번호로 사용하기 위해 저장 
							num = rs.getInt("max(num)") + 1; //가장 최신 번호 검색하기 위해 
							//column 이름이 바뀜 1로 적어도 됨 
						}else {
							num  = 1; //board테이블에 글이 저장되어 있지 않다면 새 글 추가시 1을 사용하기 위함 
						}
						
						sql = "insert into board(id,title,"
								+ " content,re_ref,"
								+ " re_lev,re_seq,date)"
								+ "values(?,?,?,?,?,?,now())";
						
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, vo.getId());
						pstmt.setString(2, vo.getTitle());
						pstmt.setString(3, vo.getContent());
						pstmt.setInt(4, num);
						pstmt.setInt(5, vo.getRe_lev());
						pstmt.setInt(6, vo.getRe_seq());		//주글(새글)의 글번호를 그룹번호로 지정 
						
						pstmt.executeUpdate();	//insert실행
						
					}catch (Exception e) {
						System.out.println("insertBoard메서드 내부에서 예외발생하였습니다:" +e.getMessage());
					}finally {
						freeResource();
					}
				}//insertBoard
				

				public int getBoardCount() {
					String sql ="";
					int count = 0; //검색한 전체 글수를 저장할 용도
					System.out.println(count);

					try {
						//DB연결 
						con = getConnection();
						sql = "select count(*) from board";
						pstmt = con.prepareStatement(sql);
						rs = pstmt.executeQuery(); //select문 실행 
						
						if(rs.next()) {
							count = rs.getInt("count(*)"); //검색한 전체 글 개수 얻기 
							System.out.println(count);
						}
					}catch(Exception e) {
						System.out.println("getBoardCount메소드에서 예외발생 : "+e);
					}finally {
						freeResource();
					}
					return count;	//검색한 전체 글 수 notice.jsp로 반환   
				}
				
				
				//글목록 검색 메소드
				//notice.jsp에서 호출하는 메소드로
				//getBoardList(각페이지마다 맨위에 첫번쨰로 보여질 시작글번호, 한 페이지당 보여지는 글개수)를 전달받아...
				//검색한 글정보(BoardBean)하나하나를 ArrayList에 담아.. 반환함.
				
				
				public List<BoardVO> getReadBoardList(int startRow, int pageSize){
					String sql = "";
					List<BoardVO> boardList = new ArrayList<BoardVO>();
					
					try {
						//DB연결 
						
						con = getConnection();
						//SQL문 만들기 
						//정렬 re_ref 내림차순 정렬하여 검색한 후 re_seq 오름차순정렬하여 검색해 오는데 
						//limit 각 페이지마다 맨위에 첫번째로 보여질 시작글 번호, 한 페이지당 보여줄 글개수 
						sql = "select * from board order by re_ref desc, re_seq asc limit ?,?";
						
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, startRow);
						pstmt.setInt(2, pageSize);
						rs = pstmt.executeQuery();
						
						while(rs.next()) {
							BoardVO vo = new BoardVO();
							//rs=> BoardBean에 저장 
							vo.setId(rs.getString("id"));
							vo.setNum(rs.getInt("num"));
							vo.setTitle(rs.getString("title"));
							vo.setContent(rs.getString("content"));
							vo.setRe_ref(rs.getInt("re_ref"));
							vo.setRe_lev(rs.getInt("re_lev"));
							vo.setRe_seq(rs.getInt("re_seq"));
							vo.setDate(rs.getTimestamp("date"));
							 //BoardBean => ArrayList에 추가 
							 
							boardList.add(vo);
						}//while반복
					}catch (Exception e) {
						System.out.println("getReadBoardList메소드에서 예외발생 : " +e);
						// TODO: handle exception
					}finally {
						freeResource();
					}
					return boardList; //ArrayList를 notice.jsp로 리턴 
				}//getBoardList메소드 끝 
				

}
