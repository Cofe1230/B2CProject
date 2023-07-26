package com.group5.b2c.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group5.b2c.config.auth.PrincipalMember;
import com.group5.b2c.model.Board;
import com.group5.b2c.model.Comment;
import com.group5.b2c.service.BoardService;
import com.group5.b2c.service.CommentService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/reply/*")
@RequiredArgsConstructor
public class CommentController {
	private final CommentService commentService;
	
	@GetMapping("list/{num}")
	@ResponseBody
	public List<Comment> list(@PathVariable long num){
		List<Comment> clist = commentService.list(num);
		return clist;
	}
	@PostMapping("insert/{num}")
	public ResponseEntity<String> insert(@RequestBody Comment comment,@PathVariable long num,@AuthenticationPrincipal PrincipalMember principalMember) {
		Board b = new Board();
		b.setBoardid(num);
		comment.setBoard(b);
		comment.setMember(principalMember.getMember());
		commentService.insert(comment);
		return new ResponseEntity<String>("1111",HttpStatus.OK);
	}
}
