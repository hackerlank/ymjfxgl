package com.gqw.controller.email;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gqw.bean.Email;
import com.gqw.service.email.EmailServiceImpl;
import com.gqw.util.PublicParameters;
@Controller
public class EmailController {
	@Autowired
	private EmailServiceImpl EmailServiceImpl;
	@RequestMapping("emailList")
	public String selectEmail(Map<String,Object> map,HttpServletRequest request,
			int start,int pageSize,String loginId,String addressee,String status,Date date1,Date date2){
		loginId=String.valueOf(PublicParameters.id);
		addressee=PublicParameters.username;
		List<Email> emails=EmailServiceImpl.receiveEmail((start-1)*pageSize, pageSize, loginId,addressee, status, date1, date2);
		map.put("emails", emails);
		return "emailManagent";
	}
	@RequestMapping("MsgSend")
	public String fasongEmail(Map<String,Object> map ,String userID,String title,String content){
		Email email=new Email();
		email.setFasongzhe(PublicParameters.username);
		email.setAddressee(userID);
		email.setTitle(title);
		email.setText(content);
		email.setLoginid(PublicParameters.id);
		email.setStatus("未读");
		Date day=new Date();    
		 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 String now=df.format(day);
		 email.setTime(PublicParameters.StringToDate(now,"yyyy-MM-dd HH:mm:ss"));
		Boolean bool=EmailServiceImpl.createEmail(email);
		map.put("email", email);
		return "emailManagent";
	}
		
	
}
