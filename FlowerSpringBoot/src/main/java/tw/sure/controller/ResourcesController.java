package tw.sure.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ResourcesController {
	
	@GetMapping(path = "/classpathresource.controller", produces = MediaType.IMAGE_JPEG_VALUE)
    public byte[] processClassPathResourceAction() throws IOException {
		Resource resource = new ClassPathResource("static/images/下載.jpg");
		
		File file = resource.getFile();		
		System.out.println(file.getName() + " " + file.getPath() + " " + file.length());
		
		InputStream is1 = resource.getInputStream();
		return IOUtils.toByteArray(is1);
    }
	
	@Autowired
	private ResourceLoader resourceLoader;
	
	@GetMapping(path = "/resourceloader.controller", produces = MediaType.IMAGE_JPEG_VALUE)
	public byte[] processResourceLoadderAction() throws IOException {
		Resource resource = resourceLoader.getResource("classpath:static/images/下載 (1).jpg");
		
		File file = resource.getFile();		
		System.out.println(file.getName() + " " + file.getPath() + " " + file.length());
		
		InputStream is1 = resource.getInputStream();
		return IOUtils.toByteArray(is1);
	}
	
	@Value("classpath:static/images/下載 (2).jpg")
	private Resource resource;
	
	@GetMapping(path = "/resource.controller", produces = MediaType.IMAGE_JPEG_VALUE)
	public byte[] processResourceAction() throws IOException {
		File file = resource.getFile();		
		System.out.println(file.getName() + " " + file.getPath() + " " + file.length());
		
		InputStream is1 = resource.getInputStream();
		return IOUtils.toByteArray(is1);
	}
}
