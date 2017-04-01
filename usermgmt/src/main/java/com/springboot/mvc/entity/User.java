package com.springboot.mvc.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.search.annotations.Analyze;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Index;
import org.hibernate.search.annotations.Indexed;
import org.hibernate.search.annotations.Store;

@Entity
@Table(name = "usertbl")
@Indexed
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int userId;

	@Field(index = Index.YES, analyze = Analyze.YES, store = Store.NO)
	private String fname;

	@Field(index = Index.YES, analyze = Analyze.YES, store = Store.NO)
	private String lname;

	@Field(index = Index.YES, analyze = Analyze.YES, store = Store.NO)
	private String address;

	@Field(index = Index.YES, analyze = Analyze.YES, store = Store.NO)
	private String contact;

	public User(int userId, String fname, String lname, String address, String contact) {
		super();
		this.userId = userId;
		this.fname = fname;
		this.lname = lname;
		this.address = address;
		this.contact = contact;
	}

	public User(String fname, String lname, String address, String contact) {
		super();
		this.fname = fname;
		this.lname = lname;
		this.address = address;
		this.contact = contact;
	}

	public User() {
		super();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "User [userId=" + userId + ", fname=" + fname + ", lname=" + lname + ", address=" + address
				+ ", contactNo=" + contact + "]";
	}

	/**
	 * @return the userId
	 */
	public int getUserId() {
		return userId;
	}

	/**
	 * @param userId
	 *            the userId to set
	 */
	public void setUserId(int userId) {
		this.userId = userId;
	}

	/**
	 * @return the fname
	 */
	public String getFname() {
		return fname;
	}

	/**
	 * @param fname
	 *            the fname to set
	 */
	public void setFname(String fname) {
		this.fname = fname;
	}

	/**
	 * @return the lname
	 */
	public String getLname() {
		return lname;
	}

	/**
	 * @param lname
	 *            the lname to set
	 */
	public void setLname(String lname) {
		this.lname = lname;
	}

	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * @param address
	 *            the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * @return the contactNo
	 */
	public String getContact() {
		return contact;
	}

	/**
	 * @param contactNo
	 *            the contactNo to set
	 */
	public void setContact(String contact) {
		this.contact = contact;
	}

}
