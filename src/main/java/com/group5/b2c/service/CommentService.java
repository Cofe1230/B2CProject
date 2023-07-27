package com.group5.b2c.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.group5.b2c.model.Board;
import com.group5.b2c.model.Comment;
import com.group5.b2c.repository.BoardRepository;
import com.group5.b2c.repository.CommentRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CommentService {
	private final CommentRepository commentRepository;
	private final BoardRepository boardRepository;
	
	public List<Comment> list(long bnum){
		return commentRepository.findByBnum(bnum);
	}
	@Transactional
	public void insert(Comment comment) {
		commentRepository.save(comment);
		Board b = boardRepository.findById(comment.getBoard().getBoardid()).get();
		b.setReplycnt(b.getReplycnt()+1);
	}
	
	 @Transactional
     public void delete(Comment comment) {
         Board board = comment.getBoard();
         if (board != null) {
             List<Comment> comments = board.getComments();
             comments.remove(comment);
             board.setReplycnt((long) comments.size());
             boardRepository.save(board); // 게시물의 댓글 개수 업데이트
         }
         commentRepository.delete(comment);
     }

}
