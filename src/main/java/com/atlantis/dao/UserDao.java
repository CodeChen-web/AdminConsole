package com.atlantis.dao;

import com.atlantis.domain.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao {
    // 查询所有用户信息
    public List<User> findAllUser() throws Exception;

    // 根据查询条件来查询用户信息
    public List<User> findUserOfSearch(String search) throws Exception;
}
