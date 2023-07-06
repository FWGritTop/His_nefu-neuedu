package org.jshand.module.system.mapper;

import org.jshand.module.system.domain.Medicalrecord;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * 病历信息Mapper接口
 *
 * @author lhl
 * @date 2023-07-04
 */
public interface MedicalrecordMapper extends BaseMapper<Medicalrecord> {
    public List<Medicalrecord> selectMedicalrecordList(Medicalrecord user);
}
