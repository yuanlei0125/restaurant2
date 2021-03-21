package com.j170502.cateringmange.service;

import com.j170502.cateringmange.dao.MemberMapper;
import com.j170502.cateringmange.entity.Member;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class MemberService {
    @Resource
    private MemberMapper memberMapper;
    public Member findMember(String memberTel){
        return  memberMapper.findMember(memberTel);
    }
    public int updateBalance(Member member){
        memberMapper.updateByPrimaryKeySelective(member);
            return 1;
    }
}
