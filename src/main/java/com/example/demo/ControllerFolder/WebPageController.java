package com.example.demo.ControllerFolder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class WebPageController {
	@RequestMapping()
	    public String index() {
	        return "Home.jsp";
	    }
	@RequestMapping("/NewTranslation")
	public String NewTranslationPage() {
		return "NewTranslation.jsp";
	}
}
