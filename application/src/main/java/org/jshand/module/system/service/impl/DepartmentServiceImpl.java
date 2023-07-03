package org.jshand.module.system.service.impl;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.jshand.module.system.mapper.DepartmentMapper;
import org.jshand.module.system.domain.Department;
import org.jshand.module.system.service.IDepartmentService;

/**
 * 科室Service业务层处理
 *
 * @author lhl
 * @date 2023-07-03
 */
@Service
public class DepartmentServiceImpl extends ServiceImpl<DepartmentMapper, Department> implements IDepartmentService {

}