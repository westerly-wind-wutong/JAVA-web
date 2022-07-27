package com.pch.dal;

import com.pch.common.DBManager;
import com.pch.common.DataValidator;
import com.pch.model.CategoryInfo;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class Category {


    /**
     * 获取文章分类列表
     *
     * @param keyword  名称
     * @param startNum 分页开始查询行
     * @param pageSize 分页每页查询行
     * @return
     * @throws SQLException
     */
    public List<CategoryInfo> getList(String keyword, int startNum, int pageSize) throws SQLException {
        String sql = "select * from  category where '1==1' ";
        List<Object> params = new ArrayList<Object>();
        if (!DataValidator.isNullOrEmpty(keyword)) {
            sql = sql + " and name like CONCAT('%',?,'%')";
            params.add(keyword);
        }

        sql = sql + " order by sort asc  limit ?,? ";
        params.add((startNum - 1) * pageSize);
        params.add(pageSize);
        //System.out.println(sql);
        try {
            List<CategoryInfo> list = DBManager.commonQuery(sql, CategoryInfo.class, params.toArray());
            return list;
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     *获取所有列表
     * @return
     * @throws SQLException
     * @throws IllegalAccessException
     * @throws InstantiationException
     */
    public List<CategoryInfo> getList() throws SQLException, IllegalAccessException, InstantiationException {
        String sql = "select * from  category order by sort asc ";
        List<CategoryInfo> list = DBManager.commonQuery(sql, CategoryInfo.class);
        return list;
    }

    /**
     * 插入文章分类
     *
     * @param info 文章分类对象
     * @return
     */
    public int insert(CategoryInfo info) {
        String sql = "insert into category (name,sort) values (?,?)";
        List<Object> params = new ArrayList<Object>();
        params.add(info.getName());
        params.add(info.getSort());
        return DBManager.commonUpdate(sql, params.toArray());


    }

    /**
     * 编辑文章分类
     *
     * @param info
     * @return
     */
    public int update(CategoryInfo info) {
        String sql = "update category set  name=?,sort=?  where id=?";
        List<Object> params = new ArrayList<Object>();
        params.add(info.getName());
        params.add(info.getSort());
        params.add(info.getId());
        return DBManager.commonUpdate(sql, params.toArray());
    }

    /**
     * 删除文章分类
     *
     * @param id 文章分类编号
     * @return
     */
    public int delete(String id) {
        String sql = "delete from category where id in (" + id + ")";
        return DBManager.commonUpdate(sql);

    }

    /**
     * 获取总记录数
     *
     * @return
     * @throws SQLException
     */
    public int getCount() throws SQLException {
        String sql = "select count(*)   from category";
        return DBManager.commonCount(sql);

    }

    /**
     * 获取当条文章分类记录
     *
     * @param id 文章分类编号
     * @return 返回文章分类对象
     * @throws SQLException
     * @throws IllegalAccessException
     * @throws InstantiationException
     */
    public CategoryInfo getCategoryInfo(int id) throws SQLException, IllegalAccessException, InstantiationException {
        CategoryInfo info = new CategoryInfo();
        String sql = "select * from Category  where id=?";
        List<Object> params = new ArrayList<Object>();
        params.add(id);
        List<CategoryInfo> list = DBManager.commonQuery(sql, CategoryInfo.class, params.toArray());
        if (list.size() > 0) {
            info.setId(list.get(0).getId());
            info.setName(list.get(0).getName());
            info.setSort(list.get(0).getSort());

        }
        return info;
    }
}
