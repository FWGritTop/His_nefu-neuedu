package org.jshand.system.service.impl;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.jshand.system.mapper.DrugsMapper;
import org.jshand.system.domain.Drugs;
import org.jshand.system.service.IDrugsService;

/**
 * 成品药Service业务层处理
 *
 * @author FireWin
 * @date 2023-07-03
 */
@Service
public class DrugsServiceImpl extends ServiceImpl<DrugsMapper, Drugs> implements IDrugsService {

}