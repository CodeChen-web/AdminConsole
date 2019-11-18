package com.atlantis.controller;

import com.atlantis.domain.Category;
import com.atlantis.service.CategoryService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class CategoryController {
    @Autowired
    private CategoryService categoryService;

    //  商品分类列表
    @RequestMapping(value = "/CategoryManage")
    public ModelAndView CategoryManage(
            @RequestParam(name = "search", required = true, defaultValue = "") String search,
            @RequestParam(name = "page", required = true, defaultValue = "1") int page,
            @RequestParam(name = "size", required = true, defaultValue = "5") int size) throws Exception {
        // 解决get请求中文乱码
        byte[] bytes = search.getBytes("iso-8859-1");
        search = new String(bytes, "utf-8");

        ModelAndView mv = new ModelAndView();
        List<Category> categoryList = categoryService.findCategoryOfSearch(search, page, size);
        // PageInfo 是 PageHelper提供的分页Bean
        PageInfo pageInfo = new PageInfo(categoryList);
        mv.addObject("pageInfo", pageInfo);
        mv.addObject("search", search);
        mv.setViewName("CategoryManage");
        return mv;
    }

    // 添加商品分类
    @RequestMapping(value = "/addCategory")
    public ModelAndView addCategory(Category category) throws Exception {
        ModelAndView mv = new ModelAndView();
        categoryService.addCategory(category);
        mv.setViewName("redirect:/CategoryManage");
        return mv;
    }

    // 更新商品分类请求
    @RequestMapping(value = "/updateCategoryForward")
    public ModelAndView updateCategoryForward(int cid) throws Exception {
        ModelAndView mv = new ModelAndView();
        Category category = categoryService.fndCategoryByCid(cid);
        mv.addObject("category", category);
        mv.setViewName("UpdateCategory");
        return mv;
    }

    // 更新商品分类
    @RequestMapping(value = "/updateCategory")
    public ModelAndView updateCategory(Category category) throws Exception {
        ModelAndView mv = new ModelAndView();
        System.out.println(category);
        categoryService.updateCategory(category);
        mv.setViewName("redirect:/CategoryManage");
        return mv;
    }

    // 删除商品分类
    @RequestMapping(value = "/deleteCategory")
    public ModelAndView deleteCategory(int cid) throws Exception {
        ModelAndView mv = new ModelAndView();
        categoryService.deleteCategory(cid);
        mv.setViewName("redirect:/CategoryManage");
        return mv;
    }
}