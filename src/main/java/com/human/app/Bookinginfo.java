package com.human.app;

public class Bookinginfo {
	private int bookcode;
	private int roomcode;
	private int human;
	private String checkin;
	private String checkout;
	private int total;
	private String mobile;
	private String name;
	
	public Bookinginfo() {
		// TODO Auto-generated constructor stub
	}
		
	public Bookinginfo(int bookcode, int roomcode, int human, String checkin, String checkout, int total, String mobile,
			String name) {
		this.bookcode = bookcode;
		this.roomcode = roomcode;
		this.human = human;
		this.checkin = checkin;
		this.checkout = checkout;
		this.total = total;
		this.mobile = mobile;
		this.name = name;		
	}

	public int getBookcode() {
		return bookcode;
	}
	public void setBookcode(int bookcode) {
		this.bookcode = bookcode;
	}
	public int getRoomcode() {
		return roomcode;
	}
	public void setRoomcode(int roomcode) {
		this.roomcode = roomcode;
	}
	public int getHuman() {
		return human;
	}
	public void setHuman(int human) {
		this.human = human;
	}
	public String getCheckin() {
		return checkin;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public String getCheckout() {
		return checkout;
	}
	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	
	
	
	
	
}
