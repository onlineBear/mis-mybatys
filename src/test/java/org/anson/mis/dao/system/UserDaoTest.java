package org.anson.mis.dao.system;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.anson.mis.constant.table.system.UserTable;
import org.anson.mis.entity.Example;
import org.anson.mis.entity.system.User;
import org.anson.mis.util.ID.IdWorker;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class UserDaoTest {
    @Autowired
    private UserDao dao;

    private User user = new User();
    private List<User> userList = new ArrayList<User>();

    private ObjectMapper objectMapper = new ObjectMapper();

    @Test
    public void selById() throws Exception{
        User user = dao.selById(1049243990290857984L);

        System.out.println(objectMapper.writeValueAsString(user));
    }

    @Test
    //@Transactional
    public void insert(){
        for(int i=0;i<100;i++){
            IdWorker idWorker = new IdWorker(0, 0);
            user.setId(idWorker.nextId());
            user.setEmail("email");
            user.setMobile("137xxxxxxxx");
            user.setName("name");
            user.setNo(String.valueOf(Math.random()));
            user.setPassword("password");
            user.setProfilePhotoUrl("");
            user.setLastUpdateTime(new Date());
            user.setPersonalStatement("");

            dao.insert(user);

            System.out.println("success");
        }
    }

    @Test
    public void selByExample() throws Exception{
        Example example = new Example();
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo(UserTable.NAME, "name");
        userList = dao.selByExample(example);

        //System.out.println(objectMapper.writeValueAsString(userList));
    }

    @Test
    public void selByIdList() throws Exception{
        selByExample();

        for(User one : userList){
            user.setEmail("");
            user.setMobile("");
            user.setName("");
            user.setNo("");
            user.setPassword("");
            user.setProfilePhotoUrl("");
            user.setLastUpdateTime(null);
            user.setPersonalStatement("");
        }

        List<User> rsList = dao.selByIdList(userList);

        System.out.println(objectMapper.writeValueAsString(rsList));
    }
}
