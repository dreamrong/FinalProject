package tw.sure.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ProductService {
	
	@Autowired
	private ProductRepository productRepository;
	
	public Product insert(Product product) {
		return productRepository.save(product);
	}
	
	public Product update(Product product) {
		return productRepository.save(product);
	}
	
	public void deleteById(Integer product_id) {
		productRepository.deleteById(product_id);
	}
	
	public Product findById(Integer product_id) {
		Optional<Product> pRep = productRepository.findById(product_id);
		
		if(pRep.isPresent()) {
			
			return pRep.get();
		}
		
		return null;
	}
	
	public List<Product> findAll(){
		return productRepository.findAll();
	}

}
