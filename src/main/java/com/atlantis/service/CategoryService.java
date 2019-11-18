package com.atlantis.service;

import com.atlantis.domain.Category;

import java.util.List;

public interface CategoryService {
    // 查询所有商品分类信息
    public List<Category> findAllCategory() throws Exception;

    // 添加商品分类
    public int addCategory(Category category) throws Exception;

    // 根据cid查询商品分类
    public Category fndCategoryByCid(int cid) throws Exception;

    // 更新商品分类信息
    public int updateCategory(Category category) throws Exception;

    // 根据cid删除商品分类
    public int deleteCategory(int cid) throws Exception;

    // 根据查询条件来查询商品分类
    public List<Category> findCategoryOfSearch(String search, int page, int size) throws Exception;
}
