package service.impl;

import java.util.List;

import model.Payment;
import dao.PaymentDao;
import service.PaymentService;

public class PaymentServiceImpl implements PaymentService{
	private PaymentDao dao;
	
	private PaymentServiceImpl(){
		
	}

	public PaymentDao getDao() {
		return dao;
	}

	public void setDao(PaymentDao dao) {
		this.dao = dao;
	}

	@Override
	public List<Payment> getPayment(String ID) {
		// TODO Auto-generated method stub
		return dao.getPayment(ID);
	}

	@Override
	public void save(Payment p) {
		// TODO Auto-generated method stub
		dao.save(p);
	}
}
