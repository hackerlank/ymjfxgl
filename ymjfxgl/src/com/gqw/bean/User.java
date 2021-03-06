package com.gqw.bean;

import java.util.Date;

import javax.persistence.Transient;

public class User {
	private String id;
	private int pid;
	private String username;
	private String password;
	private int identity;
	private String seondpassword;
	private String thirdpassword;
	private int rengounumber;
	private String tuijianrennumber;
	private String baodancenternumber;
	private String truename;
	private String phonenumber;
	private String shenfenzhengnumber;
	private String adress;
	private String bankmessage;
	private String bankzhihang;
	private String bankfenlichu;
	private String kaihuname;
	private String banknumber;
	private Date opentime;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getIdentity() {
		return identity;
	}
	public void setIdentity(int identity) {
		this.identity = identity;
	}
	public String getSeondpassword() {
		return seondpassword;
	}
	public void setSeondpassword(String seondpassword) {
		this.seondpassword = seondpassword;
	}
	public String getThirdpassword() {
		return thirdpassword;
	}
	public void setThirdpassword(String thirdpassword) {
		this.thirdpassword = thirdpassword;
	}
	public int getRengounumber() {
		return rengounumber;
	}
	public void setRengounumber(int rengounumber) {
		this.rengounumber = rengounumber;
	}
	public String getTuijianrennumber() {
		return tuijianrennumber;
	}
	public void setTuijianrennumber(String tuijianrennumber) {
		this.tuijianrennumber = tuijianrennumber;
	}
	public String getBaodancenternumber() {
		return baodancenternumber;
	}
	public void setBaodancenternumber(String baodancenternumber) {
		this.baodancenternumber = baodancenternumber;
	}
	public String getTruename() {
		return truename;
	}
	public void setTruename(String truename) {
		this.truename = truename;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getShenfenzhengnumber() {
		return shenfenzhengnumber;
	}
	public void setShenfenzhengnumber(String shenfenzhengnumber) {
		this.shenfenzhengnumber = shenfenzhengnumber;
	}
	public String getAdress() {
		return adress;
	}
	public void setAdress(String adress) {
		this.adress = adress;
	}
	public String getBankmessage() {
		return bankmessage;
	}
	public void setBankmessage(String bankmessage) {
		this.bankmessage = bankmessage;
	}
	public String getBankzhihang() {
		return bankzhihang;
	}
	public void setBankzhihang(String bankzhihang) {
		this.bankzhihang = bankzhihang;
	}
	public String getBankfenlichu() {
		return bankfenlichu;
	}
	public void setBankfenlichu(String bankfenlichu) {
		this.bankfenlichu = bankfenlichu;
	}
	public String getKaihuname() {
		return kaihuname;
	}
	public void setKaihuname(String kaihuname) {
		this.kaihuname = kaihuname;
	}
	public String getBanknumber() {
		return banknumber;
	}
	public void setBanknumber(String banknumber) {
		this.banknumber = banknumber;
	}
	
	public Date getOpentime() {
		return opentime;
	}
	public void setOpentime(Date opentime) {
		this.opentime = opentime;
	}
	public User() {
		super();
	}
	public User(String id, int pid, String username, String password,
			int identity, String seondpassword, String thirdpassword,
			int rengounumber, String tuijianrennumber,
			String baodancenternumber, String truename, String phonenumber,
			String shenfenzhengnumber, String adress, String bankmessage,
			String bankzhihang, String bankfenlichu, String kaihuname,
			String banknumber, Date opentime) {
		super();
		this.id = id;
		this.pid = pid;
		this.username = username;
		this.password = password;
		this.identity = identity;
		this.seondpassword = seondpassword;
		this.thirdpassword = thirdpassword;
		this.rengounumber = rengounumber;
		this.tuijianrennumber = tuijianrennumber;
		this.baodancenternumber = baodancenternumber;
		this.truename = truename;
		this.phonenumber = phonenumber;
		this.shenfenzhengnumber = shenfenzhengnumber;
		this.adress = adress;
		this.bankmessage = bankmessage;
		this.bankzhihang = bankzhihang;
		this.bankfenlichu = bankfenlichu;
		this.kaihuname = kaihuname;
		this.banknumber = banknumber;
		this.opentime = opentime;
	}
	
}
