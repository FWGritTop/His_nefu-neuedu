package org.jshand.module.system.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

import org.assertj.core.util.Arrays;
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
import org.jshand.module.system.domain.Prescription;
import org.jshand.module.system.service.IPrescriptionService;
import org.jshand.support.common.utils.poi.ExcelUtil;

/**
 * 成药处方Controller
 *
 * @author ljp
 * @date 2023-07-03
 */
@Api(tags = "成药处方模块")
@RestController
@RequestMapping("/system/prescription")
public class PrescriptionController extends BaseController {
    @Autowired
    private IPrescriptionService prescriptionService;

/**
 * 查询成药处方列表
 */
@ApiOperation(value = "查询成药处方列表")
@PreAuthorize("@ss.hasPermi('system:prescription:list')")
@GetMapping("/list")
    public Page<Prescription> list(Prescription entity, Page<Prescription> page) {

        LambdaQueryWrapper<Prescription> lambdaQueryWrapper = new LambdaQueryWrapper<Prescription>();
        return prescriptionService.page(page, lambdaQueryWrapper);
    }

    /**
     * 导出成药处方列表
     */
    @ApiOperation(value = "导出成药处方列表")
    @PreAuthorize("@ss.hasPermi('system:prescription:export')")
    @Log(title = "成药处方", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Prescription prescription) {
        LambdaQueryWrapper<Prescription> queryWrapper = new LambdaQueryWrapper<>();
        List<Prescription> list = prescriptionService.list(queryWrapper);
        ExcelUtil<Prescription> util = new ExcelUtil<Prescription>(Prescription. class);
        util.exportExcel(response, list, "成药处方数据");
    }


    /**
     * 获取成药处方详细信息
     */
    @ApiOperation(value = "获取成药处方详细信息")
    @PreAuthorize("@ss.hasPermi('system:prescription:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(prescriptionService.getById(id));
    }

    /**
     * 新增成药处方
     */
    @ApiOperation(value = "新增成药处方")
    @PreAuthorize("@ss.hasPermi('system:prescription:add')")
    @Log(title = "成药处方", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Prescription prescription) {
        return toAjax(prescriptionService.save(prescription));
    }

    /**
     * 修改成药处方
     */
    @ApiOperation(value = "修改成药处方")
    @PreAuthorize("@ss.hasPermi('system:prescription:edit')")
    @Log(title = "成药处方", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Prescription prescription) {
        return toAjax(prescriptionService.updateById(prescription));
    }


    /**
     * 删除成药处方
     */
    @ApiOperation(value = "删除成药处方")
    @PreAuthorize("@ss.hasPermi('system:prescription:remove')")
    @Log(title = "成药处方", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(prescriptionService.removeBatchByIds(Arrays.asList(ids)));
    }
}
