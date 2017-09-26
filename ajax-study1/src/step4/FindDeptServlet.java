package step4;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MockDAO;

/**
 * Servlet implementation class FindDeptServlet
 */
@WebServlet("/FindDeptServlet")
public class FindDeptServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindDeptServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		String deptNo=request.getParameter("deptNo");
		String deptInfo=MockDAO.getInstance().getDeptInfo(Integer.parseInt(deptNo));
		PrintWriter out=response.getWriter();
		out.println(deptInfo);
		out.close();
	}

}
