package com.neuedu.controller;

import com.neuedu.pojo.Category;
import com.neuedu.service.ICategoryService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
@RequestMapping("/user/category/")
public class CategoryController {

    @Autowired
    ICategoryService categoryService;

    @RequestMapping("find")
    public String findAll(HttpSession session){

        List<Category> categoryList=categoryService.findAll();
        System.out.println(categoryList);
        session.setAttribute("categorylist",categoryList);

        return "categorylist";
    }


    @RequestMapping(value="update/{id}",method=RequestMethod.GET)
    public String update(@PathVariable("id") Integer categotyId,
                         HttpServletRequest request){
        Category category=categoryService.findCategoryById(categotyId);
        Category parentcategory=categoryService.findParentById(categotyId);
        List<Category> categoryList=categoryService.findAll();
        request.setAttribute("categorylist",categoryList);
        request.setAttribute("category",category);
        request.setAttribute("parentcategory",parentcategory);
        return "categoryupdate";

    }


    @RequestMapping(value = "update/{id}",method = RequestMethod.POST)
    public String update(Category category,
                         HttpServletRequest request,
                         HttpServletResponse response) throws UnsupportedEncodingException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        int count=categoryService.updateCategory(category);

        if (count>0){
            return "redirect:/user/category/find";
        }
        return "categoryupdate";

    }
    @RequestMapping("delete/{id}")
    public String delete(@PathVariable("id") Integer categotyId){
        int count=categoryService.deleteCategory(categotyId);
        return "redirect:/user/category/find";
    }
    @RequestMapping(value = "add",method=RequestMethod.GET)
    public String add(HttpServletRequest request){
        List<Category> categoryList=categoryService.findAll();
        request.setAttribute("categorylist",categoryList);
        return "categoryadd";
    }
    @RequestMapping(value = "add",method=RequestMethod.POST)
    public String add(Category category,HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        System.out.println(category.getName());
        int count=categoryService.addCategory(category);
        if(count>0){
            return "redirect:/user/category/find";
        }
        return "categoryadd";
    }
}
