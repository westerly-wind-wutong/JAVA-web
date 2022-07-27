package com.ch6;

public class SeekMin {
    public static String getMin(String input) {
        String[] data = input.split(",");
        if (data.length == 0)
            return "请提交用逗号分隔的整数数字串。";
        int minIndex =Integer.parseInt(data[0]);//定义最小值为数组的第一个数
        for (int i = 0; i < data.length; i++) {
            if(minIndex > Integer.parseInt(data[i])){
                minIndex = Integer.parseInt(data[i]);
            }
        }
        return "最小值" + String.valueOf(minIndex);
    }
}
