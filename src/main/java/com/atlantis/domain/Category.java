package com.atlantis.domain;

import java.io.Serializable;
import java.util.List;

/**
 * Category - 商品分类实体类
 */
public class Category implements Serializable {
    private Integer cid; // ID编号
    private String cname;// 名称
    private String cexplain;// 描述
    private List<Product> products;// 分类中包含的商品

    public Category() {
        super();
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCexplain() {
        return cexplain;
    }

    public void setCexplain(String cexplain) {
        this.cexplain = cexplain;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    @Override
    public String toString() {
        return "Category{" +
                "cid=" + cid +
                ", cname='" + cname + '\'' +
                ", cexplain='" + cexplain + '\'' +
                ", products=" + products +
                '}';
    }
}
