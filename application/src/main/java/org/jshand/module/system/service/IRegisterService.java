package org.jshand.module.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.jshand.module.system.domain.Register;

import java.util.List;

/**
 * 挂号信息Service接口
 *
 * @author FireWin
 * @date 2023-07-04
 */
public interface IRegisterService extends IService<Register> {
    public List<Register> selectRegisterList(Register user);
}