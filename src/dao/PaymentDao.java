package dao;

import java.util.List;

import model.Payment;

public interface PaymentDao {
	public List<Payment> getPayment(String ID);
	public void save(Payment p);
}
