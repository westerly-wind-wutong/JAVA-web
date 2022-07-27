package com.pch.common;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.regex.Pattern;

/**
 * 基类
 */
public class Utility {
    /**
     * 截取字符串
     *
     * @param input
     * @param len
     * @return
     */
    public static String Substring(String input, int len) {
        if (DataValidator.isNullOrEmpty(input))
            return "";
        if (len >= input.length())
            return input;
        return input.substring(0, len);
    }

    public static String getRandomString() {
        //格式化
        Date date = new Date();                               //原时间
        String format = "yyyyMMddHHmmssSSS";              //定义一个格式
        SimpleDateFormat sdf = new SimpleDateFormat(format);  //实例化SimpleDateFormat

        String dateStr = sdf.format(date);
        return dateStr;
    }

    /**
     * 获取当前时间
     *
     * @return
     */
    public static Date getNowDateTime() {
        Calendar cal = Calendar.getInstance();
        String now = cal.get(Calendar.YEAR) + "-"
                + (cal.get(Calendar.MONTH) + 1) + "-" + cal.get(Calendar.DATE)
                + " " + cal.get(Calendar.HOUR) + ":" + cal.get(Calendar.MINUTE)
                + ":" + cal.get(Calendar.SECOND);
        return DataConverter.toDate(now, "yyyy-MM-dd HH:mm:ss");
    }

    /**
     * 获得当前日期
     *
     * @return
     */
    public static Date getNowDate() {
        Calendar cal = Calendar.getInstance();
        String now = cal.get(Calendar.YEAR) + "-"
                + (cal.get(Calendar.MONTH) + 1) + "-" + cal.get(Calendar.DATE);
        return DataConverter.toDate(now, "yyyy-MM-dd");
    }

    /**
     * 写入cookie
     *
     * @param response
     * @param key
     * @param value
     */
    public static void writeCookie(HttpServletResponse response, String key,
                                   String value) {
        writeCookie(response, key, value, -1);
    }

    /**
     * 写入cookie
     *
     * @param response
     * @param key
     * @param value
     * @param expirse
     */
    public static void writeCookie(HttpServletResponse response, String key,
                                   String value, int expirse) {
        Cookie newCookie = new Cookie(key, value);
        if (expirse > 0)
            expirse = expirse * 60;
        newCookie.setPath("/");
        newCookie.setMaxAge(expirse);
        response.addCookie(newCookie);
    }

    /**
     * 读取cookie值
     *
     * @param request
     * @param key
     * @return
     */
    public static String readCookie(HttpServletRequest request, String key) {
        String value = "";
        Cookie[] ck = request.getCookies();
        if (ck == null)
            return "";
        for (Cookie c : ck) {
            if (c.getName().equals(key)) {
                value = c.getValue();
                break;
            }
        }
        return value;
    }

    /**
     * 去除HTML字串中的控制字符及不可视字符
     *
     * @param str HTML字串
     * @return 返回的字串
     */
    public static String escapeHTML(String str) {
        int length = str.length();
        int newLength = length;
        boolean someCharacterEscaped = false;
        for (int i = 0; i < length; i++) {
            char c = str.charAt(i);
            int cint = 0xffff & c;
            if (cint < 32)
                switch (c) {
                    case 11:
                    default:
                        newLength--;
                        someCharacterEscaped = true;
                        break;

                    case '\t':
                    case '\n':
                    case '\f':
                    case '\r':
                        break;
                }
            else
                switch (c) {
                    case '"':
                        newLength += 5;
                        someCharacterEscaped = true;
                        break;

                    case '&':
                    case '\'':
                        newLength += 4;
                        someCharacterEscaped = true;
                        break;

                    case '<':
                    case '>':
                        newLength += 3;
                        someCharacterEscaped = true;
                        break;
                }
        }
        if (!someCharacterEscaped)
            return str;

        StringBuffer sb = new StringBuffer(newLength);
        for (int i = 0; i < length; i++) {
            char c = str.charAt(i);
            int cint = 0xffff & c;
            if (cint < 32)
                switch (c) {
                    case '\t':
                    case '\n':
                    case '\f':
                    case '\r':
                        sb.append(c);
                        break;
                }
            else
                switch (c) {
                    case '"':
                        sb.append("&quot;");
                        break;

                    case '\'':
                        sb.append("&apos;");
                        break;

                    case '&':
                        sb.append("&amp;");
                        break;

                    case '<':
                        sb.append("&lt;");
                        break;

                    case '>':
                        sb.append("&gt;");
                        break;

                    default:
                        sb.append(c);
                        break;
                }
        }
        return sb.toString();
    }

    public static String Html2Text(String inputString) {
        String htmlStr = inputString; //含html标签的字符串 
        String textStr = "";
        Pattern p_script;
        java.util.regex.Matcher m_script;
        Pattern p_style;
        java.util.regex.Matcher m_style;
        Pattern p_html;
        java.util.regex.Matcher m_html;

        try {
            String regEx_script = "<[\\s]*?script[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?script[\\s]*?>"; //定义script的正则表达式{或<script[^>]*?>[\\s\\S]*?<\\/script> } 
            String regEx_style = "<[\\s]*?style[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?style[\\s]*?>"; //定义style的正则表达式{或<style[^>]*?>[\\s\\S]*?<\\/style> } 
            String regEx_html = "<[^>]+>"; //定义HTML标签的正则表达式 

            p_script = Pattern.compile(regEx_script, Pattern.CASE_INSENSITIVE);
            m_script = p_script.matcher(htmlStr);
            htmlStr = m_script.replaceAll(""); //过滤script标签 

            p_style = Pattern.compile(regEx_style, Pattern.CASE_INSENSITIVE);
            m_style = p_style.matcher(htmlStr);
            htmlStr = m_style.replaceAll(""); //过滤style标签 

            p_html = Pattern.compile(regEx_html, Pattern.CASE_INSENSITIVE);
            m_html = p_html.matcher(htmlStr);
            htmlStr = m_html.replaceAll(""); //过滤html标签 

            textStr = htmlStr;

        } catch (Exception e) {
            System.err.println("Html2Text: " + e.getMessage());
        }

        return textStr;//返回文本字符串
    }
}
