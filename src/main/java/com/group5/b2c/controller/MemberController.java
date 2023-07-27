package com.group5.b2c.controller;


import javax.validation.Valid;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group5.b2c.dto.MemberDTO;
import com.group5.b2c.model.Member;
import com.group5.b2c.service.MemberService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MemberController {
	private final MemberService memberService;
	private final BCryptPasswordEncoder encoder;

	
	@GetMapping("/member/join")
	public String join() {
		return "/member/join";
	}	

	@PostMapping("/member/join")
	public String join(@Valid MemberDTO memberdto, BindingResult bindingResult, Model model) {
		System.out.println("/member/join");
		if(bindingResult.hasErrors()) {
			model.addAttribute("member", memberdto);
			return "/member/join";
		}
		try {
			Member member = Member.createMember(memberdto, encoder);
			memberService.insert(member);
		}catch (IllegalStateException e){
            model.addAttribute("errorMessage", e.getMessage());
            model.addAttribute("member", memberdto);
            return "/member/join";
        }
		return "redirect:/member/login"; 
	}
	
	@GetMapping("/member/login")
	public String login() {
		return "/member/login";
	}
	@GetMapping("/member/login/error")
	public String loginError(Model model) {
		model.addAttribute("loginErrorMsg", "아이디나 비밀번호를 확인해주세요");
		return "/member/login";
	}
	
	@GetMapping("/member/memberview/{username}")
	public String view(@PathVariable String username, Model model) {		
		Member member = memberService.view(username);
		model.addAttribute("member",member);
		System.out.println(member);
		return "/member/memberview"; 
	}
	

	@PostMapping("/member/memberupdate")
	public String update(@Valid MemberDTO memberdto, 
			BindingResult bindingResult, Model model) {
		System.out.println("post update");
		if(bindingResult.hasErrors()) {
			System.out.println("post update error");
			
			model.addAttribute("member", memberdto);
			return "/member/memberview";
		}
		try {
			System.out.println("post update 1");
			Member member = Member.createMember(memberdto, encoder);
			memberService.update(member);
		}catch (IllegalStateException e){
            model.addAttribute("errorMessage", e.getMessage());
            return "/member/memberview";
        }
		return "/member/memberview";
	}


	@DeleteMapping("/member/memberdelete/{username}")
	@ResponseBody
	public String delete(@PathVariable String username) {
		System.out.println("delete 1:"+username);
		memberService.delete(username);
		return "success"; 
	}
}
