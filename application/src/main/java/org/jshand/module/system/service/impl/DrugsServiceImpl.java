package org.jshand.module.system.service.impl;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.jshand.module.system.service.IDrugsService;
import org.springframework.stereotype.Service;
import org.jshand.module.system.mapper.DrugsMapper;
import org.jshand.module.system.domain.Drugs;

/**
 * 成品药Service业务层处理
 *
 * @author FireWin
 * @date 2023-07-03
 */
@Service
public class DrugsServiceImpl extends ServiceImpl<DrugsMapper, Drugs> implements IDrugsService {

}