package tw.sure.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import tw.sure.model.DataBaseProperties;

@RestController
public class DataBasePropertiesController {
	
	@Autowired
	private DataBaseProperties dbp1;
	
	@GetMapping("/dbprops.controller")
    public DataBaseProperties processAction() {
    	return dbp1;
    }
}