package com.atlantis.controller;


import com.atlantis.domain.Category;
import com.atlantis.domain.Product;
import com.atlantis.service.CategoryService;
import com.atlantis.service.ProductService;
import com.atlantis.utils.IPTimeStamp;
import com.github.pagehelper.PageInfo;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;

@Controller
public class ProductController {
    @Autowired
    private ProductService productService;
    @Autowired
    private CategoryService categoryService;

    //  商品列表
    @RequestMapping(value = "/ProductManage")
    public ModelAndView ProductManage(
            @RequestParam(name = "search", required = true, defaultValue = "") String search,
            @RequestParam(name = "page", required = true, defaultValue = "1") int page,
            @RequestParam(name = "size", required = true, defaultValue = "5") int size) throws Exception {
        // 解决get请求中文乱码
        byte[] bytes = search.getBytes("iso-8859-1");
        search = new String(bytes, "utf-8");

        ModelAndView mv = new ModelAndView();
        List<Product> productList = productService.findProductOfSearch(search, page, size);
        // PageInfo 是 PageHelper提供的分页Bean
        PageInfo pageInfo = new PageInfo(productList);
        mv.addObject("pageInfo", pageInfo);
        List<Category> allCategory = categoryService.findAllCategory();
        mv.addObject("search", search);
        mv.addObject("allCategory", allCategory);
        mv.setViewName("ProductManage");
        return mv;
    }

    // 添加商品
    @RequestMapping(value = "/AddProduct")
    public String AddProduct(Product product, int cid, @RequestParam("file") MultipartFile file, HttpServletRequest request) throws Exception {
        // 将商品分类cid添加至商品中
        Category category = new Category();
        category.setCid(cid);
        product.setCategory(category);

        product.setFlag("1"); // 默认新添加的商品未上架

        /* 图片上传 */
        // 获取文件存储位置
        String realPath = request.getSession().getServletContext().getRealPath("/images");
        File pathFile = new File(realPath);
        if (!pathFile.exists()) {
            // 文件夹不存在则创建文件
            pathFile.mkdirs();
        }
        try {
            // 判断上传文件是否为空
            if (file.isEmpty()) {
                product.setImg("love.jpg");
            } else {
                IPTimeStamp ip = new IPTimeStamp();
                String ext = FilenameUtils.getExtension(file.getOriginalFilename());
                String filename = ip.getTimeStamp() + "." + ext;
                // 将文件copy上传到服务器
                file.transferTo(new File(realPath, filename));
                product.setImg(filename);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        // System.out.println(product);
        productService.addProduct(product);
        return "redirect:/ProductManage";
    }

    // 更改商品上架、下架状态
    @RequestMapping(value = "/operateProduct")
    public String operateProduct(
            @RequestParam(name = "search", required = true, defaultValue = "") String search,
            @RequestParam(name = "page", required = true, defaultValue = "1") int page,
            @RequestParam(name = "size", required = true, defaultValue = "5") int size,
            int pid, String flag) throws Exception {
        // 解决get请求中文乱码
        byte[] bytes = search.getBytes("iso-8859-1");
        search = new String(bytes, "utf-8");

        Product product = new Product();
        product.setPid(pid);
        // 判断商品上架或下架状态
        if ("0".equals(flag)) {
            // 将商品flag置1，表示该商品下架
            flag = "1";
            product.setFlag(flag);
        } else {
            // 将商品flag置0，表示该商品上架
            flag = "0";
            product.setFlag(flag);
        }
        productService.updateProductFlag(product);
        String path = "redirect:/ProductManage?page=" + page + "&size=" + size + "&search=" + search;
        return path;
    }

    // 删除商品
    @RequestMapping(value = "/deleteProduct")
    public String deleteProduct(
            int pid,
            @RequestParam(name = "search", required = true, defaultValue = "") String search,
            @RequestParam(name = "page", required = true, defaultValue = "1") int page,
            @RequestParam(name = "size", required = true, defaultValue = "5") int size) throws Exception {
        // 解决get请求中文乱码
        byte[] bytes = search.getBytes("iso-8859-1");
        search = new String(bytes, "utf-8");

        //System.out.println(pid);
        productService.deleteProduct(pid);
        String path = "redirect:/ProductManage?page=" + page + "&size=" + size + "&search=" + search;
        return path;
    }

    // 更新商品信息请求
    @RequestMapping(value = "/updateProductForward")
    public ModelAndView updateProductForward(int pid) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Category> allCategory = categoryService.findAllCategory();
        mv.addObject("allCategory", allCategory);
        Product product = productService.findProductByPid(pid);
        mv.addObject("product", product);
        mv.setViewName("UpdateProduct");
        return mv;
    }

    // 更新商品信息
    @RequestMapping(value = "/updateProduct")
    public String updateProduct(Product product, int cid, String oldImg, @RequestParam("file") MultipartFile file, HttpServletRequest request) throws Exception {
        // 将商品分类cid添加至商品中
        Category category = new Category();
        category.setCid(cid);
        product.setCategory(category);

        /* 图片上传 */
        // 获取文件存储位置
        String realPath = request.getSession().getServletContext().getRealPath("/images");

        File pathFile = new File(realPath);
        if (!pathFile.exists()) {
            // 文件夹不存在则创建文件
            pathFile.mkdirs();
        }
        try {
            // 判断上传文件是否为空
            if (file.isEmpty()) {
                product.setImg(oldImg);
            } else {
                IPTimeStamp ip = new IPTimeStamp();
                String ext = FilenameUtils.getExtension(file.getOriginalFilename());
                String filename = ip.getTimeStamp() + "." + ext;
                // 将文件copy上传到服务器
                file.transferTo(new File(realPath, filename));
                product.setImg(filename);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(product);
        productService.updateProduct(product);
        return "redirect:/ProductManage";
    }
}