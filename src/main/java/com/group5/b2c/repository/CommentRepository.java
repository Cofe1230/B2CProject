package com.group5.b2c.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.group5.b2c.model.Comment;

public interface CommentRepository extends JpaRepository<Comment, Integer> {
	
	@Query("select sc from comment sc join fetch sc.board where bnum=?1")
	public List<Comment> findByBnum(long bnum);
}
