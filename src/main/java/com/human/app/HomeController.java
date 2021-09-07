package com.human.app;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	/*
	 * @RequestMapping(value = "/", method = RequestMethod.GET) public String
	 * home(Locale locale, Model model) {
	 * logger.info("Welcome home! The client locale is {}.", locale);
	 * 
	 * Date date = new Date(); DateFormat dateFormat =
	 * DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
	 * 
	 * String formattedDate = dateFormat.format(date);
	 * 
	 * model.addAttribute("serverTime", formattedDate );
	 * 
	 * return "home"; }
	 */
	
	@RequestMapping(value="/")
	public String Home() {
		return "home";
	}
		
	@RequestMapping("/newbie")
	public String newbie() {
		return "newbie";
	}
	
	  @RequestMapping(value="/check_user", method=RequestMethod.POST)
	  public String checkUser(HttpServletRequest hsr, Model model) {
		  String uid = hsr.getParameter("loginid");
		  String pass = hsr.getParameter("passcode");
		  
		  iMember member = sqlSession.getMapper(iMember.class);
		  int n = member.doCheckUser(uid, pass);
		  
		  if(n>0) {
			  HttpSession session = hsr.getSession();
			  session.setAttribute("loginid", uid);
			  
			  return "redirect:/booking";
		  } else {
			  return "home";
		  }

	  }
	
	  @RequestMapping(value="/booking", method=RequestMethod.GET)
	  public String booking(HttpServletRequest hsr,  Model model) {
		  HttpSession session = hsr.getSession();
		  
		  String loginid = (String)session.getAttribute("loginid");
		  if (loginid.equals("") || loginid==null) {
			  return "redirect:/";
		  } else {
			  iRoom room = sqlSession.getMapper(iRoom.class);
			  ArrayList<Roomtype> roomtype = room.getRoomType();
			  model.addAttribute("type", roomtype);
			  return "booking";
		  }

	  }
		
	@RequestMapping(value="/signin", method=RequestMethod.POST)
	public String signin(HttpServletRequest hsr) {
		String realname = hsr.getParameter("realname");
		String loginid = hsr.getParameter("loginid");
		String passcode = hsr.getParameter("passcode1");
		
		iMember member = sqlSession.getMapper(iMember.class);
		
		member.doSignin(realname, loginid, passcode);
		
		return "home";
	}
	  
//	@RequestMapping("/newinfo")
//	public String newInfo(@RequestParam("realname") String rname,
//						  @RequestParam("loginid") String uid,
//						  @RequestParam("passcode1") String pass1,
//						  @RequestParam("passcode2") String pass2,
//						  Model model) {
//		
//		model.addAttribute("realname", rname);
//		model.addAttribute("loginid", uid);
//		model.addAttribute("passcode1", pass1);
//		model.addAttribute("passcode2", pass2);
//
//		
//		return "newinfo";
//	}
	
	@RequestMapping("/room")
	// 여기서 interface호출하고 결과를 room.jsp에 전달.
	public String room(HttpServletRequest hsr, Model model) {
		HttpSession session = hsr.getSession();
		if(session.getAttribute("loginid")==null) {
			return "redirect:/login";
		}
		iRoom room = sqlSession.getMapper(iRoom.class);
		
		// ArrayList<Roominfo> roominfo = room.getRoomList();
		ArrayList<Roomtype> roomtype = room.getRoomType();
		
		// model.addAttribute("list", roominfo);
		model.addAttribute("type", roomtype);
		return "room";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest hsr) {
		HttpSession session = hsr.getSession();
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/test")
	public String Test() {
		return "test";
	}
	
	@RequestMapping(value="/getRoomList", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String getRoomList(HttpServletRequest hsr) {
		iRoom room = sqlSession.getMapper(iRoom.class);
		ArrayList<Roominfo> roominfo = room.getRoomList();
		
		// 찾아진 데이터로 JSONArray만들기
		JSONArray ja = new JSONArray();
		for(int i=0; i<roominfo.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("roomcode", roominfo.get(i).getRoomcode());
			jo.put("roomname", roominfo.get(i).getRoomname());
			jo.put("typename", roominfo.get(i).getTypename());
			jo.put("howmany", roominfo.get(i).getHowmany());
			jo.put("howmuch", roominfo.get(i).getHowmuch());
			ja.add(jo);			
		}
		System.out.println(ja.toString());
		return ja.toString();
	}
	
	@RequestMapping(value="/deleteRoom", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String deleteRoom(HttpServletRequest hsr) {
		int roomcode = Integer.parseInt(hsr.getParameter("roomcode"));
		iRoom room = sqlSession.getMapper(iRoom.class);
		room.doDeleteRoom(roomcode);
		return "ok";
	}
	
	@RequestMapping(value="/addRoom", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String addRoom(HttpServletRequest hsr) {
		String rname = hsr.getParameter("roomname");
		int type = Integer.parseInt(hsr.getParameter("roomtype"));
		int howmany = Integer.parseInt(hsr.getParameter("howmany"));
		int howmuch = Integer.parseInt(hsr.getParameter("howmuch"));
		iRoom room = sqlSession.getMapper(iRoom.class);
		room.doAddRoom(rname, type, howmany, howmuch);
		return "ok";		
	}
	
	@RequestMapping(value="/updateRoom", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String updateRoom(HttpServletRequest hsr) {
		iRoom room = sqlSession.getMapper(iRoom.class);
		room.doUpdateRoom(Integer.parseInt(hsr.getParameter("roomcode")),
				hsr.getParameter("roomname"),
				Integer.parseInt(hsr.getParameter("roomtype")),
				Integer.parseInt(hsr.getParameter("howmany")),
				Integer.parseInt(hsr.getParameter("howmuch")));
		return "ok";
	}
	
	@RequestMapping(value="/addBooking", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String addBooking(HttpServletRequest hsr) {
		int roomcode = Integer.parseInt(hsr.getParameter("roomcode"));
		int human = Integer.parseInt(hsr.getParameter("human"));
		String checkin = hsr.getParameter("checkin");
		String checkout = hsr.getParameter("checkout");
		int total = Integer.parseInt(hsr.getParameter("total"));
		String name = hsr.getParameter("name");
		String mobile = hsr.getParameter("mobile");
		
		iBooking booking = sqlSession.getMapper(iBooking.class);
		booking.doAddBooking(roomcode, human, checkin, checkout, total, name, mobile);
		
		return "ok";
	}
	
	@RequestMapping(value="/getBookingList", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String getBookList(HttpServletRequest hsr) {
		iBooking booking = sqlSession.getMapper(iBooking.class);
		ArrayList<Bookinginfo> bookinginfo = booking.getBookingList();
		
		String checkin = hsr.getParameter("day1");
		String checkout = hsr.getParameter("day2");
				
		// 찾아진 데이터로 JSONArray만들기
		JSONArray ja = new JSONArray();
		for(int i=0; i<bookinginfo.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("bookcode", bookinginfo.get(i).getBookcode());
			jo.put("roomcode", bookinginfo.get(i).getRoomcode());
			jo.put("human", bookinginfo.get(i).getHuman());
			jo.put("checkin", bookinginfo.get(i).getCheckin());
			jo.put("checkout", bookinginfo.get(i).getCheckout());
			jo.put("total", bookinginfo.get(i).getTotal());
			jo.put("mobile", bookinginfo.get(i).getMobile());
			jo.put("name", bookinginfo.get(i).getName());
			ja.add(jo);			
		}
		System.out.println(ja.toString());
		return ja.toString();
	}
}
