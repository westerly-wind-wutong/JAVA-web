package com.pch.common;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 数据验证类
 */
public class DataValidator {
	
	
	/**
	 * 验证字符串是否为空 = "" or = null
	 * @param input - 需要验证的字符串
	 * @return true/false
	 */
	public static boolean isNullOrEmpty(String input){
		return "".equals(input) || input == null;
	}
	
	/**
	 * 验证电子邮箱地址
	 * @param input - 需要验证的字符串
	 * @return true/false
	 */
	public static boolean isEmail(String input)
    {
        if (isNullOrEmpty(input))
        {
            return false;
        }
        return regexMatch(input, "^\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$");
    }
	
	/**
	 * 匹配正则表达式
	 * @param input - 需要进行匹配的字符串
	 * @param pattern - 正则表达式
	 * @return  true/false
	 */
	public static boolean regexMatch(String input, String pattern)
    {
        if (isNullOrEmpty(input))
        {
            return false;
        }
        return Pattern.compile(pattern).matcher(input).matches();
    }
	/**
	 * TML编码，支持换行符
	 * @param input - 需要编码的字符串
	 * @return 编码后的字符串
	 */
	public static String htmlEncode(String input) {
		if (!DataValidator.isNullOrEmpty(input)) {
			input = input.replace("&", "&amp;");
			input = input.replace("<", "&lt;");
			input = input.replace(">", "&gt;");
			input = input.replace("'", "&#39;");
			input = input.replace("\"", "&quot;");
			input = input.replace("\r\n", "<br>");
			input = input.replace("\n", "<br>");
		}
		return input;
	}

	/**
	 * HTML反编码，支持换行符
	 * @param input - 需要反编码的字符串
	 * @return 编码前的原始字符串
	 */
	public static String htmlDecode(String input){
		if (!DataValidator.isNullOrEmpty(input)) {
			input = input.replace("<br>", "\n");
			input = input.replace("&gt;", ">");
			input = input.replace("&lt;", "<");
			input = input.replace("&#39;", "'");
			input = input.replace("&quot;", "\"");
            input = input.replace("&amp;", "&");
		}
		return input;
	}
	
	/**
	 * HTML编码，不支持换行符
	 * @param input - 需要编码的字符串
	 * @return 编码后的字符串
	 */
	public static String serverHtmlEncode(String input){
		if(DataValidator.isNullOrEmpty(input))
			return input;
		input = input.replace("&", "&amp;");
		input = input.replace("<", "&lt;");
		input = input.replace(">", "&gt;");
		input = input.replace("'", "&#39;");
		input = input.replace("\"", "&quot;");
		return input;
	}
	
	/**
	 * HTML反编码，不支持换行符
	 * @param input - 需要反编码的字符串
	 * @return  编码前的原始字符串
	 */
	public static String serverHtmlDecode(String input){
		if(DataValidator.isNullOrEmpty(input))
			return input;
		input = input.replace("&gt;", ">");
		input = input.replace("&lt;", "<");
        input = input.replace("&#39;", "'");
        input = input.replace("&quot;", "\"");
        input = input.replace("&amp;", "&");
        return input;
	}
	
	/**
	 * 过滤所有HTML代码
	 * @param input - 需要过滤的字符串
	 * @return 过滤后的字符串
	 */
	public static String removeHtml(String input) {
		if (DataValidator.isNullOrEmpty(input))
			return input;
		Pattern p = Pattern.compile("<[^>]*>", Pattern.MULTILINE
				| Pattern.UNICODE_CASE);
		Matcher m = p.matcher(input);
		return m.replaceAll("");
	}
}
