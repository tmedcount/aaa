package com.human.app;

import java.util.ArrayList;

public interface iRoom {
	ArrayList<Roominfo> getRoomList();
	ArrayList<Roomtype> getRoomType();
	void doDeleteRoom(int roomcode);
	void doAddRoom(String roomname, int type, int howmany, int howmuch);
	void doUpdateRoom(int roomcode, String roomname, int type, int howmany, int howmuch);
	
}
