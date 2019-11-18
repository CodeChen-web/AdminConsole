package com.atlantis.dao;

import com.atlantis.domain.Product;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductDao {
    // 查询所有商品信息
    public List<Product> findAllProduct() throws Exception;

    // 根据pid查询商品
    public Product findProductByPid(int pid) throws Exception;

    // 根据查询条件来查询商品信息
    public List<Product> findProductOfSearch(String search) throws Exception;

    // 添加商品
    public int addProduct(Product product) throws Exception;

    // 更新商品上架或下架状态
    public int updateProductFlag(Product product) throws Exception;

    // 根据pid删除商品
    public int deleteProduct(int pid) throws Exception;

    // 更新商品信息
    public int updateProduct(Product product);
}
