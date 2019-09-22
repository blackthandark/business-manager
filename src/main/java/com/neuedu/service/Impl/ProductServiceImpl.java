package com.neuedu.service.Impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.common.collect.Lists;
import com.google.common.collect.Sets;
import com.neuedu.consts.Const;
import com.neuedu.dao.CategoryMapper;
import com.neuedu.dao.ProductMapper;
import com.neuedu.pojo.Category;
import com.neuedu.pojo.Product;
import com.neuedu.service.IProductService;
import com.neuedu.utils.DateUtils;
import com.neuedu.vo.ProductDetailVO;
import com.neuedu.vo.ProductListVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Set;
import java.util.UUID;
@PropertySource("classpath:jdbc.properties")
@Service
public class ProductServiceImpl implements IProductService{
    @Autowired
    ProductMapper productMapper;
    @Autowired
    CategoryMapper categoryMapper;
    @Value("${imageHost}")
    private String imageHost;
    @Override
    public int deleteProduct(Integer id) {
        return productMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int addProduct(Product record) {
        return productMapper.insert(record);
    }

    @Override
    public Product findProductById(Integer id) {
        return productMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Product> findAll() {
        return productMapper.selectAll();
    }

    @Override
    public int updateProduct(Product record) {
        return productMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<ProductListVO> findAll(Integer offset, Integer length) {

        List<Product> productList=productMapper.selectByPage(offset,length);
        List<ProductListVO> productListVOList= Lists.newArrayList();
        if(productList!=null&&productList.size()>0){
            for(Product product:productList){
                if(product.getStatus()== Const.ProductStatus.PRODUCT_ONLINE.getCode()){
                    ProductListVO productListVO=assembleProductListVO(product);
                    productListVOList.add(productListVO);}
            }
        }
        return productListVOList;
    }

    @Override
    public int findTotalPageNo() {
        return productMapper.selectTotalPageNo();
    }

    @Override
    public int updateStatus(int id, int status) {
        return productMapper.updateStatus(id,status);
    }

    @Override
    public PageInfo list(String type,String searchText,Integer pageNum, Integer pageSize) {
        Page page=null;
        List<Product> productList=Lists.newArrayList();
        List<ProductListVO> productListVOList= Lists.newArrayList();
        if(searchText!=null&&!"".equals(searchText)){
            if(Const.SearchEnum.BYCATEGORY.getDesc().equals(type)){
                if (searchText!=null&&!"".equals(searchText)){
                    searchText="%"+searchText+"%";
                    Set<Integer> integerSet=Sets.newHashSet();
                    List<Category> categoryList=categoryMapper.selectByLikeName(searchText);
                    if(categoryList!=null&&categoryList.size()>0){
                        for(Category category1:categoryList){
                            integerSet.add(category1.getId());
                        }
                    }
                    if(integerSet!=null&&integerSet.size()>0){
                        page=PageHelper.startPage(pageNum,pageSize);
                        productList=productMapper.searchByCategorySet(integerSet);
                    }else{
                        page=PageHelper.startPage(pageNum,pageSize);
                        productList=productMapper.searchProductByCategory(-1);
                    }

                }
            }
            else if(Const.SearchEnum.BYPRODUCT.getDesc().equals(type)){
                page=PageHelper.startPage(pageNum,pageSize);
                if (searchText!=null&&!"".equals(searchText)){
                    searchText="%"+searchText+"%";
                }
                productList=productMapper.searchByProductname(searchText);
            }
            else{
                page=PageHelper.startPage(pageNum,pageSize);
                productList=productMapper.selectAll();
            }
        }else{
            page=PageHelper.startPage(pageNum,pageSize);
            productList=productMapper.selectAll();
        }
        int i=0;
        if(productList!=null&&productList.size()>0){
            for(Product product:productList){
                    ProductListVO productListVO=assembleProductListVO(product);
                    page.set(i,productListVO);
                   /* productListVOList.add(productListVO);*/
                    i=i+1;
            }
        }
        PageInfo pageInfo=new PageInfo(page);

        return pageInfo;
    }

    @Override
    public ProductDetailVO detail(Integer id) {
        Product product=productMapper.selectByPrimaryKey(id);
        ProductDetailVO productDetailVO=assembleProductDetailVO(product);
        return productDetailVO;
    }

    private ProductDetailVO assembleProductDetailVO(Product product) {
        ProductDetailVO productDetailVO=new ProductDetailVO();
        Category category=categoryMapper.selectByPrimaryKey(product.getCategoryId());
        productDetailVO.setCategory(category.getName());
        productDetailVO.setId(product.getId());
        productDetailVO.setDetail(product.getDetail());
        productDetailVO.setCategoryId(product.getCategoryId());
        productDetailVO.setMainImage(product.getMainImage());
        productDetailVO.setSubImages(product.getSubImages());
        String str=product.getSubImages();
        String[] strarr=null;
        if(str!=null&&!"".equals(str)){
            strarr=str.split(",");
        }
        if(strarr!=null&&strarr.length>0){
            productDetailVO.setSubImgArr(strarr);
        }
        productDetailVO.setName(product.getName());
        productDetailVO.setPrice(product.getPrice());
        productDetailVO.setStatus(product.getStatus());
        productDetailVO.setStatusDesc(Const.ProductStatus.codeOf(product.getStatus()).getDesc());
        productDetailVO.setSubtitle(product.getSubtitle());
        productDetailVO.setStock(product.getStock());
        productDetailVO.setCreateTime(DateUtils.dateToStr(product.getCreateTime()));
        productDetailVO.setUpdateTime(DateUtils.dateToStr(product.getUpdateTime()));
        return productDetailVO;
    }

    private ProductListVO assembleProductListVO(Product product) {
        ProductListVO productListVO=new ProductListVO();
        Category category=categoryMapper.selectByPrimaryKey(product.getCategoryId());
        productListVO.setCategory(category.getName());
        productListVO.setId(product.getId());
        productListVO.setCategoryId(product.getCategoryId());
        productListVO.setMainImage(product.getMainImage());
        productListVO.setName(product.getName());
        productListVO.setPrice(product.getPrice());
        productListVO.setStatus(product.getStatus());
        productListVO.setSubtitle(product.getSubtitle());
        productListVO.setStock(product.getStock());
        productListVO.setCreateTime(DateUtils.dateToStr(product.getCreateTime()));
        productListVO.setUpdateTime(DateUtils.dateToStr(product.getUpdateTime()));
        return productListVO;
    }


}
