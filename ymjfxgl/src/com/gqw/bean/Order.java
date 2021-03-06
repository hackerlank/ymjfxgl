package com.gqw.bean;

import java.util.Date;

public class Order {
	private String ordernumber;
	private String name;
	private int numbers;
	private float money;
	private Date ordertime;
	private String shouhuoren;
	private String shouhuoaddress;
	private String phonenumber;
	private String status;
	private String wuliugongsi;
	private String wuliudanhao;
	private String chaxunaddress;
	private String loginid;
	public Order() {
		super();
	}
	
	public Order(String ordernumber, String name, int numbers, float money,
			Date ordertime, String shouhuoren, String shouhuoaddress,
			String phonenumber, String status, String wuliugongsi,
			String wuliudanhao, String chaxunaddress, String loginid) {
		super();
		this.ordernumber = ordernumber;
		this.name = name;
		this.numbers = numbers;
		this.money = money;
		this.ordertime = ordertime;
		this.shouhuoren = shouhuoren;
		this.shouhuoaddress = shouhuoaddress;
		this.phonenumber = phonenumber;
		this.status = status;
		this.wuliugongsi = wuliugongsi;
		this.wuliudanhao = wuliudanhao;
		this.chaxunaddress = chaxunaddress;
		this.loginid = loginid;
	}

	public String getLoginid() {
		return loginid;
	}

	public void setLoginid(String loginid) {
		this.loginid = loginid;
	}

	public String getOrdernumber() {
		return ordernumber;
	}
	public void setOrdernumber(String ordernumber) {
		this.ordernumber = ordernumber;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getNumbers() {
		return numbers;
	}
	public void setNumbers(int numbers) {
		this.numbers = numbers;
	}
	public float getMoney() {
		return money;
	}
	public void setMoney(float money) {
		this.money = money;
	}
	public Date getOrdertime() {
		return ordertime;
	}
	public void setOrdertime(Date ordertime) {
		this.ordertime = ordertime;
	}
	public String getShouhuoren() {
		return shouhuoren;
	}
	public void setShouhuoren(String shouhuoren) {
		this.shouhuoren = shouhuoren;
	}
	public String getShouhuoaddress() {
		return shouhuoaddress;
	}
	public void setShouhuoaddress(String shouhuoaddress) {
		this.shouhuoaddress = shouhuoaddress;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getWuliugongsi() {
		return wuliugongsi;
	}
	public void setWuliugongsi(String wuliugongsi) {
		this.wuliugongsi = wuliugongsi;
	}
	public String getWuliudanhao() {
		return wuliudanhao;
	}
	public void setWuliudanhao(String wuliudanhao) {
		this.wuliudanhao = wuliudanhao;
	}
	public String getChaxunaddress() {
		return chaxunaddress;
	}
	public void setChaxunaddress(String chaxunaddress) {
		this.chaxunaddress = chaxunaddress;
	}
	
	
	
}
