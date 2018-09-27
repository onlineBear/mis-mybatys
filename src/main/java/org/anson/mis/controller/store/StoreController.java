package org.anson.mis.controller.store;

import org.anson.mis.entity.web.Response;
import org.anson.mis.service.store.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/store", method = RequestMethod.GET)
public class StoreController {
    @Autowired
    private StoreService service;

    @RequestMapping("/findById")
    public Response findById(Integer id){
        return service.getById(id);
    }
}
