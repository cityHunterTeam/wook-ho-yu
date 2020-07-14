package Mypage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import board.BoardVO;
import reservation.ReservationVO;

public class MypageDAO {
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
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (con != null) {
				con.close();
			}
		} catch (SQLException e2) {
			e2.printStackTrace();
		}
	}
	
	public List<ReservationVO> getOrderList(int startRow, int pageSize,String id){
		String sql = "";
		List<ReservationVO> list = new ArrayList<ReservationVO>();
		
		try {
			//DB연결 
			
			con = getConnection();
			//SQL문 만들기 
			//정렬 re_ref 내림차순 정렬하여 검색한 후 re_seq 오름차순정렬하여 검색해 오는데 
			//limit 각 페이지마다 맨위에 첫번째로 보여질 시작글 번호, 한 페이지당 보여줄 글개수 
			sql = "select * from reservation where reser_id = ? order by reser_date desc limit ?,?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReservationVO vo = new ReservationVO();
				//rs=> BoardBean에 저장 
				vo.setNum(rs.getInt("num"));
				vo.setDepplacename(rs.getString("depplacename"));
				vo.setArrplacename(rs.getString("arrplacename"));
				vo.setReser_date(rs.getTimestamp("reser_date"));
				vo.setAdultcharge(rs.getInt("adultcharge"));
				vo.setDepplandtime(rs.getTimestamp("depplandtime"));
				vo.setSeat(rs.getString("seat"));
				vo.setReser_email(rs.getString("reser_email"));
				vo.setReser_id(rs.getString("reser_id"));
				vo.setSeat_count(rs.getInt("seat_count"));
				vo.setTraingradename(rs.getString("traingradename"));
				vo.setTrainno(rs.getInt("trainno"));				
				 //BoardBean => ArrayList에 추가 				 
				list.add(vo);
			}//while반복
		}catch (Exception e) {
			System.out.println("getReadBoardList메소드에서 예외발생 : " +e);
			// TODO: handle exception
		}finally {
			freeResource();
		}
		return list; //ArrayList를 notice.jsp로 리턴 
	}//getBoardList메소드 끝 
	
	
	public int getOrderCount() {
		String sql ="";
		int count = 0; //검색한 전체 글수를 저장할 용도
		System.out.println(count);

		try {
			//DB연결 
			con = getConnection();
			sql = "select count(*) from reservation";
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
	
	public ReservationVO getOrder(int num) {
		ReservationVO vo = new ReservationVO();
		String sql = "";
		try {
			//DB연결 
			con = getConnection();
			sql = "select * from reservation where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery(); //select문 실행 
			
			if(rs.next()) {
				vo.setReser_id(rs.getString("reser_id"));
				vo.setReser_email(rs.getString("reser_email"));
				vo.setTraingradename(rs.getString("traingradename"));
				vo.setTrainno(rs.getInt("trainno"));
				vo.setDepplandtime(rs.getTimestamp("depplandtime"));
				vo.setDepplacename(rs.getString("depplacename"));
				vo.setArrplacename(rs.getString("arrplacename"));
				vo.setAdultcharge(rs.getInt("adultcharge"));
				vo.setSeat(rs.getString("seat"));
			}
		}catch(Exception e) {
			System.out.println("getOrder메소드에서 예외발생 : "+e);
		}finally {
			freeResource();
		}
		return vo;
	}
	
	
	
	
}
