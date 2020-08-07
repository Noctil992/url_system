package models.validators;

import javax.persistence.EntityManager;

import utils.DBUtil;

public class UserValidator {
        public static String validate(String login_id, Boolean login_id_check_flag) {
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
