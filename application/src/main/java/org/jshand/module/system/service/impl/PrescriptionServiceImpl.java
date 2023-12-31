package org.jshand.module.system.service.impl;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.jshand.module.system.mapper.PrescriptionMapper;
import org.jshand.module.system.domain.Prescription;
import org.jshand.module.system.service.IPrescriptionService;

/**
 * 成药处方Service业务层处理
 *
 * @author ljp
 * @date 2023-07-04
 */
@Service
public class PrescriptionServiceImpl extends ServiceImpl<PrescriptionMapper, Prescription> implements IPrescriptionService {

}