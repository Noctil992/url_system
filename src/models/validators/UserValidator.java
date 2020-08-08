package models.validators;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;

import models.User;
import utils.DBUtil;

public class UserValidator {
    public static List<String> validate(User u, Boolean login_id_duplicate_check_flag, Boolean password_check_flag) {
        List<String> errors = new ArrayList<String>();

        String login_id_error = _validateLogin_Id(u.getLogin_Id(), login_id_duplicate_check_flag);
        if(!login_id_error.equals("")) {
            errors.add(login_id_error);
        }

        String name_error = _validateName(u.getName());
        if(!name_error.equals("")) {
            errors.add(name_error);
        }

        String password_error = _validatePassword(u.getPassword(), password_check_flag);
        if(!password_error.equals("")) {
            errors.add(password_error);
        }

        return errors;
    }


        public static String _validateLogin_Id(String login_id, Boolean login_id_check_flag) {
            //必須入力のチェック
            if(login_id == null || login_id.equals("")) {
                return "ログインIDを入力してください";
            }

            //登録済みIDと重複していないかチェック
            if(login_id_check_flag) {
                EntityManager em = DBUtil.createEntityManager();
                long users_count = (long)em.createNamedQuery("checkRegisteredLoginId", Long.class)
                        .setParameter("login_id", login_id)
                        .getSingleResult();
                em.close();

                if(users_count > 0) {
                    return "入力されたIDはすでに使用されています。";
                }

            }
            return "";
        }

        //名前の必須入力チェック
        private static String _validateName(String name) {
            if(name == null || name.equals("")) {
                return "表示名を入力してください";
            }
            return "";
        }

     // パスワードの必須入力チェック
        private static String _validatePassword(String password, Boolean password_check_flag) {
            // パスワードを変更する場合のみ実行
            if(password_check_flag && (password == null || password.equals(""))) {
                return "パスワードを入力してください。";
            }
            return "";
        }

}
