package com.group5.b2c.dto;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class PageVO {
	private int totPage;
	private int blockPage;
	private int startPage;
	private int endPage;
	private int currentPage;
	
	public PageVO(int count, int pageSize, int currentPage) {
		totPage=count/pageSize +(count%pageSize==0?0:1);
		blockPage=5;
		startPage=((currentPage-1)/blockPage)*blockPage+1;
		endPage = startPage+blockPage-1;
		if(endPage>totPage) endPage=totPage;
		
		setEndPage(endPage);
		setStartPage(startPage);
		setBlockPage(blockPage);
		setCurrentPage(currentPage);
		setTotPage(totPage);
	}
}
