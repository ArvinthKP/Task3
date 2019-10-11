package com.example.demo.Controller;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.DAO.AddRetailerDao;
import com.example.demo.DAO.RetailerDao;
import com.example.demo.Model.AddedRetailer;
import com.example.demo.Model.Retailer;

@RestController
public class RetailerController {

	@Autowired
	RetailerDao retdao;
	@Autowired
	AddRetailerDao adretdao;
	
	
	
	@GetMapping("/find/{id}")
	public Optional<Retailer> find(@PathVariable int id)
	{
		System.out.print(retdao.findById(id));
		return retdao.findById(id);		
		
	}
	
	@GetMapping("/add/{id}")
	public List<AddedRetailer> add(@PathVariable int id)
	{
		Retailer r= retdao.findById(id).get();		
			AddedRetailer ar=new AddedRetailer(r.getName(),Integer.toString(r.getPhone()),r.getEmail());
			adretdao.save(ar);
		
//		System.out.println(ar);
		List<AddedRetailer> l=(List<AddedRetailer>) adretdao.findAll();
//		System.out.println(l);
		return l;	
		
		
	}
	
	@GetMapping("/count")
	public List<AddedRetailer> count()
	{
		List<AddedRetailer> l=(List<AddedRetailer>) adretdao.findAll();
//		System.out.println(l);
		return l;		
		
	}
	
	@GetMapping("/sort")
	public List<AddedRetailer> sort()
	{
		List<AddedRetailer> l=(List<AddedRetailer>) adretdao.findAll();
//		System.out.println(l);
		
		return l;		
		
	}
}
