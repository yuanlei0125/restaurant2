package com.j170502.cateringmange.service;

import com.j170502.cateringmange.dao.TablesMapper;
import com.j170502.cateringmange.entity.Tables;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class TablesService {
    @Resource
    private TablesMapper tablesMapper;
    public List<Tables> findAll(){
        return tablesMapper.findAll();
    }
    public List<Tables> findTables(int place,int state){
        String sql = "";
        boolean allPlace = place==0;
        boolean allState = state==0;
        //同为全部
        if(allPlace&&allState){
            return this.findAll();
        //否则当不是所有状态
        }else if(allPlace){
            sql = "where state_id ="+state;
        //否则当不是
        }else if(allState){
            sql="where place_id ="+place;
        }else{
            sql = "where state_id = "+state +" and place_id = "+place;
        }
        System.out.println(sql+"-----------1");
        return tablesMapper.findByPlaceAndState(sql);
    }
    public Tables findById(int tableId){
        return  tablesMapper.selectByPrimaryKey(tableId);
    }
    public void save(Tables tables){
        tablesMapper.save(tables);
    }
    public void delete(Integer id){
        tablesMapper.deleteByPrimaryKey(id);
    }
    public void update(Tables tables){
        tablesMapper.updateByPrimaryKey(tables);
    }
    public Tables findById(Integer id){
        return tablesMapper.selectByPrimaryKey(id);
    }
    public List<Tables> findAllBox(){
        return tablesMapper.findAllBox();
    }
    public List<Tables> findAllHall(){
        return tablesMapper.findAllHall();
    }
    public void saveBox(Tables tables){
        tablesMapper.saveBox(tables);
    }
    public void saveHall(Tables tables){
        tablesMapper.saveHall(tables);
    }
}
