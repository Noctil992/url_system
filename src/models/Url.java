package models;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Table(name = "urls")
@NamedQueries({
    @NamedQuery(
            name = "getAllUrls",
            query = "SELECT u FROM Url AS u ORDER BY u.id DESC"
            ),
    @NamedQuery(
            name = "getUrlsCount",
            query = "SELECT COUNT(u) FROM Url AS u"
            ),
    @NamedQuery(
            name = "getMyAllUrls",
            query = "SELECT u FROM Url AS u WHERE u.user = :user ORDER BY u.id DESC"
            ),
    @NamedQuery(
            name = "getMyUrlsCount",
            query = "SELECT COUNT(u) FROM Url AS u WHERE u.user = :user"
            )
})
@Entity
public class Url {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @Lob
    @Column(name = "content", nullable = true)         //コメントのこと
    private String content;

    @Column(name = "create_date", nullable = false)
    private Date create_date;

    @Column(name = "url", nullable = false)
    private String url;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreate_Date() {
        return create_date;
    }

    public void setCreate_Date(Date create_date) {
        this.create_date = create_date;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

}
