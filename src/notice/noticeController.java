package notice;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/not/*")
public class noticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	noticeDAO dao;
	noticeVO vo;

	public void init(ServletConfig config) throws ServletException {
		dao = new noticeDAO();
		vo = new noticeVO();
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
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw = response.getWriter();
		String action = request.getPathInfo();
		HttpSession session = request.getSession();
		System.out.println("action " + action);
		if (action.equals("/notice.do")) {
			int count = dao.getnoticeCount();
			int pageSize = 10;
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null) {
				pageNum = "1";
			}
			
			SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
			Calendar cal = Calendar.getInstance();
			String today = null;
			today = formatter.format(cal.getTime());
			Timestamp ts = Timestamp.valueOf(today);
			
			
			int currentPage = Integer.parseInt(pageNum);
			int startRow = (currentPage - 1) * pageSize;
			List<noticeVO> articleList = null;

			if (count > 0) {
				articleList = dao.getnoticeList(startRow, pageSize);
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
			request.setAttribute("articleList", articleList);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("pageBlock", pageBlock);
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("ts",ts);
			request.setAttribute("pageNum", pageNum);
			nextPage = "/notice/notice.jsp";

		} else if (action.equals("/write.do")) {
			nextPage = "/notice/noticeWrite.jsp";
			
		} else if (action.equals("/writePro.do")) {
			String id = (String) session.getAttribute("id");
			String title = request.getParameter("title");
			String passwd = request.getParameter("passwd");
			String content = request.getParameter("content");
			noticeVO vo = new noticeVO();
			vo.setId(id);
			System.out.println(id);
			vo.setTitle(title);
			vo.setPasswd(passwd);
			vo.setContent(content);
			vo.setDate(new Timestamp(System.currentTimeMillis()));

			dao.insertnotice(vo);
			nextPage = "/not/notice.do";

		} else if (action.equals("/noticeContent.do")) {
			int num = Integer.parseInt(request.getParameter("num"));

			vo = dao.getnotice(num);
			int readcount = 0;
			dao.noticeCount(num); // 조회수
			request.setAttribute("vo", vo);

			nextPage = "/notice/noticeContent.jsp";

		} else if (action.equals("/noticeUpdate.do")) {
			int num = Integer.parseInt(request.getParameter("num"));

			vo = dao.getnotice(num);

			request.setAttribute("vo", vo);
			request.setAttribute("num", num);
			nextPage = "/notice/noticeUpdate.jsp";

		} else if (action.equals("/noticeUpdatePro.do")) {
			int num = Integer.parseInt(request.getParameter("num"));
			
			   vo.setId(request.getParameter("id"));
			   vo.setTitle(request.getParameter("title"));
			   vo.setPasswd(request.getParameter("passwd"));
			   vo.setContent(request.getParameter("content"));
			 
			 int check =  dao.updatenotice(vo, num);
			 request.setAttribute("num", num);
			 request.setAttribute("vo", vo);
			 if (check == 1) {
				 
				 nextPage = "/notice/updateok.jsp";
				 
			 }else {
			 
				 pw.println("<script>");
					pw.println("alert('비밀번호가 틀렸습니다.');");
					pw.println("history.back();");
					pw.println("</script>");			 
			 }
					 						
		} else if (action.equals("/noticeDelete.do")) {
			int num = Integer.parseInt(request.getParameter("num"));
			vo = dao.getnotice(num);
			String dbpass = vo.getPasswd();
			String passwd = "";

			if (request.getParameter("passwd") != null) {
				passwd = request.getParameter("passwd");
				if (!passwd.equals(dbpass)) {
					pw.println("<script");
					pw.println("alert('비밀번호가 틀립니다.');");
					pw.println("history.back();");
					pw.println("</script>");
				}
			} else {
				dao.deletenotice(vo);
				nextPage = "/not/notice.do";
				
			}	
				
			}else if (action.equals("/faq.do")){
				
				nextPage = "/notice/faq.jsp";
			}	

		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);

	}// doHandle끝
}// noticeController끝
