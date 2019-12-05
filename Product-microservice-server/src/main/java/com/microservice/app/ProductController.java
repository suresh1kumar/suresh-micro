package com.microservice.app;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

//@Controller
//@RequestMapping("product")
@RestController
public class ProductController {

	@Autowired
	private ProductService productService;

	
	@GetMapping(value="/getProductssstest", headers="Accept=application/json")
    public List<Product> getAllUser() {
		System.out.println("\n\n\n***************"+productService.getAllProducts()+"***************");
        List<Product> tasks=productService.getAllProducts();
        return tasks;

    }
	/*@RequestMapping(value="/getProductsss",method = RequestMethod.GET)
	public List<Product> getAllProducts() {
		System.out.println("sssSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSs");
		System.out.println("\n\n\n============product app======================"+productService.getAllProducts());
		System.out.println("\n\n\n=================================="+productService.getAllProducts());
		Product p=new Product();
		modelMap.put("products", productService.getAllProducts());
		//return "product/index";
		p=productService.getAllProducts();
		
		return productService.getAllProducts();
	}*/
	
	/*@GetMapping(value="/")
	public ModelAndView home() {
		ModelAndView model=new ModelAndView();
		model.setViewName("home");
		System.out.println("\n\n\n==================================");
		
		return model;
	}*/
	
	/*@RequestMapping(value="/getProduct",method = RequestMethod.GET)
	//@GetMapping(value="/getProduct")
	public String index(ModelMap modelMap) {
		System.out.println("\n\n\n=================================="+productService.getAllProducts());
		modelMap.put("products", productService.getAllProducts());
		//return "product/index";
		return "product";
	}*/

}