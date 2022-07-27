package com.pch.common;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DBManager<T> {
	
	//�����ĸ��·���
	public static int commonUpdate(String sql,Object... objects ){
		//1.�Ȼ�ȡ���Ӷ���
		Connection connection = DBUtils.getConnection();
		PreparedStatement prepareStatement =null;
		try {
			//2.�õ�Ԥ�������
			prepareStatement = connection.prepareStatement(sql);
			for(int i=0;i<objects.length;i++){
				//3.��ռλ����ֵ(��Ϊռλ����1��ʼ�ģ�����Ҫi+1)
				prepareStatement.setObject(i+1, objects[i]);
			}
			//4.ִ��sql
			return prepareStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.close(connection, prepareStatement, null);
		}
		return 0;
	}
	
	//�����Ĳ�ѯ����
	public static<T> List<T> commonQuery(String sql,Class<T> clas,Object... objects ) throws InstantiationException, IllegalAccessException{
		List<T>  list=new ArrayList<T>();
		Connection connection = DBUtils.getConnection();
		PreparedStatement prepareStatement =null;
		ResultSet resultSet =null;
		try {
			prepareStatement = connection.prepareStatement(sql);
			//�жϲ����Ƿ�Ϊ��
			if(objects!=null){
				for(int i=0;i<objects.length;i++){
					prepareStatement.setObject(i+1, objects[i]);
				}
			}
			 resultSet = prepareStatement.executeQuery();
			while (resultSet.next()) {
				//ͨ������ʵ����һ������
				T newInstance = clas.newInstance();
				//ͨ�������ȡ�����е���������
				Field[] fields = clas.getDeclaredFields();
				for (Field field : fields) {
					//����˽������,������Ȩ
					field.setAccessible(true);
					//��ȡ��������
					String name = field.getName();
					//�ӽ���������ȡ�������������Ӧ��valueֵ
					Object value = resultSet.getObject(name);
					//��ͨ�����䴴����ʵ����������Ը�ֵ
					field.set(newInstance, value);
				}
				//�����Զ�����ӵ�list��
				list.add(newInstance);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.close(connection, prepareStatement, resultSet);
		}
		return list;
		
	}
	
	//��ѯ������
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
