package org.jshand.module.system.service.impl;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.jshand.module.system.mapper.MedicalrecordMapper;
import org.jshand.module.system.domain.Medicalrecord;
import org.jshand.module.system.service.IMedicalrecordService;

/**
 * 病历信息Service业务层处理
 *
 * @author lhl&ljp
 * @date 2023-07-05
 */
@Service
public class MedicalrecordServiceImpl extends ServiceImpl<MedicalrecordMapper, Medicalrecord> implements IMedicalrecordService {

}