package org.jshand.module.system.service.impl;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.jshand.module.system.mapper.RegisterMapper;
import org.jshand.module.system.domain.Register;
import org.jshand.module.system.service.IRegisterService;

/**
 * 挂号信息Service业务层处理
 *
 * @author FireWin
 * @date 2023-07-04
 */
@Service
public class RegisterServiceImpl extends ServiceImpl<RegisterMapper, Register> implements IRegisterService {

}