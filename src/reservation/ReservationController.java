package reservation;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import board.BoardDAO;
import board.BoardVO;
import member.MemberDAO;
import member.MemberVO;

@WebServlet("/res/*")
public class ReservationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	BoardDAO dao;
	
	public void init(ServletConfig config) throws ServletException {
		dao = new BoardDAO();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);

	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nextPage = null;
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String action = request.getPathInfo();
		System.out.println("action:" + action);
		if(action.equals("/seat.do")) {
			String traingradename = request.getParameter("traingradename");
			int trainno = Integer.parseInt(request.getParameter("trainno"));
			int adultcharge = Integer.parseInt(request.getParameter("adultcharge"));			
			String depplandtime1 = request.getParameter("depplandtime");
			java.sql.Timestamp depplandtime = java.sql.Timestamp.valueOf(depplandtime1);
			String depplacename = request.getParameter("depplacename");
			String arrplacename = request.getParameter("arrplacename");
			
			//예약좌석 조회)이때 기본키 
			
			
			ReservationVO vo = new ReservationVO(depplacename,arrplacename,traingradename,depplandtime,adultcharge,trainno);
			ReservationDAO dao = new ReservationDAO();
			
			List<ReservationVO> soldList = dao.selectReserv(depplandtime, trainno);
	
			
			request.setAttribute("vo", vo);
			HttpSession session = request.getSession();
			session.setAttribute("vo", vo);
			String id = (String)session.getAttribute("id");
			MemberDAO mdao = new MemberDAO();
			MemberVO mvo = mdao.selectAll(id);
			request.setAttribute("soldList", soldList);
			request.setAttribute("mvo", mvo);
			nextPage = "/reservation/reserStep1.jsp";
			
		}else if(action.equals("/reserv1.do")) {
			String reser_id = request.getParameter("id");
			String reser_email = request.getParameter("email");
			int count = Integer.parseInt(request.getParameter("person"));
			String[] seatlist = request.getParameterValues("seatlist");
			String seat = "";
				for(int i = 0; i<seatlist.length; i++) {
					seat += seatlist[i]+" ";
				}
				HttpSession session = request.getSession();
				ReservationVO vo = (ReservationVO)session.getAttribute("vo");
				vo.setSeat_count(count); vo.setSeat(seat); vo.setReser_id(reser_id);
				vo.setReser_email(reser_email); vo.setAdultcharge(vo.getAdultcharge() * count);
				session.setAttribute("vo", vo);
				request.setAttribute("reser_id", reser_id);
				request.setAttribute("reser_email", reser_email);
				nextPage = "/reservation/reserStep2.jsp";
				
			
		}else if(action.equals("/reserv2.do")) {
			HttpSession session = request.getSession();
			ReservationVO vo = (ReservationVO)session.getAttribute("vo");
			request.setAttribute("vo", vo);
			nextPage = "/reservation/reserStep3.jsp";

		}else if(action.equals("/reserv3.do")) {
		
			HttpSession session = request.getSession();
			ReservationDAO dao = new ReservationDAO();
			ReservationVO vo = (ReservationVO)session.getAttribute("vo");
			dao.addReserv(vo);
			session.removeAttribute("vo");
			//msg 스크립트 변수 
			request.setAttribute("msg","결제가 완료되었습니다.");
			nextPage = "/mem/index.do";
		}

		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
	}

}
