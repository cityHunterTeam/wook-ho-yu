package admin;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import admin.adminDAO;
import admin.adminVO;
import member.MemberVO;
import notice.noticeDAO;
import notice.noticeVO;
import reservation.ReservationDAO;
import reservation.ReservationVO;

@WebServlet("/adm/*")
public class adminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	adminDAO dao;

	public void init(ServletConfig config) throws ServletException {
		dao = new adminDAO();
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

		
		if (action.equals("/adminIndex.do")) { //관리자페이지 홈

			nextPage = "/admin/adminIndex.jsp";

		} else if(action.equals("/admin.do")) { //홈페이지 홈
			
			nextPage = "/mem/index.jsp";
			
		} else if (action.equals("/write.do")) { // 글쓰기?(이전해야함)
			
			nextPage = "/admin/adminWrite.jsp";
			
		} else if (action.equals("/adminWritePro.do")) {
			String id = request.getParameter("id");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			adminVO vo = new adminVO(id, title, content);
			dao.insertAdmin(vo);// insert명령!

			nextPage = "/adm/adminlist.do";
		} else if (action.equals("/memberView.do")) {
			String id = request.getParameter("id");
			adminVO adminInfo = dao.findAdminMember(id);
			request.setAttribute("vo", adminInfo);
			nextPage = "/admin/memberView.jsp";

		} else if (action.equals("/memberViewPro.do")) {

			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			String name = request.getParameter("name");
			String birth = request.getParameter("birth");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");
			adminVO vo = new adminVO(id, passwd, name, birth, email, phone, address);
			dao.updateAdminMember(vo);

			nextPage = "/admin/memberViewPro.jsp";

		} else if (action.equals("/delMembers.do")) { //회원 삭제
			
			String id = request.getParameter("id");
			dao.delAdminMember(id);
			request.setAttribute("msg", "deleted");
			nextPage = "/adm/adminMember.do";
		
		}  else if (action.equals("/delpay.do")) { //결제 정보 삭제
			
			int num = Integer.parseInt(request.getParameter("num"));
			dao.Admindelpay(num);
			request.setAttribute("msg", "deleted");
			nextPage = "/adm/payMember.do";
			
		}  else if (action.equals("/adminMember.do")) { //회원정보 목록
			List membersList = dao.listAdminMembers();
			request.setAttribute("membersList", membersList);

			int count = dao.getAdminCount();

			System.out.println(count);
			int pageSize = 15;

			String pageNum = request.getParameter("pageNum");

			if (pageNum == null) {
				pageNum = "1";
			}

			int currentPage = Integer.parseInt(pageNum);

			int startRow = (currentPage - 1) * pageSize;

			List<adminVO> articleList = null;

			if (count > 0) {
				articleList = dao.getReadAdminList(startRow, pageSize);
			}
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			int pageBlock = 3;

			int startPage = ((currentPage / pageBlock) - (currentPage % pageBlock == 0 ? 1 : 0)) * pageBlock + 1;

			int endPage = startPage + pageBlock - 1; // 시작페이지번호 + 현재블럭에 보여줄 페이지수 -1

			if (endPage > pageCount) {
				endPage = pageCount;
			}
			request.setAttribute("count", count);
			request.setAttribute("articleList", articleList);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("pageBlock", pageBlock);
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("pageNum", pageNum);

			nextPage = "/admin/adminMember.jsp";
			
		} else if (action.equals("/payMember.do")) { //결제목록
			ReservationDAO rdao = new ReservationDAO();
			List payMemberList = rdao.payMemberlist();
			request.setAttribute("payMemberList", payMemberList);
	
			int count = dao.getpayCount();

			// 하나의 화면마다 보여줄 글 개수 15
			int pageSize = 15;

			// 현재 보여질(선택한)페이지 번호 가져오기
			String pageNum = request.getParameter("pageNum");

			// 현재 보여질(선택한) 페이지번호가 없으면 1페이지 처리
			if (pageNum == null) {
				pageNum = "1";
			}

			// 현재 보여질(선택한)페이지 번호"1"을 -> 기본정수 1로 변경
			int currentPage = Integer.parseInt(pageNum);

			// (현재 보여질 페이지번호 -1) * 한페이지당 보여줄 글개수 15
			int startRow = (currentPage - 1) * pageSize;

			// 게시판 글객체(BoardBean)를 저장하기 위한 용도
			List<ReservationVO> payList = null;

			// 만약 게시판 글에 글이 있다면 ...
			if (count > 0) {
				// 글목록 가져오기
				// getAdminList(각 페이지마다 맨 위에 첫번째로 보여질 시작 글번호,한페이지당 보여줄 글개수)
				payList = rdao.getReadpayList(startRow, pageSize);
			}
			// 전체 페이지수 구하기 글 20개 한 페이지 보여줄 글수 10개 => 2페이지
			// 글 25개 한페이지 보여줄 글 수 10개 => 3페이지
			// 조건 (삼항)연산자 조건? 참 : 거짓
			// 전체 페이지수 = 전체글/ 한페이지에 보여줄 글 수 + (전체글수를 한페이지에 보여줄 글수로 나눈 나머지값)
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			int pageBlock = 3;

			/* 시작페이지 번호 구하기 */
			// 1 ~ 10 => 1 11~ 20 => 11 21~30 => 21
			// 현재 보여질 (선택한) 페이지 번호/ 한화면(한블럭)에 보여줄 페이지수)-
			// (현재 보여질(선택한) 페이지 번호를 한화면에 보여줄 페이지수로 나눈 나머지값)) *
			// 한화면(한블럭)에 보여줄 페이지수 + 1
			int startPage = ((currentPage / pageBlock) - (currentPage % pageBlock == 0 ? 1 : 0)) * pageBlock + 1;

			// 끝페이지 번호 구하기 1~ 10 => 10 11~ 20 => 20 21~30 => 30
			int endPage = startPage + pageBlock - 1; // 시작페이지번호 + 현재블럭에 보여줄 페이지수 -1

			// 끝페이지번호가 전체페이지수보다 클때...
			if (endPage > pageCount) {
				// 끝페이지번호를 전체페이지수로 저장
				endPage = pageCount;
			}
			request.setAttribute("count", count);
			request.setAttribute("payList", payList);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("pageBlock", pageBlock);
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("pageNum", pageNum);
			
			nextPage = "/admin/payMember.jsp";
			
		} else if (action.equals("/adminNotice.do")) { //관리자페이지 공지사항
			noticeDAO ndao = new noticeDAO();
			int count = ndao.getnoticeCount();
			int pageSize = 10;
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null) {
				pageNum = "1";
			}
			
			int currentPage = Integer.parseInt(pageNum);
			int startRow = (currentPage - 1) * pageSize;
			List<noticeVO> noticeList = null;

			if (count > 0) {
				noticeList = ndao.getnoticeList(startRow, pageSize);
			}
			int num = 0;
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			int pageBlock = 3;
			int startPage = ((currentPage / pageBlock) - (currentPage % pageBlock == 0 ? 1 : 0)) * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;
			if (endPage > pageCount) {
				endPage = pageCount;
			}
			request.setAttribute("count", count);
			request.setAttribute("noticeList", noticeList);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("pageBlock", pageBlock);
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("pageNum", pageNum);
			
			nextPage = "/admin/adminNotice.jsp";

		}  else if (action.equals("/noticeAdmindel.do")) { //관리자페이지에서 공지사항 지우기
			
			int num = Integer.parseInt(request.getParameter("num"));
			dao.Admindelnotice(num);
			request.setAttribute("msg", "deleted");
			nextPage = "/adm/adminNotice.do";
			

			
		} else if (action.equals("/payInfo.do")) { //결제목록중 하나를 누를때 상세보기
			int num = Integer.parseInt(request.getParameter("num"));
			System.out.println(num);
			ReservationVO vo = new ReservationVO();
			vo = dao.payInfolist(num);
			System.out.println(vo.getAdultcharge());
			System.out.println(vo.getArrplacename());
			request.setAttribute("vo", vo);
			nextPage = "/admin/payInfo.jsp";
		}
				
		
		

		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
	}
}
