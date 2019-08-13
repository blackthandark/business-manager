package com.neuedu.service;

import com.neuedu.exception.MyException;
import com.neuedu.pojo.Category;

import java.util.List;

public interface ICategoryService {
    /**
     * 添加类别
     */


    public int addCategory(Category category)throws MyException;

    /**
     * 删除类别

     */
    public int deleteCategory(int id)throws MyException;

    /**
     *
     * 修改类别
     * @param category
     * @return
     * @throws MyException
     */
    public int updateCategory(Category category)throws MyException;



    public List<Category> findAll()throws MyException;


    /**
     * 根据类别id查询类别信息
     *
     */
    public  Category findCategoryById(int categoryId);

    Category findParentById(int categoryId);

    public List<Category> findOther(int categoryId)throws MyException;

    public List<Category> findAll(Integer offset, Integer length);

    int findTotalPageNo();
}
