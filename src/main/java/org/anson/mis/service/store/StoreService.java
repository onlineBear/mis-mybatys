package org.anson.mis.service.store;

import org.anson.mis.dao.store.StoreDao;
import org.anson.mis.entity.web.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StoreService {
    @Autowired
    private StoreDao dao;

    public Response getById(Integer id){
        return Response.ok(dao.findById(id));
    }
}
