package com.j170502.cateringmange.service;

import com.j170502.cateringmange.dao.JournalMapper;
import com.j170502.cateringmange.entity.Journal;
import com.j170502.cateringmange.entity.User;
import com.j170502.cateringmange.util.GrandToInt;
import com.j170502.cateringmange.util.PathToOptionMap;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class JournalService {
    @Resource
    private JournalMapper journalMapper;
    public List<Journal> findAll(){
        return journalMapper.findAll();
    }
    public void saveLog(String url,User user){
        String value= PathToOptionMap.PATH_OPTION.get(url);
        if(value!=null){
            Journal journal=new Journal();
            journal.setJournalText(value);
            if(user!=null){
                journal.setUserId(user.getUserId());
                journal.setGrandId(GrandToInt.NORMAL);
            }else{
                journal.setGrandId(GrandToInt.UNKNOWN);
            }
            Date date =new Date();
            journal.setJournalTime(date);
            journalMapper.insert(journal);
        }
    }
    public List<Journal> findAllByName(int grandId, int userId){
        String sql = "";
        if(grandId ==0 && userId==0 ){
            return journalMapper.findAll();
        }else if(grandId >0 &&userId==0){
            sql = "where grand_id = "+grandId;
        }else if(grandId==0 && userId>0){
            sql= " where user_id = "+userId;
        }else {
            sql=" where user_id = "+userId+" and grand_id =" + grandId;
        }
        return journalMapper.findBySql(sql);
    }
}
