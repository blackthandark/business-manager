package com.neuedu.service;

import com.neuedu.pojo.Product;
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

    List<Product> findAll(Integer offset, Integer length);

    int findTotalPageNo();

    int updateStatus(int id,int status);
}
