package tw.sure.controller;


import java.io.IOException;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import tw.sure.model.Product;
import tw.sure.model.ProductService;

@Controller
//@RequestMapping("/product")
public class ProductController {

	@Autowired
	private ProductService pService;

	//------------------------------------分別查找所有商品---------------------------
	
	@GetMapping("/Get/allproducts")  
	@ResponseBody
	public List<Product> FindAllProduct() {
		return pService.findAll();
	}
	
	
	// 放在/WEB-INF/views/目錄下的jsp是不能通過瀏覽器的url直接訪問的
	// 只能通過mvc的controller進行modelAndView的跳轉
	@GetMapping("/Get/managepage")
	public String findManagePage() {
		return "manage";
	}

	// ------------------------------------------------------------------------

	// 1. 給商品後台一個頁面
	@RequestMapping("/hello")
	public String backend() {
		return "backend_manage";
	}
	
	// 2. 後台按鈕 跳轉 管理後台
	@GetMapping("/manage") // 帶數據庫資料到管理頁面 ok
	public ModelAndView prodslist() {
		List<Product> list = pService.findAll();
		ModelAndView mav = new ModelAndView("manage");
		mav.addObject("list", list);
		return mav;
	}

	// 3. 新增/修改按鈕 跳轉 新增/修改頁面
	@RequestMapping("/insert")
	public String jumpToInsert() {
		return "product_insert";
	}
	
	@RequestMapping("/edit") 
	public String jumpToEdit() {
		return "product_edit";
	}
	
	// 4. 新增資料-->管理頁面         
	@PostMapping("/insertProduct")
	public String insertProduct(@RequestParam("product_id") Integer product_id,
			@RequestParam("product_name") String product_name, @RequestParam("product_type") String product_type,
			@RequestParam("product_subtype") String product_subtype,@RequestParam("product_place") String product_place,
			@RequestParam("product_price") int product_price,@RequestParam("product_quantity") int product_quantity,
			@RequestParam("product_inventory") int product_inventory,@RequestParam("product_info1") String product_info1,
			@RequestParam("product_info2") String product_info2,
			@RequestParam("myFiles") MultipartFile product_img) throws IOException {
		
		byte[] mfc =product_img.getBytes();
		Product pBean = new Product();
		pBean.setProduct_id(product_id);
		pBean.setProduct_name(product_name);
		pBean.setProduct_type(product_type);
		pBean.setProduct_subtype(product_subtype);
		pBean.setProduct_place(product_place);
		pBean.setProduct_price(product_price);
		pBean.setProduct_quantity(product_quantity);
		pBean.setProduct_inventory(product_inventory);
		pBean.setProduct_info1(product_info1);
		pBean.setProduct_info2(product_info2);
		pBean.setProduct_img(mfc);
		
		pService.insert(pBean);
		
		return "redirect:/manage";
	}
	
	// 5. 刪除資料
	@GetMapping("/deleteProduct/{product_id}")
	public String deleteProduct(@PathVariable("product_id") Integer product_id){
		
		pService.deleteById(product_id);
		
		return "redirect:/manage";
	}

	// 6. 修改資料 step1
	@GetMapping("/editProduct/{product_id}")
	public String editProduct(@PathVariable("product_id") Integer product_id,Model m){
		
		Product pfind = pService.findById(product_id);
		m.addAttribute(pfind);
		
		return "product_edit";
	}

	// 6. 修改資料 step2               -------還沒存照片------------
	@PostMapping("/editProduct")
	public String updateProduct(@RequestParam("product_id") Integer product_id,
			@RequestParam("product_name") String product_name, @RequestParam("product_type") String product_type,
			@RequestParam("product_subtype") String product_subtype,@RequestParam("product_place") String product_place,
			@RequestParam("product_price") int product_price,@RequestParam("product_quantity") int product_quantity,
			@RequestParam("product_inventory") int product_inventory,@RequestParam("product_info1") String product_info1,
			@RequestParam("product_info2") String product_info2,
			@RequestParam("myFiles") MultipartFile product_img) throws IOException {
		
		byte[] mfc =product_img.getBytes();
		Product pBean = new Product();
		pBean.setProduct_id(product_id);
		pBean.setProduct_name(product_name);
		pBean.setProduct_type(product_type);
		pBean.setProduct_subtype(product_subtype);
		pBean.setProduct_place(product_place);
		pBean.setProduct_price(product_price);
		pBean.setProduct_quantity(product_quantity);
		pBean.setProduct_inventory(product_inventory);
		pBean.setProduct_info1(product_info1);
		pBean.setProduct_info2(product_info2);
		pBean.setProduct_img(mfc);
		
		pService.update(pBean);
		
		return "redirect:/manage";
	}
	
	// 7. 上傳圖片  
	
	@GetMapping(path ="/productquantitydownload/{product_id}" , produces = MediaType.IMAGE_PNG_VALUE)
	@ResponseBody
	public byte[]  productquantitydownload(@PathVariable("product_id") Integer product_id )throws IOException {
		Product pfind = pService.findById(product_id);
		return pfind.getProduct_img();
	}
	
	
	// 8. 跳轉到商品首頁-所有商品
	@RequestMapping("/index")
	public String jumpToIndex() {
		return "product_index";
	}
	
	
	// 9. 跳轉到商品首頁-鮮花花束
	@RequestMapping("/flower")
	public String jumpToFlower() {
		return "product_index_flower";
	}
	
	// 10. 跳轉到商品首頁-周邊禮品
		@RequestMapping("/gift")
		public String jumpToGift() {
			return "product_index_gift";
	}
	  
	// 11.跳轉商品首頁
	 @GetMapping("/index2/{pid}") // 帶數據庫資料到管理頁面 ok
	 public ModelAndView processQueryAction(@PathVariable int pid) {
	  try {
	
	Product pdetail = pService.findById(pid);//寫死id*************************
	   ModelAndView detailMav = new ModelAndView("index");
	   detailMav.addObject("pdetail", pdetail);

	   return detailMav;

	  } catch (Exception e) {
	   return null; // 因為這裡回傳是 Products 物件
	  }
	 }
	 
	 
	 

}
