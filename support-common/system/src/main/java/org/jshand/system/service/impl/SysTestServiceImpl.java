package org.jshand.system.service.impl;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.jshand.system.domain.SysTest;
import org.jshand.system.mapper.SysTestMapper;
import org.jshand.system.service.ISysTestService;
import org.springframework.stereotype.Service;

/**
 * 单标管理Service业务层处理
 *
 * @author 张金山
 * @date 2023-01-04
 */
@Service
public class SysTestServiceImpl extends ServiceImpl<SysTestMapper, SysTest> implements ISysTestService {

}