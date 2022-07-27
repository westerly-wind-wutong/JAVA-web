/*
    Created by IntelliJ IDEA.
    User: Ding
    Date: 2022/5/20
    Time: 0:53
    To change this template use File | Settings | File Templates.
*/
package com.pch.model;

public class CategoryInfo {
    private int id;
    private String name = "";
    private int sort;

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public int getSort() {
        return sort;
    }
    public void setSort(int sort) {
        this.sort = sort;
    }
}
