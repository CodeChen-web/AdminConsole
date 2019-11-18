package com.atlantis.service.impl;

import com.atlantis.dao.ProductDao;
import com.atlantis.domain.Product;
import com.atlantis.service.ProductService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service()
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductDao productDao;

    @Override
    public Product findProductByPid(int pid) throws Exception {
        return productDao.findProductByPid(pid);
    }

    @Override
    public List<Product> findProductOfSearch(String search, int page, int size) throws Exception {
        if ("".equals(search) || search == null) {
            PageHelper.startPage(page, size);
            productDao.findAllProduct();
        }
        PageHelper.startPage(page, size);
        return productDao.findProductOfSearch("%" + search + "%");
    }

    @Override
    public int addProduct(Product product) throws Exception {
        return productDao.addProduct(product);
    }

    @Override
    public int updateProductFlag(Product product) throws Exception {
        return productDao.updateProductFlag(product);
    }

    @Override
    public int deleteProduct(int pid) throws Exception {
        return productDao.deleteProduct(pid);
    }

    @Override
    public int updateProduct(Product product) throws Exception {
        return productDao.updateProduct(product);
    }
}
