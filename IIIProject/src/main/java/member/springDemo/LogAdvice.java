package member.springDemo;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

public class LogAdvice {
	public void log() {

		Date dNow = new Date();
		SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		ft.setTimeZone(TimeZone.getTimeZone("GMT+8"));
		
		System.out.println("當前時間為: " + ft.format(dNow));
	}
}
