package com.neuedu.service.Impl;

import com.neuedu.dao.ProductMapper;
import com.neuedu.pojo.Product;
import com.neuedu.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Service
public class ProductServiceImpl implements IProductService{
    @Autowired
    ProductMapper productMapper;

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


}
