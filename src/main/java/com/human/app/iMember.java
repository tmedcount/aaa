package com.human.app;

public interface iMember {
	void doSignin(String realname, String loginid, String passcode);
	int doCheckUser(String loginid, String passcode);
}
