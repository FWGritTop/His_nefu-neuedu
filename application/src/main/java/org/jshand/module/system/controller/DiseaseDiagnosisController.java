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
import org.jshand.module.system.domain.DiseaseDiagnosis;
import org.jshand.module.system.service.IDiseaseDiagnosisService;
import org.jshand.support.common.utils.poi.ExcelUtil;

/**
 * 病历疾病诊断Controller
 *
 * @author lhl
 * @date 2023-07-03
 */
@Api(tags = "病历疾病诊断模块")
@RestController
@RequestMapping("/system/DiseaseDiagnosis")
public class DiseaseDiagnosisController extends BaseController {
    @Autowired
    private IDiseaseDiagnosisService diseaseDiagnosisService;

/**
 * 查询病历疾病诊断列表
 */
@ApiOperation(value = "查询病历疾病诊断列表")
@PreAuthorize("@ss.hasPermi('system:DiseaseDiagnosis:list')")
@GetMapping("/list")
    public Page<DiseaseDiagnosis> list(DiseaseDiagnosis entity, Page<DiseaseDiagnosis> page) {

        LambdaQueryWrapper<DiseaseDiagnosis> lambdaQueryWrapper = new LambdaQueryWrapper<DiseaseDiagnosis>();
        return diseaseDiagnosisService.page(page, lambdaQueryWrapper);
    }

    /**
     * 导出病历疾病诊断列表
     */
    @ApiOperation(value = "导出病历疾病诊断列表")
    @PreAuthorize("@ss.hasPermi('system:DiseaseDiagnosis:export')")
    @Log(title = "病历疾病诊断", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, DiseaseDiagnosis diseaseDiagnosis) {
        LambdaQueryWrapper<DiseaseDiagnosis> queryWrapper = new LambdaQueryWrapper<>();
        List<DiseaseDiagnosis> list = diseaseDiagnosisService.list(queryWrapper);
        ExcelUtil<DiseaseDiagnosis> util = new ExcelUtil<DiseaseDiagnosis>(DiseaseDiagnosis. class);
        util.exportExcel(response, list, "病历疾病诊断数据");
    }


    /**
     * 获取病历疾病诊断详细信息
     */
    @ApiOperation(value = "获取病历疾病诊断详细信息")
    @PreAuthorize("@ss.hasPermi('system:DiseaseDiagnosis:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(diseaseDiagnosisService.getById(id));
    }

    /**
     * 新增病历疾病诊断
     */
    @ApiOperation(value = "新增病历疾病诊断")
    @PreAuthorize("@ss.hasPermi('system:DiseaseDiagnosis:add')")
    @Log(title = "病历疾病诊断", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DiseaseDiagnosis diseaseDiagnosis) {
        return toAjax(diseaseDiagnosisService.save(diseaseDiagnosis));
    }

    /**
     * 修改病历疾病诊断
     */
    @ApiOperation(value = "修改病历疾病诊断")
    @PreAuthorize("@ss.hasPermi('system:DiseaseDiagnosis:edit')")
    @Log(title = "病历疾病诊断", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DiseaseDiagnosis diseaseDiagnosis) {
        return toAjax(diseaseDiagnosisService.updateById(diseaseDiagnosis));
    }


    /**
     * 删除病历疾病诊断
     */
    @ApiOperation(value = "删除病历疾病诊断")
    @PreAuthorize("@ss.hasPermi('system:DiseaseDiagnosis:remove')")
    @Log(title = "病历疾病诊断", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(diseaseDiagnosisService.removeBatchByIds(Arrays.asList(ids)));
    }
}
