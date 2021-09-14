package com.human.app;

import java.util.ArrayList;

public interface iBooking {
	ArrayList<Bookinginfo> getAvailableBooking(String checkin, String checkout);
	ArrayList<Bookinginfo> getBookingList(String checkin, String checkout);
	void doAddBooking(int roomcode, int human, String checkin, String checkout, int total, String name, String mobile);
	void deleteBooking(int bookcode);
	void updateBooking(int bookcode, int human, String name, String mobile);

}
