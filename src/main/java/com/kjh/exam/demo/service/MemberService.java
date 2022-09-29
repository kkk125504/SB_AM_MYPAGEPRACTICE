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
		// 로그인아이디 중복체크
		Member existsMember = getMemberByLoginId(loginId);
		if (existsMember != null) {
			return -1;
		}
		// 이름과 이메일 중복체크
		existsMember = getMemberByNameAndEmail(name, email);
		if(existsMember != null) {
			return -2;
		}
		memberRepository.doJoin(loginId, loginPw, name, nickname, cellphoneNum, email);
		int id = memberRepository.getLastInsertId();
		return id;
	}

	private Member getMemberByLoginId(String loginId) {
		Member member = memberRepository.getMemberByLoginId(loginId);
		return member;
	}

	public Member getMemberById(int id) {
		Member member = memberRepository.getMemberById(id);
		return member;
	}

	private Member getMemberByNameAndEmail(String name, String email) {
		Member member = memberRepository.getMemberByNameAndEmail(name, email);
		return member;
	}
}
