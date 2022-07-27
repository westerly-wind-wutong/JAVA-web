package com.pch.model;

import java.util.List;

//分页类
public class PageBean {
    //当前页
    private Integer currentPage=1;
    //每页显示的条数
    private Integer PageSize=3;
    //总页数
    private Integer totaPage;
    //总条数
    private Integer totalCount;
    //当前页要显示的数据
    private List<?> data;
    public Integer getCurrentPage() {
        return currentPage;
    }
    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }
    public Integer getPageSize() {
        return PageSize;
    }
    public void setPageSize(Integer pageSize) {
        PageSize = pageSize;

    }
    public Integer getTotaPage() {
        return totaPage;
    }
    public void setTotaPage(Integer totaPage) {
        this.totaPage = totaPage;
    }
    public Integer getTotalCount() {
        return totalCount;
    }
    public void setTotalCount(Integer totalCount) {
        this.totalCount = totalCount;
        //设置总条数的时候,可以一同把总页数设置了
        if (this.totalCount%this.PageSize==0) {
            this.totaPage=(totalCount/PageSize);
        } else {
            this.totaPage=(totalCount/PageSize)+1;
        }
    }
    public List<?> getData() {
        return data;
    }
    public void setData(List<?> data) {
        this.data = data;
    }
    public PageBean() {
    }
    public PageBean(Integer currentPage, Integer pageSize, Integer totaPage, Integer totalCount, List<?> data) {
        this.currentPage = currentPage;
        PageSize = pageSize;
        this.totaPage = totaPage;
        this.totalCount = totalCount;
        this.data = data;
    }
    @Override
    public String toString() {
        return "Page [currentPage=" + currentPage + ", PageSize=" + PageSize + ", totaPage=" + totaPage
                + ", totalCount=" + totalCount + ", data=" + data + "]";
    }


}
