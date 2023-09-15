package com.example.demo.services;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.example.demo.entities.Account;

public interface AccountService {
	public Account login(String username, String password);

	public Account save(Account account);

	public int findPoint(String username);

	public void checkOutByPoint(String username, int point);

	public Iterable<Account> findAll();

	public void delete(int id);

	public Page<Account> findAll(Pageable pageable);

	public void delete_account(int id);
}
