package com.group5.b2c.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.group5.b2c.model.Book;
import com.group5.b2c.model.Rental;
import com.group5.b2c.repository.BookRepository;
import com.group5.b2c.repository.RentalRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BookService {
	private final BookRepository bookRepository;
	private final RentalRepository rentalRepository;
	
	public void insert(Book book, String uploadFolder) {
		UUID uuid = UUID.randomUUID();
		MultipartFile f = book.getUpload();
		String uploadFileName = "";
		
		if(!f.isEmpty()) {
			uploadFileName = uuid.toString() + "_" + f.getOriginalFilename();
			File saveFile = new File(uploadFolder, uploadFileName);
			try {
				f.transferTo(saveFile);
				book.setImg(uploadFileName);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		bookRepository.save(book);
	}
	
	
	public Page<Book> list(String keyword, Pageable pageable, String location){
		Page<Book> list = null;
		if(!location.equals("")) {
			list=bookRepository.findByLocation(location,pageable);
		}else if(keyword.equals("")) {
			list = bookRepository.findAll(pageable);
		}else {
			list=bookRepository.findByTitleContainingOrAuthorContainingOrCategoryContaining(keyword, keyword, keyword, pageable);
		}
		return list;
	}
	
	public void Insert(Book book) {
		UUID uuid = UUID.randomUUID();
		MultipartFile f = book.getUpload();
		String uploadFileName = "";
		
		if(!f.isEmpty()) {
			uploadFileName = uuid.toString() + "_" + f.getOriginalFilename();
			File saveFile = new File(uploadFileName);
			try {
				f.transferTo(saveFile);
				book.setImg(uploadFileName);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		bookRepository.save(book);
	}
	
	public Book bookdetail(long num) {
		Book b = bookRepository.findById(num).get();
		return b;
	}
	
	public void bookdel(long num) {
		System.out.println("삭제");
		bookRepository.deleteById(num);
	}
	@Transactional
	public void update(Book book, String uploadFolder,long bookid) {
		UUID uuid = UUID.randomUUID();
		MultipartFile f = book.getUpload();
		String uploadFileName = "";
		
		if(!f.isEmpty()) {
			uploadFileName = uuid.toString() + "_" + f.getOriginalFilename();
			File saveFile = new File(uploadFolder, uploadFileName);
			try {
				f.transferTo(saveFile);
				book.setImg(uploadFileName);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		Book updatebook = bookRepository.findById(bookid).get();
		updatebook.setAuthor(book.getAuthor());
		updatebook.setCategory(book.getCategory());
		updatebook.setContent(book.getContent());
		updatebook.setImg(book.getImg());
		updatebook.setTitle(book.getTitle());
	}
	
	public long getCount(String keyword,String location) {
		long count = 0;
		if(!location.equals("")) {
			count=bookRepository.countByLocation(location);
		}else if(keyword.equals("")) {
			count = bookRepository.count();
		}else {
			count=bookRepository.countByTitleContainingOrAuthorContainingOrCategoryContaining(keyword, keyword, keyword);
		}
		return count;
	}
	
}
	
	
	

