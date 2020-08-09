package models.validators;

import java.util.ArrayList;
import java.util.List;

import models.Url;

public class UrlValidator {
    public static List<String> validate(Url u) {
        List <String> errors = new ArrayList<String>();

        String url_error = _validateUrl(u.getUrl());
        if(!url_error.equals("")) {
            errors.add(url_error);
        }

        return errors;
    }

    private static String _validateUrl(String url) {
        if(url == null || url.equals("")) {
            return "URLを入力してください";
        }
        return "";
    }
}
