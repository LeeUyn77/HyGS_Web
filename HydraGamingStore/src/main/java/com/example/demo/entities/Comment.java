package com.example.demo.entities;
// Generated Dec 10, 2019, 8:57:54 PM by Hibernate Tools 5.2.12.Final

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Comment generated by hbm2java
 */
@Entity
@Table(name = "comment")
public class Comment implements java.io.Serializable {

	private Integer commentId;
	private Account account;
	private Product product;
	private String content;
	private boolean status;
	private int stars;

	public Comment() {
	}

	public Comment(Account account, Product product, String content, boolean status, int stars) {
		this.account = account;
		this.product = product;
		this.content = content;
		this.status = status;
		this.stars = stars;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "comment_id", unique = true, nullable = false)
	public Integer getCommentId() {
		return this.commentId;
	}

	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "account_id", nullable = false)
	public Account getAccount() {
		return this.account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "product_id", nullable = false)
	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@Column(name = "content", nullable = false, length = 250)
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(name = "status", nullable = false)
	public boolean isStatus() {
		return this.status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	@Column(name = "stars", nullable = false)
	public int getStars() {
		return this.stars;
	}

	public void setStars(int stars) {
		this.stars = stars;
	}

}
