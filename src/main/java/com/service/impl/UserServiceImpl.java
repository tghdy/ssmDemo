package com.service.impl;
import com.dao.IUserDao;
import com.model.user;
import org.springframework.stereotype.Service;
import com.service.IUserService;
import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("userService")
public class UserServiceImpl implements IUserService {

    @Resource
    private IUserDao userDao;

    public user selectUser(int id){
        return userDao.selectUser(id);
    }

    public int userLogin(user u) {
        List<Map<String, Object>> list = userDao.userLogin(u);
        int i;
        for(i=0;i<list.size();i++){
            String name = list.get(i).get("name").toString();
            String psw = list.get(i).get("password").toString();
            if(name.equals(u.getName())){
                if(psw.equals(u.getPassword())){
                    return 1;
                }
                return 2;
            }
        }
        return 0;
    }
}
