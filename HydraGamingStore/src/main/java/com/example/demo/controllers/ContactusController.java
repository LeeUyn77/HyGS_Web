package com.example.demo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value= {"contactus"} ) // Controller mac dinh
public class ContactusController {
	@RequestMapping(method= RequestMethod.GET)
	public String index() {
		return "contactus.index"; // tiles.xml
	}
}