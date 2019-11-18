package com.atlantis.service.impl;

import com.atlantis.dao.UserDao;
import com.atlantis.domain.User;
import com.atlantis.service.UserService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service()
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public List<User> findUserOfSearch(String search, int page, int size) throws Exception {
        if ("".equals(search) || search == null) {
            PageHelper.startPage(page, size);
            return userDao.findAllUser();
        }
        PageHelper.startPage(page, size);
        return userDao.findUserOfSearch("%" + search + "%");
    }
}
