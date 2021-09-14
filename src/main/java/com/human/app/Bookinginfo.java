package com.human.app;

public class Bookinginfo {
	private int bookcode;
	private String roomname;
	private String typename;
	private int human;
	private int howmany;
	private String checkin;
	private String checkout;
	private int total;
	private String mobile;
	private String name;
	private int roomcode;
	private int howmuch;
	
	public Bookinginfo() {
		// TODO Auto-generated constructor stub
	}

	public Bookinginfo(int bookcode, String roomname, String typename, int human, int howmany, String checkin,
			String checkout, int total, String mobile, String name, int roomcode, int howmuch) {
		this.bookcode = bookcode;
		this.roomname = roomname;
		this.typename = typename;
		this.human = human;
		this.howmany = howmany;
		this.checkin = checkin;
		this.checkout = checkout;
		this.total = total;
		this.mobile = mobile;
		this.name = name;
		this.roomcode = roomcode;
		this.howmuch = howmuch;
	}

	public int getBookcode() {
		return bookcode;
	}

	public void setBookcode(int bookcode) {
		this.bookcode = bookcode;
	}

	public String getRoomname() {
		return roomname;
	}

	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}

	public String getTypename() {
		return typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}

	public int getHuman() {
		return human;
	}

	public void setHuman(int human) {
		this.human = human;
	}

	public int getHowmany() {
		return howmany;
	}

	public void setHowmany(int howmany) {
		this.howmany = howmany;
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

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getRoomcode() {
		return roomcode;
	}

	public void setRoomcode(int roomcode) {
		this.roomcode = roomcode;
	}

	public int getHowmuch() {
		return howmuch;
	}

	public void setHowmuch(int howmuch) {
		this.howmuch = howmuch;
	}
	
	
}
