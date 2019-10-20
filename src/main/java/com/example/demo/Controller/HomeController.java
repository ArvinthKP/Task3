package com.example.demo.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping("/")
	public String home() {
//		return "index.jsp";
//		return "pageination_Test.jsp";
		return "index_with_pagination.jsp";
//		return "simplified.jsp";
	}
}
