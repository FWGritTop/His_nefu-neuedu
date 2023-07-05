package org.jshand.module.system.controller;

import java.util.Arrays;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

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
import org.jshand.module.system.domain.Medicalrecord;
import org.jshand.module.system.service.IMedicalrecordService;
import org.jshand.support.common.utils.poi.ExcelUtil;

/**
 * 病历信息Controller
 *
 * @author lhl
 * @date 2023-07-04
 */
@Api(tags = "病历信息模块")
@RestController
@RequestMapping("/system/medicalrecord")
public class MedicalrecordController extends BaseController {
    @Autowired
    private IMedicalrecordService medicalrecordService;

/**
 * 查询病历信息列表
 */
@ApiOperation(value = "查询病历信息列表")
@PreAuthorize("@ss.hasPermi('system:medicalrecord:list')")
@GetMapping("/list")
    public Page<Medicalrecord> list(Medicalrecord entity, Page<Medicalrecord> page) {

        LambdaQueryWrapper<Medicalrecord> lambdaQueryWrapper = new LambdaQueryWrapper<Medicalrecord>();
        return medicalrecordService.page(page, lambdaQueryWrapper);
    }

    /**
     * 导出病历信息列表
     */
    @ApiOperation(value = "导出病历信息列表")
    @PreAuthorize("@ss.hasPermi('system:medicalrecord:export')")
    @Log(title = "病历信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Medicalrecord medicalrecord) {
        LambdaQueryWrapper<Medicalrecord> queryWrapper = new LambdaQueryWrapper<>();
        List<Medicalrecord> list = medicalrecordService.list(queryWrapper);
        ExcelUtil<Medicalrecord> util = new ExcelUtil<Medicalrecord>(Medicalrecord. class);
        util.exportExcel(response, list, "病历信息数据");
    }


    /**
     * 获取病历信息详细信息
     */
    @ApiOperation(value = "获取病历信息详细信息")
    @PreAuthorize("@ss.hasPermi('system:medicalrecord:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(medicalrecordService.getById(id));
    }

    /**
     * 新增病历信息
     */
    @ApiOperation(value = "新增病历信息")
    @PreAuthorize("@ss.hasPermi('system:medicalrecord:add')")
    @Log(title = "病历信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Medicalrecord medicalrecord) {
        return toAjax(medicalrecordService.save(medicalrecord));
    }

    /**
     * 修改病历信息
     */
    @ApiOperation(value = "修改病历信息")
    @PreAuthorize("@ss.hasPermi('system:medicalrecord:edit')")
    @Log(title = "病历信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Medicalrecord medicalrecord) {
        return toAjax(medicalrecordService.updateById(medicalrecord));
    }


    /**
     * 删除病历信息
     */
    @ApiOperation(value = "删除病历信息")
    @PreAuthorize("@ss.hasPermi('system:medicalrecord:remove')")
    @Log(title = "病历信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(medicalrecordService.removeBatchByIds(Arrays.asList(ids)));
    }
}
