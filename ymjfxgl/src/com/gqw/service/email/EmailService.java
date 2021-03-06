package com.gqw.service.email;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gqw.bean.Email;

public interface EmailService {

	public Boolean createEmail(Email email);
	public List<Email> receiveEmail(@Param("start")int start,
			@Param("pageSize")int pageSize,@Param("loginId")String loginId,@Param("addressee")String addressee,
			@Param("status")String status,@Param("date1")Date date1,
			@Param("date2")Date date2);
	public Boolean deleteEmail(@Param("id")String id);
}
