package org.jshand.module.system.controller;

import java.util.Arrays;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

import org.jshand.support.common.core.page.TableDataInfo;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.jshand.support.common.annotation.Log;
import org.jshand.support.common.core.controller.BaseController;
import org.jshand.support.common.core.domain.AjaxResult;
import org.jshand.support.common.enums.BusinessType;
import org.jshand.module.system.domain.Register;
import org.jshand.module.system.service.IRegisterService;
import org.jshand.support.common.utils.poi.ExcelUtil;

/**
 * 挂号信息Controller
 *
 * @author FireWin
 * @date 2023-07-04
 */
@Api(tags = "挂号信息模块")
@RestController
@RequestMapping("/system/register")
public class RegisterController extends BaseController {
    @Autowired
    private IRegisterService registerService;

/**
 * 查询挂号信息列表
 */
@ApiOperation(value = "查询挂号信息列表")
@PreAuthorize("@ss.hasPermi('system:register:list')")
@GetMapping("/list")
    public TableDataInfo list(Register entity, Page<Register> page) {
    /*
        LambdaQueryWrapper<Register> lambdaQueryWrapper = new LambdaQueryWrapper<Register>();
        return registerService.page(page, lambdaQueryWrapper);*/
        return getDataTable(registerService.selectRegisterList(entity));
    }

    /**
     * 导出挂号信息列表
     */
    @ApiOperation(value = "导出挂号信息列表")
    @PreAuthorize("@ss.hasPermi('system:register:export')")
    @Log(title = "挂号信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Register register) {
        LambdaQueryWrapper<Register> queryWrapper = new LambdaQueryWrapper<>();
        List<Register> list = registerService.list(queryWrapper);
        ExcelUtil<Register> util = new ExcelUtil<Register>(Register. class);
        util.exportExcel(response, list, "挂号信息数据");
    }


    /**
     * 获取挂号信息详细信息
     */
    @ApiOperation(value = "获取挂号信息详细信息")
    @PreAuthorize("@ss.hasPermi('system:register:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(registerService.getById(id));
    }

    /**
     * 新增挂号信息
     */
    @ApiOperation(value = "新增挂号信息")
    @PreAuthorize("@ss.hasPermi('system:register:add')")
    @Log(title = "挂号信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Register register) {
        return toAjax(registerService.save(register));
    }

    /**
     * 修改挂号信息
     */
    @ApiOperation(value = "修改挂号信息")
    @PreAuthorize("@ss.hasPermi('system:register:edit')")
    @Log(title = "挂号信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Register register) {
        return toAjax(registerService.updateById(register));
    }


    /**
     * 删除挂号信息
     */
    @ApiOperation(value = "删除挂号信息")
    @PreAuthorize("@ss.hasPermi('system:register:remove')")
    @Log(title = "挂号信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(registerService.removeBatchByIds(Arrays.asList(ids)));
    }
}
