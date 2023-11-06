package kr.or.ddit.controller.head.excel;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import org.jxls.common.Context;
import org.jxls.util.JxlsHelper;

import kr.or.ddit.vo.head.Employee;

public class JXLSTest {
	public static void main(String[] args) throws IOException {
		
		
		List<Employee> employee = new ArrayList<Employee>();
		
		Employee employee1 = new Employee();
		employee1.setName("홍길동");
		employee1.setTelno("010-1234-5678");
		employee1.setAddress("대전광역시");
		
		Employee employee2 = new Employee();
		employee2.setName("감나무");
		employee2.setTelno("010-4565-5678");
		employee2.setAddress("세종");
		
		employee.add(employee1);
		employee.add(employee2);
		
//		try(InputStream is = JXLSTest.class.getResourceAsStream("common.xls")) {
			try(InputStream is = new FileInputStream(new File("D:\\upload/common.xls"))) {
	        try (OutputStream os = new FileOutputStream("D:\\upload/common3.xls")) {
	            Context context = new Context();
	            context.putVar("employees", employee);
	            JxlsHelper.getInstance().processTemplate(is, os, context);
	        }
	    }
	}
}
