package com.neuedu.controller;

import com.neuedu.pojo.Category;
import com.neuedu.pojo.Product;
import com.neuedu.service.ICategoryService;
import com.neuedu.service.IProductService;
import com.neuedu.service.Impl.ProductServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/user/product/")
public class ProductController {
    @Autowired
    IProductService productService;
    @Autowired
    ICategoryService categoryService;
    @RequestMapping("find")
    public String find(HttpSession session){
        List<Product> productList=productService.findAll();
        session.setAttribute("productlist",productList);
        return "product/productlist";
    }
    @RequestMapping(value = "update/{id}",method = RequestMethod.GET)
    public String update(@PathVariable("id")Integer productid,
                         HttpServletRequest request){
        Product product=productService.findProductById(productid);
        List<Category> categoryList=categoryService.findAll();
        Category category=categoryService.findCategoryById(product.getCategoryId());
        request.setAttribute("category",category);
        request.setAttribute("categorylist",categoryList);
        request.setAttribute("product",product);
        return "product/productupdate";
    }
    @RequestMapping(value = "update/{id}",method = RequestMethod.POST)
    public String update(Product product,
                         @RequestParam("images")MultipartFile[] uploadImages,
                         HttpServletRequest request){
        String subImg=productService.findProductById(product.getId()).getSubImages();

        if(uploadImages!=null&&!uploadImages[0].getOriginalFilename().equals("")) {
            for (int i = 0; i<uploadImages.length;i++){
                String uuid = UUID.randomUUID().toString();
                String fileName = uploadImages[i].getOriginalFilename();
                System.out.println("fileName" + fileName);
                String fileextendname = fileName.substring(fileName.lastIndexOf("."));
                String newfileName = uuid + fileextendname;
                File file = new File("D:\\upload");
                if (!file.exists()) {
                    file.mkdir();
                }
                File newFile = new File(file, newfileName);
                try {
                    uploadImages[i].transferTo(newFile);
                } catch (IOException e) {
                    e.printStackTrace();
                }
                subImg=subImg+","+newfileName;
            }

        }
        product.setSubImages(subImg);
       int count=productService.updateProduct(product);
        if(count>0){
            return "redirect:/user/product/find";
        }
        return "product/productupdate";
    }

    @RequestMapping(value = "add",method = RequestMethod.GET)
    public String add(HttpServletRequest request){
        List<Category> categoryList=categoryService.findAll();
        request.setAttribute("categorylist",categoryList);
        return "product/productadd";
    }
    @RequestMapping(value = "add",method = RequestMethod.POST)
    public String add(Product product,
                      @RequestParam("images")MultipartFile[] uploadImages
                      ){
        String mainImg="";
        String subImg="";
        if(uploadImages!=null&&!uploadImages[0].getOriginalFilename().equals("")) {
            for (int i = 0; i<uploadImages.length;i++){
                String uuid = UUID.randomUUID().toString();
                String fileName = uploadImages[i].getOriginalFilename();
                System.out.println("fileName" + fileName);
                String fileextendname = fileName.substring(fileName.lastIndexOf("."));
                String newfileName = uuid + fileextendname;
                File file = new File("D:\\upload");
                if (!file.exists()) {
                    file.mkdir();
                }
                File newFile = new File(file, newfileName);
                try {
                    uploadImages[i].transferTo(newFile);
                } catch (IOException e) {
                    e.printStackTrace();
                }
                if(i==0){
                    mainImg=newfileName;
                }
                subImg=subImg+newfileName+",";
            }
        }
        subImg=subImg.substring(0,subImg.length()-1);
        product.setMainImage(mainImg);
        product.setSubImages(subImg);
        int count=productService.addProduct(product);
        if(count>0){
            return "redirect:/user/product/find";
        }
        return "product/add";
    }



    @RequestMapping(value="delete/{id}")
    public String delete(@PathVariable("id")Integer productid){
        int count=productService.deleteProduct(productid);
        return "redirect:/user/product/find";
    }

}
