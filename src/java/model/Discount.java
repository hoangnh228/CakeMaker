/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;

/**
 *
 * @author Orange
 */
public class Discount {
    
    private int id;
    private String title;
    private String content;
    private int percent;
    private String start_date;
    private String end_date;

    public Discount() {
    }

    public Discount(int id, String title, String content, int percent, String start_date, String end_date) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.percent = percent;
        this.start_date = start_date;
        this.end_date = end_date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getPercent() {
        return percent;
    }

    public void setPercent(int percent) {
        this.percent = percent;
    }

    public String getStart_date() {
        return start_date;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public String getEnd_date() {
        return end_date;
    }

    public void setEnd_date(String end_date) {
        this.end_date = end_date;
    }
    
}
