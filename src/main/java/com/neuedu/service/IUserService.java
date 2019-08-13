package com.neuedu.service;

import com.neuedu.exception.MyException;
import com.neuedu.pojo.UserInfo;

import javax.jws.soap.SOAPBinding;
import java.util.List;

public interface IUserService {
    public UserInfo login(UserInfo userInfo) throws MyException;
    public List<UserInfo> findAllUser();
    public int addUser(UserInfo userInfo) throws MyException;
    public int delete(int id);
    public UserInfo findById(int id);
    public int updateUser(UserInfo userInfo);
}
