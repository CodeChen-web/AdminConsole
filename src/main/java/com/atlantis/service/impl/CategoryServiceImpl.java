package com.atlantis.service.impl;

import com.atlantis.dao.CategoryDao;
import com.atlantis.domain.Category;
import com.atlantis.service.CategoryService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service()
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    private CategoryDao categoryDao;

    @Override
    public List<Category> findAllCategory() throws Exception {
        return categoryDao.findAllCategory();
    }

    @Override
    public int addCategory(Category category) throws Exception {
        return categoryDao.addCategory(category);
    }

    @Override
    public Category fndCategoryByCid(int cid) throws Exception {
        return categoryDao.fndCategoryByCid(cid);
    }

    @Override
    public int updateCategory(Category category) throws Exception {
        return categoryDao.updateCategory(category);
    }

    @Override
    public int deleteCategory(int cid) throws Exception {
        return categoryDao.deleteCategory(cid);
    }

    @Override
    public List<Category> findCategoryOfSearch(String search, int page, int size) throws Exception {
        if ("".equals(search) || search == null) {
            PageHelper.startPage(page, size);
            categoryDao.findAllCategory();
        }
        PageHelper.startPage(page, size);
        return categoryDao.findCategoryOfSearch("%" + search + "%");
    }
}
