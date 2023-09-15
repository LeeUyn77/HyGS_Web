package com.example.demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import com.example.demo.entities.Account;
import com.example.demo.repositories.AccountRepository;

@Repository("accountService")
public class AccountServiceImpl implements AccountService {
	@Autowired
	private AccountRepository accountRepository;

	@Override
	public Account login(String username, String password) {
		// TODO Auto-generated method stub
		return accountRepository.login(username, password);
	}

	@Override
	public Account save(Account account) {
		// TODO Auto-generated method stub
		return accountRepository.save(account);
	}

	@Override
	public int findPoint(String username) {
		// TODO Auto-generated method stub
		return accountRepository.findPoint(username);
	}

	@Override
	public void checkOutByPoint(String username, int point) {
		// TODO Auto-generated method stub
		accountRepository.checkOutByPoint(username, point);
	}

	@Override
	public Iterable<Account> findAll() {
		// TODO Auto-generated method stub
		return accountRepository.findAll();
	}

	@Override
	public void delete(int id) {
		accountRepository.deleteById(id);

	}

	@Override
	public Page<Account> findAll(Pageable pageable) {
		// TODO Auto-generated method stub
		return accountRepository.findAll(pageable);
	}

	@Override
	public void delete_account(int id) {
		// TODO Auto-generated method stub
		accountRepository.delete_account(id);
	}

}
