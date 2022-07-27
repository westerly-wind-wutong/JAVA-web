package com.pch.dal;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.pch.common.DBManager;
import com.pch.common.DataValidator;
import com.pch.model.ArticleInfo;


public class Article {


    /**
     * 获取文章列表
     *
     * @param keyword   标题
     * @param beginDate 开始时间
     * @param endDate   结束时间
     * @param cid       分类编号
     * @param startNum  分页开始查询行
     * @param pageSize  分页每页查询行
     * @return
     * @throws SQLException
     */
    public List<ArticleInfo> getList(String keyword, String beginDate, String endDate, int cid, int startNum, int pageSize) throws SQLException {
        String sql = "select a.*,c.name as ClassName from article a left join category c on a.classid=c.id where '1==1' ";
        List<Object> params = new ArrayList<Object>();
        if (!DataValidator.isNullOrEmpty(keyword)) {
            sql = sql + " and a.title like CONCAT('%',?,'%')";
            params.add(keyword);
        }
        if (!DataValidator.isNullOrEmpty(beginDate) && !DataValidator.isNullOrEmpty(endDate)) {
            sql = sql + " and a.createdTime between ? and ?  ";
            params.add(beginDate);
            params.add(endDate);
        }
        if (cid > 0) {
            sql = sql + " and a.classid=? ";
            params.add(cid);
        }
        sql = sql + " order by id desc  limit ?,? ";
        params.add((startNum - 1) * pageSize);
        params.add(pageSize);
        //System.out.println(sql);
        try {
            List<ArticleInfo> list = DBManager.commonQuery(sql, ArticleInfo.class, params.toArray());
            return list;
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<ArticleInfo> getListBycid(int cid, int num) throws SQLException {
        String sql = "select a.*,c.name as ClassName from article a left join category c on a.classid=c.id where '1==1' ";
        List<Object> params = new ArrayList<Object>();
        if (cid > 0) {
            sql = sql + " and a.classid=? ";
            params.add(cid);
        }
        sql = sql + " order by id desc  limit 0,? ";
        params.add(num);
        //System.out.println(sql);
        try {
            List<ArticleInfo> list = DBManager.commonQuery(sql, ArticleInfo.class, params.toArray());
            return list;
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 插入文章
     *
     * @param info 文章对象
     * @return
     */
    public int insert(ArticleInfo info) {
        String sql = "insert into article (Title,Context,CreatedTime,ClassId,Picture) values (?,?,?,?,?)";
        List<Object> params = new ArrayList<Object>();
        params.add(info.getTitle());
        params.add(info.getContext());
        params.add(info.getCreatedtime());
        params.add(info.getClassid());
        params.add(info.getPicture());
        return DBManager.commonUpdate(sql, params.toArray());


    }

    /**
     * 编辑文章
     * @param info
     * @return
     */
    public int update(ArticleInfo info) {
        String sql = "update article set  Title=?,Context=?,ClassId=?,Picture=? where id=?";
        List<Object> params = new ArrayList<Object>();
        params.add(info.getTitle());
        params.add(info.getContext());
        params.add(info.getClassid());
        params.add(info.getPicture());
        params.add(info.getId());
        return DBManager.commonUpdate(sql, params.toArray());
    }

    /**
     * 删除文章
     *
     * @param id 文章编号
     * @return
     */
    public int delete(String id) {
        String sql = "delete from article where id in (" + id + ")";
        return DBManager.commonUpdate(sql);

    }

    /**
     * 获取总记录数
     *
     * @return
     * @throws SQLException
     */
    public int getCount( int cid ) throws SQLException {
        String sql = "select count(*)   from article ";
        if (cid > 0) {
            sql = sql + " where classid= "+cid;
        }
        System.out.println(sql);
        return DBManager.commonCount(sql);

    }

    /**
     * 获取当条文章记录
     *
     * @param id 文章编号
     * @return 返回文章对象
     * @throws SQLException
     * @throws IllegalAccessException
     * @throws InstantiationException
     */
    public ArticleInfo getArticleInfo(int id) throws SQLException, IllegalAccessException, InstantiationException {
        ArticleInfo info = new ArticleInfo();
        String sql = "select b.*,c.name as ClassName from article b left join category c on b.classid=c.id where b.id=?";
        List<Object> params = new ArrayList<Object>();
        params.add(id);
        List<ArticleInfo> list = DBManager.commonQuery(sql, ArticleInfo.class, params.toArray());
        if (list.size() > 0) {
            info.setId(list.get(0).getId());
            info.setCreatedtime(list.get(0).getCreatedtime());
            info.setContext(list.get(0).getContext());
            info.setClassid(list.get(0).getClassid());
            info.setTitle(list.get(0).getTitle());
            info.setClassid(list.get(0).getClassid());
            info.setClassName(list.get(0).getClassName());
            info.setPicture(list.get(0).getPicture());
        }
        return info;
    }
}
