package com.gqw.service.email;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gqw.bean.Email;
import com.gqw.dao.email.EmailMapper;
@Service
@Transactional
public class EmailServiceImpl implements EmailService {
	@Autowired
	private EmailMapper emailMapper;
	public Boolean createEmail(Email email) {
		// TODO Auto-generated method stub
		return emailMapper.createEmail(email);
	}

	public Boolean deleteEmail(String id) {
		// TODO Auto-generated method stub
		return emailMapper.deleteEmail(id);
	}

	public List<Email> receiveEmail(int start, int pageSize, String loginId,String addressee,
			String status, Date date1, Date date2) {
		// TODO Auto-generated method stub
		return emailMapper.receiveEmail(start, pageSize, loginId,addressee, status, date1, date2);
	}

}
