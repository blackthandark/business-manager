package com.neuedu.pojo;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.util.List;
@Component
@Scope("session")
public class PageModel<T> {
    private int currentPage;
    private int totalPages;
    private int pageSize;
    private List<T> pageList;

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public List<T> getPageList() {
        return pageList;
    }

    public void setPageList(List<T> pageList) {
        this.pageList = pageList;
    }





}
