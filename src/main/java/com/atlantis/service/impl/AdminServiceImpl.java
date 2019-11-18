package com.atlantis.service.impl;

import com.atlantis.dao.AdminDao;
import com.atlantis.domain.Admin;
import com.atlantis.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminDao adminDao;

    @Override
    public Admin findAdminOfLogin(Admin admin) throws Exception {
        return adminDao.findAdminOfLogin(admin);
    }

    @Override
    public int updateAdminOfPassword(Admin admin) throws Exception {
        return adminDao.updateAdminOfPassword(admin);
    }

    @Override
    public List<Admin> findAllAdmin() throws Exception {
        return adminDao.findAllAdmin();
    }
}
