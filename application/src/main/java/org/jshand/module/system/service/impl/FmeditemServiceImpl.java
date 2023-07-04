package org.jshand.module.system.service.impl;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.jshand.module.system.service.IFmeditemService;
import org.springframework.stereotype.Service;
import org.jshand.module.system.mapper.FmeditemMapper;
import org.jshand.module.system.domain.Fmeditem;

/**
 * 非药品收费Service业务层处理
 *
 * @author FireWin
 * @date 2023-07-03
 */
@Service
public class FmeditemServiceImpl extends ServiceImpl<FmeditemMapper, Fmeditem> implements IFmeditemService {

}