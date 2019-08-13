package com.neuedu.service.Impl;

import com.neuedu.dao.UserInfoMapper;
import com.neuedu.exception.MyException;
import com.neuedu.pojo.UserInfo;
import com.neuedu.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements IUserService{
    @Autowired
    UserInfoMapper userInfoMapper;
    @Override
    public UserInfo login(UserInfo userInfo) throws MyException {
        //step1:参数非空校验
        if(userInfo==null){
            throw new MyException("参数不能为空","/user/login");
        }
        if(userInfo.getUsername()==null||userInfo.getUsername().equals("")){
            throw new MyException("用户名不能为空","/user/login");
        }
        if(userInfo.getPassword()==null||userInfo.getPassword().equals("")){
            throw new MyException("密码不能为空","/user/login");
        }
        //step2:判断用户名是否存在
        int username_result=userInfoMapper.exsistUsername(userInfo.getUsername());
        if(username_result==0){
            throw new MyException("用户不存在","/user/login");
        }

        UserInfo userInfo_result=userInfoMapper.findByUsernameAdPassword(userInfo);
        if(userInfo_result==null){
            throw new MyException("密码错误","/user/login");
        }

        if(userInfo_result.getRole()==1){
            throw new MyException("没有权限访问","/user/login");
        }

        //

        return userInfo_result;
    }

    @Override
    public List<UserInfo> findAllUser() {
        return userInfoMapper.selectAll();
    }

    @Override
    public int addUser(UserInfo userInfo) throws MyException{
        String username=userInfo.getUsername();
        int count=userInfoMapper.exsistUsername(username);
        if(count!=0){
            throw new MyException("用户名已存在","/user/add");
        }
        return userInfoMapper.insert(userInfo);
    }

    @Override
    public int delete(int id) {
        return userInfoMapper.deleteByPrimaryKey(id);
    }

    @Override
    public UserInfo findById(int id) {
        return userInfoMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateUser(UserInfo userInfo) {
        return userInfoMapper.updateByPrimaryKey(userInfo);
    }

}
