package org.anson.mis.dao.system;


import org.anson.mis.dao.BaseDao;
import org.anson.mis.entity.system.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserDao extends BaseDao<User> {
}
