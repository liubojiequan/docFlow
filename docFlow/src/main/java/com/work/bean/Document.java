package com.work.bean;

import java.util.Date;
import java.util.List;

/**
 * @author 
 *
 */
public class Document  {

	/**
	 * 
	 */
	private Integer id;
	
	private String cover;
	
	/**
	 * 消息摘要
	 */
	private String digest;

	public String getDigest() {
		return digest;
	}

	public void setDigest(String digest) {
		this.digest = digest;
	}

	public String getCover() {
		return cover;
	}

	public void setCover(String cover) {
		this.cover = cover;
	}

	public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}

	public Date getUpdate_time() {
		return update_time;
	}

	public void setUpdate_time(Date update_time) {
		this.update_time = update_time;
	}

	/**
	 * 公文状态
	 */
	private String state;

	/**
	 * 公文作者
	 */
	private String author;
	
	private Integer create_user;
	
	/**
	 * 附件
	 */
	private byte[] appendix;

	public byte[] getAppendix() {
		return appendix;
	}

	public void setAppendix(byte[] appendix) {
		this.appendix = appendix;
	}

	public Integer getCreate_user() {
		return create_user;
	}

	public void setCreate_user(Integer create_user) {
		this.create_user = create_user;
	}

	/**
	 * 公文内容
	 */
	private String content;
	
	private List<Review> results;

	public List<Review> getResults() {
		return results;
	}

	public void setResults(List<Review> results) {
		this.results = results;
	}

	/**
	 * 公文标题
	 */
	private String title;
	
	private Date create_time;

	private Date update_time;
	
	public void setId(Integer id){
		this.id=id;
	}

	public Integer getId(){
		return this.id;
	}

	public void setState(String state){
		this.state=state;
	}

	public String getState(){
		return this.state;
	}

	public void setAuthor(String author){
		this.author=author;
	}

	public String getAuthor(){
		return this.author;
	}

	public void setContent(String content){
		this.content=content;
	}

	public String getContent(){
		return this.content;
	}

	public void setTitle(String title){
		this.title=title;
	}

	public String getTitle(){
		return this.title;
	}

}