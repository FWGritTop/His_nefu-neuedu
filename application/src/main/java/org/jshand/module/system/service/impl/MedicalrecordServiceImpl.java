package org.jshand.module.system.service.impl;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.jshand.module.system.mapper.SysUserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.jshand.module.system.mapper.MedicalrecordMapper;
import org.jshand.module.system.domain.Medicalrecord;
import org.jshand.module.system.service.IMedicalrecordService;

import java.util.List;

/**
 * 病历信息Service业务层处理
 *
 * @author lhl
 * @date 2023-07-04
 */
@Service
public class MedicalrecordServiceImpl extends ServiceImpl<MedicalrecordMapper, Medicalrecord> implements IMedicalrecordService {
    @Autowired
    private MedicalrecordMapper medicalrecordMapper;
    @Override
    public List<Medicalrecord> selectMedicalrecordList(Medicalrecord user) {
        return medicalrecordMapper.selectMedicalrecordList(user);
    }


}