package com.gguek.app.util;

public class PageVo {
    private int startPage;
    private int endPage;
    private boolean prev, next;
    private int total;
    private int currentPage;
    private int size = 10;
    private int pageCount = 5;

    public PageVo(int total, int currentPage) {
        this.total = total;
        this.currentPage = currentPage;

        this.endPage = (int) (Math.ceil(currentPage / (double) pageCount)) * pageCount;
        this.startPage = this.endPage - (pageCount - 1);

        int realEnd = (int) (Math.ceil((total * 1.0) / size));
        if (realEnd < this.endPage) {
            this.endPage = realEnd;
        }

        this.prev = this.startPage > 1;
        this.next = this.endPage < realEnd;
    }

    // 직접 만든 Getter들 (롬복 대신)
    public int getStartPage() { return startPage; }
    public int getEndPage() { return endPage; }
    public boolean isPrev() { return prev; }
    public boolean isNext() { return next; }
    public int getTotal() { return total; }
    public int getCurrentPage() { return currentPage; }
    public int getSize() { return size; }
}