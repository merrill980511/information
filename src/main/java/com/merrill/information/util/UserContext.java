package com.merrill.information.util;


import com.merrill.information.dao.entity.User;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpSession;

//封装当前登录用户的上下文信息
public class UserContext {
    private static final String USER_IN_SESSION = "user_in_session";

    //获取HttpSession对象
    public static HttpSession getSession() {
        return ((ServletRequestAttributes) (RequestContextHolder.getRequestAttributes())).getRequest().getSession();
    }

    public static void setCurrentUser(User current) {
        if (current == null) {
            getSession().invalidate();
        } else {
            getSession().setAttribute(USER_IN_SESSION, current);
        }
    }

    public static User getCurrentUser() {
        return (User) getSession().getAttribute(USER_IN_SESSION);
    }
}
