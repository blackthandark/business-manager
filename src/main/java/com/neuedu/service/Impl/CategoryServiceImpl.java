package com.neuedu.service.Impl;

import com.neuedu.dao.CategoryMapper;
import com.neuedu.exception.MyException;
import com.neuedu.pojo.Category;
import com.neuedu.service.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl implements ICategoryService{
    @Autowired
    CategoryMapper categoryMapper;
    @Override
    public int addCategory(Category category) throws MyException {
        return categoryMapper.insert(category);
    }

    @Override
    public int deleteCategory(int id) throws MyException {
        return categoryMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateCategory(Category category) throws MyException {
        return categoryMapper.updateByPrimaryKey(category);
    }

    @Override
    public List<Category> findAll() throws MyException {

        return categoryMapper.selectAll();
    }

    @Override
    public Category findCategoryById(int categoryId) {
        return categoryMapper.selectByPrimaryKey(categoryId);
    }

    @Override
    public Category findParentById(int categoryId) {
        return categoryMapper.findParentById(categoryId);
    }

    @Override
    public List<Category> findOther(int categoryId) throws MyException {
        return categoryMapper.findOther(categoryId);
    }

    @Override
    public List<Category> findAll(Integer offset, Integer length) {
        return categoryMapper.selectByPage(offset,length);
    }

    @Override
    public int findTotalPageNo() {
        return categoryMapper.selectTotalPageNo();
    }
}
