package com.human.app;

import java.util.ArrayList;

public interface iBooking {
	ArrayList<Bookinginfo> getBookingList();
	void doAddBooking(int roomcode, int human, String checkin, String checkout, int total, String name, String mobile);
}
