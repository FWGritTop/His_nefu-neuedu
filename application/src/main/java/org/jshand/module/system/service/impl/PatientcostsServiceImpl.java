package org.jshand.module.system.service.impl;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.jshand.module.system.mapper.PatientcostsMapper;
import org.jshand.module.system.domain.Patientcosts;
import org.jshand.module.system.service.IPatientcostsService;

/**
 * 患者费用明细Service业务层处理
 *
 * @author lhl
 * @date 2023-07-04
 */
@Service
public class PatientcostsServiceImpl extends ServiceImpl<PatientcostsMapper, Patientcosts> implements IPatientcostsService {

}