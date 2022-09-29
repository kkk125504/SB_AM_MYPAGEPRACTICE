package com.kjh.exam.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kjh.exam.demo.repository.MemberRepository;
import com.kjh.exam.demo.vo.Member;

@Service
public class MemberService {

	MemberRepository memberRepository;

	@Autowired
	MemberService(MemberRepository memberRepository) {
		this.memberRepository = memberRepository;
	}

	public int doJoin(String loginId, String loginPw, String name, String nickname, String cellphoneNum, String email) {
		memberRepository.doJoin(loginId, loginPw, name, nickname, cellphoneNum, email);
		int id = memberRepository.getLastInsertId();
		return id;
	}

	public Member getMemberById(int id) {
	Member member = memberRepository.getMemberById(id);
		return member;
	}

}
