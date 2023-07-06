package org.jshand.module.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.jshand.module.system.domain.Medicalrecord;

import java.util.List;

/**
 * 病历信息Service接口
 *
 * @author lhl
 * @date 2023-07-04
 */
public interface IMedicalrecordService extends IService<Medicalrecord> {
    public List<Medicalrecord> selectMedicalrecordList(Medicalrecord user);

}