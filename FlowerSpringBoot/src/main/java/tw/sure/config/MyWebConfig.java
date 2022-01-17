package tw.sure.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MyWebConfig implements WebMvcConfigurer{

	@Override  //設置虛擬路徑 讓網頁讀取到電腦磁盤資料
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        //registry.addResourceHandler("/images/**").addResourceLocations("file:C:/Users/Sure/Desktop/images/");
        registry.addResourceHandler("/product_index/**").addResourceLocations("file:E:/iii/畢業專題：）/Flower_workspace/FlowerSpringBoot/src/main/resources/static/images/product_index/");
        registry.addResourceHandler("/header&footer/**").addResourceLocations("file:E:/iii/畢業專題：）/Flower_workspace/FlowerSpringBoot/src/main/resources/static/images/header&footer/");
        registry.addResourceHandler("/Flower/**").addResourceLocations("file:C:/Users/Sure/Desktop/Flower/");
    }
	
}
