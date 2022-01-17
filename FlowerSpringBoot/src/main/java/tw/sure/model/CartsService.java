package tw.sure.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CartsService {

	@Autowired
	private CartsRepository cartsRepository;

	public Carts insert(Carts carts) {
		return cartsRepository.save(carts);
	}

	public Carts update(Carts carts) {
		return cartsRepository.save(carts);
	}

	public List<Carts> findAll() {
		return cartsRepository.findAll();
	}
}
