package org.anson.mis.dao.store;

import org.anson.mis.entity.store.Store;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StoreDao {
    public Store findById(Integer storeId);
}
