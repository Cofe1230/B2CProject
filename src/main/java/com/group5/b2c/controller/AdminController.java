package com.group5.b2c.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.group5.b2c.service.MemberService;
import com.group5.b2c.service.RentalService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin/*")
@RequiredArgsConstructor
public class AdminController {
	private final MemberService memberService;
	private final RentalService rentalService;
	//전체 회원 정보
	@GetMapping("/admin/memberlist")
	public String list(Model model) {
		model.addAttribute("count",memberService.getCount());
		model.addAttribute("member",memberService.list());
		return "/member/memberlist"; 
	}
	//미납 정보 리스트
	@GetMapping("/admin/overduelist")
	public String overduelist(Model model) {
		model.addAttribute("count", rentalService.getOverdueCount());
		model.addAttribute("rental", rentalService.overdueList());
		return "/member/overduelist";
	}
}
