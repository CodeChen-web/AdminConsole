import com.atlantis.domain.Admin;
import com.atlantis.service.AdminService;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class TestDemo {

    @Test
    public void testSpring() throws Exception {
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        AdminService adminService = (AdminService) ac.getBean("adminService");
        List<Admin> admins = adminService.findAllAdmin();
        for (Admin admin : admins) {
            System.out.println(admin);
        }
    }

}
