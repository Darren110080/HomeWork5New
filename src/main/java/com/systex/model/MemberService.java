package com.systex.model;




import com.systex.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class MemberService {

    @Autowired
    private MemberRepository memberRepository;

    // 查找用戶名的方法
    public Member findMemberByUsername(String username) {
        
    	return memberRepository.findByUsername(username);
    }

    // 保存會員
    public void saveMember(Member member) {
        memberRepository.save(member);
    }

 
}

