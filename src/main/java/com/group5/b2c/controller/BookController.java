package com.group5.b2c.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group5.b2c.config.auth.PrincipalMember;
import com.group5.b2c.dto.BookFormDTO;
import com.group5.b2c.dto.PageVO;
import com.group5.b2c.model.Book;
import com.group5.b2c.repository.MemberRepository;
import com.group5.b2c.service.BookService;
import com.group5.b2c.service.RentalService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/book/*")
@RequiredArgsConstructor
public class BookController {
	private final BookService bookService;
	private final MemberRepository memberRepository;
	private final RentalService rentalService;
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("insert")
	public String insert() {
		return "/book/insert";
	}
	
	@PostMapping("insert")
	public String insert(@Valid BookFormDTO bookFormDTO,BindingResult bindingResult,  @AuthenticationPrincipal PrincipalMember principalMember, HttpSession session) {
		if(bindingResult.hasErrors()) {
			return "/book/insert";
		}
		String uploadFolder = session.getServletContext().getRealPath("/") + "\\resource\\img";
		Book book = Book.createBook(bookFormDTO,principalMember.getMember());
		bookService.insert(book, uploadFolder);
		return "redirect:/book/list";
	}
	
	
	@GetMapping("list")
	public String list(Model model, @RequestParam(defaultValue = "") String keyword,@RequestParam(defaultValue = "") String location,@PageableDefault(size=9, sort="bookid", direction=Direction.DESC)Pageable pageable) {
		int currentPage = pageable.getPageNumber()+1;
		int count = (int)bookService.getCount(keyword,location);
		int pageSize=9;
		int pageStart=(currentPage-1)*pageSize;
		PageVO page = new PageVO(count, pageSize, currentPage);
		Page<Book> list = bookService.list(keyword,pageable,location);
		model.addAttribute("lists", list);
		model.addAttribute("count",count);
		model.addAttribute("p", page);
		model.addAttribute("keyword", keyword);
		return "/book/booklist";
	}
	@GetMapping ("bookdetail/{num}")
	public String Detail(@PathVariable long num, Model model) {
		model.addAttribute("book",bookService.bookdetail(num));
		Book b = bookService.bookdetail(num);
		return "/book/bookdetail";
	}
	
	@DeleteMapping("bookdel/{num}")
    @ResponseBody
    public String bookdel(@PathVariable long num) {
    	bookService.bookdel(num);
    	return "success";
    }
	@GetMapping("bookupdate/{num}")
	public String bookupdate(@PathVariable long num,Model model) {
		model.addAttribute("book", bookService.bookdetail(num));
		return "/book/bookupdate";
	}
	@PostMapping("bookupdate")
	public String bookupdate(@Valid BookFormDTO bookFormDTO,BindingResult bindingResult,  @AuthenticationPrincipal PrincipalMember principalMember, HttpSession session,Model model,@RequestParam long bookid) {
		if(bindingResult.hasErrors()) {
			model.addAttribute("book", bookFormDTO);
			return "/book/bookupdate";
		}
		String uploadFolder = session.getServletContext().getRealPath("/") + "\\resource\\img";
		Book book = Book.createBook(bookFormDTO,principalMember.getMember());
		bookService.update(book, uploadFolder,bookid);
		return "redirect:/book/list";
	}
}
