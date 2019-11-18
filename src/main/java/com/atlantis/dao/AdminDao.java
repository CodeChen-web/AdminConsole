package com.atlantis.dao;

import com.atlantis.domain.Admin;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdminDao {
    // 管理员账号登录
    public Admin findAdminOfLogin(Admin admin) throws Exception;

    // 更新管理员密码
    public int updateAdminOfPassword(Admin admin) throws Exception;

    // 查询所有管理员账号
    public List<Admin> findAllAdmin() throws Exception;
}
