package org.jshand.system.service.impl;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.jshand.system.mapper.PrescriptionMapper;
import org.jshand.system.domain.Prescription;
import org.jshand.system.service.IPrescriptionService;

/**
 * 成药处方Service业务层处理
 *
 * @author ljp
 * @date 2023-07-03
 */
@Service
public class PrescriptionServiceImpl extends ServiceImpl<PrescriptionMapper, Prescription> implements IPrescriptionService {

}