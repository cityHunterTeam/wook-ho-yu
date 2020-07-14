package reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import board.BoardVO;
import member.MemberVO;

public class ReservationDAO {
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
		
		
		public void addReserv(ReservationVO rm) {
			try {
				con = getConnection();
				String query = "INSERT INTO reservation(depplacename,arrplacename,reser_date,adultcharge,depplandtime,seat,reser_email,reser_id,seat_count,traingradename,trainno) VALUES(?,?,now(),?,?,?,?,?,?,?,?)";
				
				System.out.println(query);
				//PreparedStatement객체를 생성하면서 SQL문을 인자로 전달합니다.
				pstmt = con.prepareStatement(query);
				//값 셋팅
				pstmt.setString(1, rm.getDepplacename());
				pstmt.setString(2, rm.getArrplacename());
				pstmt.setInt(3, rm.getAdultcharge());
				pstmt.setTimestamp(4, rm.getDepplandtime());
				pstmt.setString(5, rm.getSeat());
				pstmt.setString(6, rm.getReser_email());
				pstmt.setString(7, rm.getReser_id());
				pstmt.setInt(8, rm.getSeat_count());
				pstmt.setString(9,rm.getTraingradename());
				pstmt.setInt(10,rm.getTrainno());
				//SQL문을 실행합니다.
				pstmt.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				freeResource();
			}
		}
		
		
		public List<ReservationVO> selectReserv(Timestamp depplandtime, int trainno) {
			List<ReservationVO> soldList = new ArrayList<ReservationVO>();
			try {
				con = getConnection();
				String query = "select * from reservation where depplandtime = ? and trainno = ?";
				
				System.out.println(query);
				//PreparedStatement객체를 생성하면서 SQL문을 인자로 전달합니다.
				pstmt = con.prepareStatement(query);
				//값 셋팅
				pstmt.setTimestamp(1, depplandtime);
				pstmt.setInt(2, trainno);
				
				//SQL문을 실행합니다.
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					ReservationVO soldVo = new ReservationVO();
					soldVo.setSeat_count(rs.getInt("seat_count"));
					soldVo.setDepplandtime(rs.getTimestamp("depplandtime"));
					soldVo.setTrainno(rs.getInt("trainno"));
					soldVo.setSeat(rs.getString("seat"));
					
					soldList.add(soldVo);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				freeResource();
			}
			return soldList;
		}
		
		
		public ReservationVO selectContent(int num) {
			ReservationVO vo = new ReservationVO();
			try {
				con = getConnection();
				String query = "select * from reservation where num = ?";
				
				System.out.println(query);
				//PreparedStatement객체를 생성하면서 SQL문을 인자로 전달합니다.
				pstmt = con.prepareStatement(query);
				//값 셋팅
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					vo.setNum(rs.getInt("num"));
					vo.setDepplacename(rs.getString("depplacename"));
					vo.setArrplacename(rs.getString("arrplacename"));
					vo.setReser_date(rs.getTimestamp("reser_date"));
					
				}
				
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				freeResource();
			}
			
			return vo;
		}
		
		
		public List payMemberlist() {
			List payMemberList = new ArrayList();
			try {
				con = getConnection();
				String query = "select * from reservation";
				System.out.println(query);
				pstmt = con.prepareStatement(query);
				ResultSet rs = pstmt.executeQuery();
				
				while (rs.next()) {
					int num = Integer.parseInt(rs.getString("num"));
					String depplacename = rs.getString("depplacename");
					String arrplacename = rs.getString("arrplacename");
					Timestamp reser_date;
					int adultcharge = Integer.parseInt(rs.getString("adultcharge"));
					Timestamp depplandtime;
					String seat = rs.getString("seat");
					String reser_email = rs.getString("reser_email");
					String reser_id = rs.getString("reser_id");
					int seat_count = Integer.parseInt(rs.getString("seat_count"));
					String traingradename = rs.getString("traingradename");
					int trainno = Integer.parseInt(rs.getString("trainno"));

					ReservationVO rVO = new ReservationVO();
					payMemberList.add(rVO);
				}
				freeResource();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return payMemberList;
		}
		
		public List<ReservationVO> getReadpayList(int startRow, int pageSize) {
			String sql = "";
			List<ReservationVO> payList = new ArrayList<ReservationVO>();

			try {
				// DB연결
				con = getConnection();
				// SQL문 만들기
				// 정렬 re_ref 내림차순 정렬하여 검색한 후 re_seq 오름차순정렬하여 검색해 오는데
				// limit 각 페이지마다 맨위에 첫번째로 보여질 시작글 번호, 한 페이지당 보여줄 글개수
				sql = "select * from reservation order by num desc limit ?,?";

				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, pageSize);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					ReservationVO vo = new ReservationVO();
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
					

					payList.add(vo);
				} // while 반복
			} catch (Exception e) {
				System.out.println("getReadpayList메소드에서 예외발생 : " + e);
			} finally {
				freeResource();
			}
			return payList;
		}// getBoardList메소드 끝
		

}
