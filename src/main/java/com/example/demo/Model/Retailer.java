package com.example.demo.Model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Retailer {

	@Id
	int id;
	String name;
	String country;
	String state;
	int pincode;
	int phone;
	String email;
	String address;
	
	
	
	public Retailer(int id, String name, String country, String state, int pincode, int phone, String email,
			String address) {
		super();
		this.id = id;
		this.name = name;
		this.country = country;
		this.state = state;
		this.pincode = pincode;
		this.phone = phone;
		this.email = email;
		this.address = address;
	}
	
	
	public Retailer() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	


	@Override
	public String toString() {
		return "Retailer [id=" + id + ", name=" + name + ", country=" + country + ", state=" + state + ", pincode="
				+ pincode + ", phone=" + phone + ", email=" + email + ", address=" + address + "]";
	}


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getPincode() {
		return pincode;
	}
	public void setPincode(int pincode) {
		this.pincode = pincode;
	}
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
}
