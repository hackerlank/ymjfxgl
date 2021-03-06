package com.gqw.bean;
/**
 * 用于商品列表分页
 * @author Administrator
 *
 */
public class Pager {
	private int pageIndex;//当前页
	private int totalPage;//总页数
	private String proName;
	private String ProCategory;
	private int prev;//上一页，jsp用
	private int next;//下一页，jsp用
	
	
	public int getPrev() {
		return prev;
	}
	public void setPrev(int prev) {
		this.prev = prev;
	}
	public int getNext() {
		return next;
	}
	public void setNext(int next) {
		this.next = next;
	}
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public String getProCategory() {
		return ProCategory;
	}
	public void setProCategory(String proCategory) {
		ProCategory = proCategory;
	}
	public Pager() {
		super();
	}
	public Pager(int pageIndex, int totalPage, String proName,
			String proCategory) {
		super();
		this.pageIndex = pageIndex;
		this.totalPage = totalPage;
		this.proName = proName;
		ProCategory = proCategory;
	}
	
	
}
