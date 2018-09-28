package org.anson.mis.dao.system;

import org.anson.mis.entity.system.Menu;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MenuDao {
    public Menu selectByPrimaryKey(Long id);
    public List<Menu> selectByExample(Menu example);
}
