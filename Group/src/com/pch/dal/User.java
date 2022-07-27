package com.pch.dal;

import com.pch.common.DBManager;
import com.pch.common.DataValidator;
import com.pch.model.UserInfo;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class User {
	/**
	 * 判断用户名密码是否正确
	 * @param username
	 * @param password
	 * @return
	 * @throws SQLException
	 * @throws IllegalAccessException
	 * @throws InstantiationException
	 */
	public boolean isExist(String username, String password)
			throws SQLException, IllegalAccessException, InstantiationException {
		boolean result = false;
		UserInfo info = new UserInfo();
		String sql = "select * from User where UserName=? and Password=? ";
		List<Object> params = new ArrayList<Object>();
		params.add(username);
		params.add(MD5.Encrypt(password));
		List<UserInfo> list = DBManager.commonQuery(sql, UserInfo.class, params.toArray());
		if (list.size()>0)
			return  true;
		else
			return  false;

	}

	/**
	 * 时间管理员列表
	 * @param keyword
	 * @param startNum
	 * @param pageSize
	 * @return
	 * @throws SQLException
	 */
	public List<UserInfo> getList(String keyword, int startNum, int pageSize) throws SQLException {
		String sql = "select * from  user where '1==1' ";
		List<Object> params = new ArrayList<Object>();
		if (!DataValidator.isNullOrEmpty(keyword)) {
			sql = sql + " and username like CONCAT('%',?,'%')";
			params.add(keyword);
		}

		sql = sql + " order by id desc  limit ?,? ";
		params.add((startNum - 1) * pageSize);
		params.add(pageSize);
		//System.out.println(sql);
		try {
			List<UserInfo> list = DBManager.commonQuery(sql, UserInfo.class, params.toArray());
			return list;
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 添加管理员
	 * @param info
	 * @return
	 */
	public int insert(UserInfo info) {
		String sql = "insert into user (username,password,email) values (?,?,?)";
		List<Object> params = new ArrayList<Object>();
		params.add(info.getUsername());
		params.add(info.getPassword());
		params.add(info.getEmail());
		return DBManager.commonUpdate(sql, params.toArray());


	}

	/**
	 * 修改管理员
	 * @param info
	 * @return
	 */
	public int update(UserInfo info) {
		String sql = "update user set  password=?,email=? ,username=? where id=?";
		List<Object> params = new ArrayList<Object>();
		params.add(info.getPassword());
		params.add(info.getEmail());
		params.add(info.getUsername());
		params.add(info.getId());
		return DBManager.commonUpdate(sql, params.toArray());
	}

	/**
	 * 删除 管理员
	 * @param id
	 * @return
	 */
	public int delete(String id) {
		String sql = "delete from user where id in (" + id + ")";
		return DBManager.commonUpdate(sql);

	}

	/**
	 * 获取总记录数
	 *
	 * @return
	 * @throws SQLException
	 */
	public int getCount() throws SQLException {
		String sql = "select count(*)   from user";
		return DBManager.commonCount(sql);

	}

	/**
	 * 根据ID获取用户信息
	 * @param id
	 * @return
	 * @throws SQLException
	 * @throws IllegalAccessException
	 * @throws InstantiationException
	 */
	public UserInfo getUserInfo(int id) throws SQLException, IllegalAccessException, InstantiationException {
		UserInfo info = new UserInfo();
		String sql = "select * from user  where id=?";
		List<Object> params = new ArrayList<Object>();
		params.add(id);
		List<UserInfo> list = DBManager.commonQuery(sql, UserInfo.class, params.toArray());
		if (list.size() > 0) {
			info.setId(list.get(0).getId());
			info.setUsername(list.get(0).getUsername());
			info.setPassword(list.get(0).getPassword());
			info.setEmail(list.get(0).getEmail());
		}
		return info;
	}


}
