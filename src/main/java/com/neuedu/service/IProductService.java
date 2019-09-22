package com.neuedu.service;

import com.github.pagehelper.PageInfo;
import com.neuedu.pojo.Product;
import com.neuedu.vo.ProductDetailVO;
import com.neuedu.vo.ProductListVO;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface IProductService {
    /**

     */
    int deleteProduct(Integer id);

    /**

     */
    int addProduct(Product record);

    /**

     */
    Product findProductById(Integer id);

    /**

     */
    List<Product> findAll();

    /**

     */
    int updateProduct(Product record);

    List<ProductListVO> findAll(Integer offset, Integer length);

    int findTotalPageNo();

    int updateStatus(int id,int status);

    PageInfo list(String type,String searchText,Integer pageNum,Integer pageSize);

    ProductDetailVO detail(Integer id);
}
