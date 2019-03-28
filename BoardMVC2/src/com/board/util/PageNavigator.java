package com.board.util;

public class PageNavigator {

	private int pageSize; // �� �������� ����� �Խñ� ��
	private int pageBlock; // �� ȭ�鿡 ��µ� ������ ��
	private int currentPage; // ���� ������ ��ȣ
	private int totalCount; // ��ü �Խñ� ��
	private int totalPage; // ��ü ������ ��
	private int startPage; // ���� ������ ��ȣ
	private int endPage; // ������ ������ ��ȣ
	private int boardNum;
	private int startRow;
	private int endRow;

	public PageNavigator() {
		this.pageSize = 10;
		this.pageBlock = 10;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageBlock() {
		return pageBlock;
	}

	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}

	public void makePaging() {

		if (this.currentPage == 0)
			this.currentPage = 1;

		this.startRow = (this.currentPage - 1) * this.pageSize + 1;
		this.endRow = this.currentPage * this.pageSize;
		this.boardNum = this.totalCount - (this.currentPage - 1) * this.pageSize;

		if (this.totalCount > 0) {

			this.totalPage = this.totalCount / this.pageSize + (this.totalCount % this.pageSize == 0 ? 0 : 1);
			if (currentPage % pageBlock != 0) {
				this.startPage = this.currentPage / this.pageBlock * this.pageBlock + 1;
			} else {
				this.startPage = this.currentPage / (this.pageBlock - 1) * this.pageBlock;
			}

			this.endPage = this.startPage + this.pageSize - 1;
			if (this.endPage > this.totalPage)
				this.endPage = this.totalPage;
		}
	}

}
