package org.jshand.module.system.mapper;

import org.jshand.module.system.domain.Register;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * 挂号信息Mapper接口
 *
 * @author FireWin
 * @date 2023-07-04
 */
public interface RegisterMapper extends BaseMapper<Register> {
    public List<Register> selectRegisterList(Register user);
}
