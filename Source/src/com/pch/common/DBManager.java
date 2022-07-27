package com.pch.common;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DBManager<T> {
	
	//公共的更新方法
	public static int commonUpdate(String sql,Object... objects ){
		//1.先获取连接对象
		Connection connection = DBUtils.getConnection();
		PreparedStatement prepareStatement =null;
		try {
			//2.得到预处理对象
			prepareStatement = connection.prepareStatement(sql);
			for(int i=0;i<objects.length;i++){
				//3.给占位符赋值(因为占位符是1开始的，所以要i+1)
				prepareStatement.setObject(i+1, objects[i]);
			}
			//4.执行sql
			return prepareStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.close(connection, prepareStatement, null);
		}
		return 0;
	}
	
	//公共的查询方法
	public static<T> List<T> commonQuery(String sql,Class<T> clas,Object... objects ) throws InstantiationException, IllegalAccessException{
		List<T>  list=new ArrayList<T>();
		Connection connection = DBUtils.getConnection();
		PreparedStatement prepareStatement =null;
		ResultSet resultSet =null;
		try {
			prepareStatement = connection.prepareStatement(sql);
			//判断参数是否为空
			if(objects!=null){
				for(int i=0;i<objects.length;i++){
					prepareStatement.setObject(i+1, objects[i]);
				}
			}
			 resultSet = prepareStatement.executeQuery();
			while (resultSet.next()) {
				//通过反射实例化一个对象
				T newInstance = clas.newInstance();
				//通过反射获取对象中的所有属性
				Field[] fields = clas.getDeclaredFields();
				for (Field field : fields) {
					//操作私有属性,必须授权
					field.setAccessible(true);
					//获取属性名称
					String name = field.getName();
					//从结果集里面获取与属性名称相对应的value值
					Object value = resultSet.getObject(name);
					//给通过反射创建的实例对象的属性赋值
					field.set(newInstance, value);
				}
				//将属性对象添加到list中
				list.add(newInstance);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.close(connection, prepareStatement, resultSet);
		}
		return list;
		
	}
	
	//查询总条数
	public static int commonCount(String sql){
		Connection connection =null;
		PreparedStatement prepareStatement =null;
		ResultSet resultSet =null;
		try {
			 connection = DBUtils.getConnection();
			  prepareStatement = connection.prepareStatement(sql);
			  resultSet = prepareStatement.executeQuery();
			  while (resultSet.next()) {
				  return resultSet.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.close(connection, prepareStatement, resultSet);
		}
		return 0;
	}
}
