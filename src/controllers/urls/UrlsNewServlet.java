package controllers.urls;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Url;
import models.User;

/**
 * Servlet implementation class UrlsNewServlet
 */
@WebServlet("/urls/new")
public class UrlsNewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UrlsNewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        request.setAttribute("_token", request.getSession().getId());

        User login_user = (User)request.getSession().getAttribute("login_user");
        Url u = new Url();

        u.setCreate_date(new Date(System.currentTimeMillis()));
        request.setAttribute("url", u);
        request.setAttribute("login_user", login_user);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/urls/new.jsp");
        rd.forward(request, response);
    }

}
