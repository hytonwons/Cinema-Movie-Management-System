package service;

import java.util.List;

import model.Payment;

public interface PaymentService {
	public List<Payment> getPayment(String ID);
	public void save(Payment p);
}
