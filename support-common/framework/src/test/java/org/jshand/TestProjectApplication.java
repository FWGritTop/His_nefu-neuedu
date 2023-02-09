package org.jshand;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 启动程序
 *
 * @author jshand
 */
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
public class TestProjectApplication {
    public static void main(String[] args) {
        SpringApplication.run(TestProjectApplication.class, args);
    }

}
