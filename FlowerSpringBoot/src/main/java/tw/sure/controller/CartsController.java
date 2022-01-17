package tw.sure.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import tw.sure.model.Carts;
import tw.sure.model.CartsService;

@Controller
public class CartsController {

	@Autowired
	private CartsService cartsService;

//  1. 新增購物車訂單
	@PostMapping("/index/insertCarts")
	public Carts insertCarts(@RequestBody Carts carts) {

		return cartsService.insert(carts);
	}

} 
