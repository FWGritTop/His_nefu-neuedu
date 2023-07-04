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
import org.jshand.module.system.domain.Drugs;
import org.jshand.module.system.service.IDrugsService;
import org.jshand.support.common.utils.poi.ExcelUtil;

/**
 * 成品药Controller
 *
 * @author FireWin
 * @date 2023-07-03
 */
@Api(tags = "成品药模块")
@RestController
@RequestMapping("/system/drugs")
public class DrugsController extends BaseController {
    @Autowired
    private IDrugsService drugsService;

/**
 * 查询成品药列表
 */
@ApiOperation(value = "查询成品药列表")
@PreAuthorize("@ss.hasPermi('system:drugs:list')")
@GetMapping("/list")
    public Page<Drugs> list(Drugs entity, Page<Drugs> page) {
        LambdaQueryWrapper<Drugs> lambdaQueryWrapper = new LambdaQueryWrapper<Drugs>();
        //lambdaQueryWrapper.eq("DrugsCode",entity.getDrugsCode());
        if (entity.getDrugsDosage()!=null){lambdaQueryWrapper.eq(Drugs::getDrugsDosage,entity.getDrugsDosage());}
        if (entity.getDrugsCode() != null) {lambdaQueryWrapper.eq(Drugs::getDrugsCode,entity.getDrugsCode());}
        if (entity.getDrugsName()!=null){lambdaQueryWrapper.like(Drugs::getDrugsName,entity.getDrugsName());}
        if (entity.getDrugsUnit()!=null){lambdaQueryWrapper.like(Drugs::getDrugsUnit,entity.getDrugsUnit());}
        if (entity.getManufacturer()!=null){lambdaQueryWrapper.like(Drugs::getManufacturer,entity.getManufacturer());}
        if (entity.getDrugsType()!=null){lambdaQueryWrapper.eq(Drugs::getDrugsType,entity.getDrugsType());}
        if (entity.getDrugsPrice()!=null){lambdaQueryWrapper.eq(Drugs::getDrugsPrice,entity.getDrugsPrice());}
        if (entity.getMnemonicCode()!=null){lambdaQueryWrapper.like(Drugs::getMnemonicCode,entity.getMnemonicCode());}
        return drugsService.page(page, lambdaQueryWrapper);
    }

    /**
     * 导出成品药列表
     */
    @ApiOperation(value = "导出成品药列表")
    @PreAuthorize("@ss.hasPermi('system:drugs:export')")
    @Log(title = "成品药", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Drugs drugs) {
        LambdaQueryWrapper<Drugs> queryWrapper = new LambdaQueryWrapper<>();
        List<Drugs> list = drugsService.list(queryWrapper);
        ExcelUtil<Drugs> util = new ExcelUtil<Drugs>(Drugs. class);
        util.exportExcel(response, list, "成品药数据");
    }


    /**
     * 获取成品药详细信息
     */
    @ApiOperation(value = "获取成品药详细信息")
    @PreAuthorize("@ss.hasPermi('system:drugs:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(drugsService.getById(id));
    }

    /**
     * 新增成品药
     */
    @ApiOperation(value = "新增成品药")
    @PreAuthorize("@ss.hasPermi('system:drugs:add')")
    @Log(title = "成品药", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Drugs drugs) {
        return toAjax(drugsService.save(drugs));
    }

    /**
     * 修改成品药
     */
    @ApiOperation(value = "修改成品药")
    @PreAuthorize("@ss.hasPermi('system:drugs:edit')")
    @Log(title = "成品药", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Drugs drugs) {
        return toAjax(drugsService.updateById(drugs));
    }


    /**
     * 删除成品药
     */
    @ApiOperation(value = "删除成品药")
    @PreAuthorize("@ss.hasPermi('system:drugs:remove')")
    @Log(title = "成品药", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(drugsService.removeBatchByIds(Arrays.asList(ids)));
    }
}
