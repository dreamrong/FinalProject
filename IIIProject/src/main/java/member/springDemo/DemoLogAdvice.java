package member.springDemo;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class DemoLogAdvice {

	public static void main(String[] args) {
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("beans.config.xml");
		LogAdvice logAdvice = context.getBean("logAdvice", LogAdvice.class);
		logAdvice.log();
		context.close();
	}

}
