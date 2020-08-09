package controllers.users;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Url;
import models.User;
import utils.DBUtil;

/**
 * Servlet implementation class UsersMypageServlet
 */
@WebServlet("/users/mypage")
public class UsersMypageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UsersMypageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        EntityManager em = DBUtil.createEntityManager();

        User u = em.find(User.class, Integer.parseInt(request.getParameter("id")));

        User login_user = (User)request.getSession().getAttribute("login_user");

        int page;
        try{
            page = Integer.parseInt(request.getParameter("page"));
        } catch(Exception e) {
            page = 1;
        }

        List<Url> urls = em.createNamedQuery("getMyAllUrls", Url.class)
                .setParameter("user", login_user)
                .setFirstResult(15 * (page - 1))
                .setMaxResults(15)
                .getResultList();

        long urls_count = (long)em.createNamedQuery("getMyUrlsCount", Long.class)
                .setParameter("user", login_user)
                .getSingleResult();

        em.close();

        request.setAttribute("user", u);
        request.setAttribute("urls", urls);
        request.setAttribute("urls_count", urls_count);
        request.setAttribute("page", page);

        if(request.getSession().getAttribute("flush") != null) {
            request.setAttribute("flush", request.getSession().getAttribute("flush"));
            request.getSession().removeAttribute("flush");
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/users/mypage.jsp");
        rd.forward(request, response);
    }

}
