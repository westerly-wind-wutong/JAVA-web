package com.pch.common;

import java.sql.*;

@SuppressWarnings("all")
public class DBUtils {
	private static final String DRIVER_NAME = "com.mysql.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/shanhaidb";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "root";

	// ��ȡ���Ӷ���ķ���
	public static Connection getConnection() {

		//û��ʹ�����ݿ����ӳ�5日
		try {
			System.out.println("数据库连接中");
			Class.forName(DRIVER_NAME);
			try {
				return DriverManager.getConnection(URL, USERNAME, PASSWORD);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return null;


	}

	// �ر���Դ�ķ���
	public static void close(Connection connection, PreparedStatement preparedStatement, ResultSet resultSet) {
		if (resultSet != null) {
			try {
				resultSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		if (preparedStatement != null) {
			try {
				preparedStatement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

}
