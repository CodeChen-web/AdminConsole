package com.atlantis.service;

import com.atlantis.domain.User;

import java.util.List;

public interface UserService {
    // 根据查询条件来查询用户信息
    public List<User> findUserOfSearch(String search, int page, int size) throws Exception;
}
