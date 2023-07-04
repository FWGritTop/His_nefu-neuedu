package org.jshand.module.system.controller;
 //  注： 此页建表有误，暂未实现
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
import org.jshand.module.system.domain.Patientcosts;
import org.jshand.module.system.service.IPatientcostsService;
import org.jshand.support.common.utils.poi.ExcelUtil;

/**
 * 患者费用明细Controller
 *
 * @author lhl
 * @date 2023-07-04
 */
@Api(tags = "患者费用明细模块")
@RestController
@RequestMapping("/system/patientcosts")
public class PatientcostsController extends BaseController {
    @Autowired
    private IPatientcostsService patientcostsService;

/**
 * 查询患者费用明细列表
 */
@ApiOperation(value = "查询患者费用明细列表")
@PreAuthorize("@ss.hasPermi('system:patientcosts:list')")
@GetMapping("/list")
    public Page<Patientcosts> list(Patientcosts entity, Page<Patientcosts> page) {

        LambdaQueryWrapper<Patientcosts> lambdaQueryWrapper = new LambdaQueryWrapper<Patientcosts>();
        return patientcostsService.page(page, lambdaQueryWrapper);
    }

    /**
     * 导出患者费用明细列表
     */
    @ApiOperation(value = "导出患者费用明细列表")
    @PreAuthorize("@ss.hasPermi('system:patientcosts:export')")
    @Log(title = "患者费用明细", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Patientcosts patientcosts) {
        LambdaQueryWrapper<Patientcosts> queryWrapper = new LambdaQueryWrapper<>();
        List<Patientcosts> list = patientcostsService.list(queryWrapper);
        ExcelUtil<Patientcosts> util = new ExcelUtil<Patientcosts>(Patientcosts. class);
        util.exportExcel(response, list, "患者费用明细数据");
    }


    /**
     * 获取患者费用明细详细信息
     */
    @ApiOperation(value = "获取患者费用明细详细信息")
    @PreAuthorize("@ss.hasPermi('system:patientcosts:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(patientcostsService.getById(id));
    }

    /**
     * 新增患者费用明细
     */
    @ApiOperation(value = "新增患者费用明细")
    @PreAuthorize("@ss.hasPermi('system:patientcosts:add')")
    @Log(title = "患者费用明细", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Patientcosts patientcosts) {
        return toAjax(patientcostsService.save(patientcosts));
    }

    /**
     * 修改患者费用明细
     */
    @ApiOperation(value = "修改患者费用明细")
    @PreAuthorize("@ss.hasPermi('system:patientcosts:edit')")
    @Log(title = "患者费用明细", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Patientcosts patientcosts) {
        return toAjax(patientcostsService.updateById(patientcosts));
    }


    /**
     * 删除患者费用明细
     */
    @ApiOperation(value = "删除患者费用明细")
    @PreAuthorize("@ss.hasPermi('system:patientcosts:remove')")
    @Log(title = "患者费用明细", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(patientcostsService.removeBatchByIds(Arrays.asList(ids)));
    }
}
