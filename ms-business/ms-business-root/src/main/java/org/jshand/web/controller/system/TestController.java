package org.jshand.web.controller.system;

import io.swagger.annotations.Api;
import org.jshand.common.core.domain.R;
import org.jshand.web.domain.User;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@Api("自定义模块")
@RestController("myTestController")
public class TestController {

    @GetMapping("/test")
    R<User> test() {
        User user = new User();
        return R.ok(user);
    }

}
