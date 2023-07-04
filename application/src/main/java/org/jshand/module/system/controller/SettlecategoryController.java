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
import org.jshand.module.system.domain.Settlecategory;
import org.jshand.module.system.service.ISettlecategoryService;
import org.jshand.support.common.utils.poi.ExcelUtil;

/**
 * 结算类别Controller
 *
 * @author lhl
 * @date 2023-07-04
 */
@Api(tags = "结算类别模块")
@RestController
@RequestMapping("/system/settlecategory")
public class SettlecategoryController extends BaseController {
    @Autowired
    private ISettlecategoryService settlecategoryService;

/**
 * 查询结算类别列表
 */
@ApiOperation(value = "查询结算类别列表")
@PreAuthorize("@ss.hasPermi('system:settlecategory:list')")
@GetMapping("/list")
    public Page<Settlecategory> list(Settlecategory entity, Page<Settlecategory> page) {

        LambdaQueryWrapper<Settlecategory> lambdaQueryWrapper = new LambdaQueryWrapper<Settlecategory>();
    if (entity.getId()!=null){lambdaQueryWrapper.eq(Settlecategory::getId,entity.getId());}
    if (entity.getSettlecode() != null) {lambdaQueryWrapper.eq(Settlecategory::getSettlecode,entity.getSettlecode());}
    if (entity.getSettlename()!=null){lambdaQueryWrapper.like(Settlecategory::getSettlename,entity.getSettlename());}
    if (entity.getIsdefault()!=null){lambdaQueryWrapper.like(Settlecategory::getSettlename,entity.getSettlename());}
    if (entity.getSequence()!=null){lambdaQueryWrapper.like(Settlecategory::getSequence,entity.getSequence());}
    if (entity.getDelmark()!=null){lambdaQueryWrapper.like(Settlecategory::getDelmark,entity.getDelmark());}
    if (entity.getIsDelete()!=null){lambdaQueryWrapper.like(Settlecategory::getIsDelete,entity.getIsDelete());}
    return settlecategoryService.page(page, lambdaQueryWrapper);
    }

    /**
     * 导出结算类别列表
     */
    @ApiOperation(value = "导出结算类别列表")
    @PreAuthorize("@ss.hasPermi('system:settlecategory:export')")
    @Log(title = "结算类别", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Settlecategory settlecategory) {
        LambdaQueryWrapper<Settlecategory> queryWrapper = new LambdaQueryWrapper<>();
        List<Settlecategory> list = settlecategoryService.list(queryWrapper);
        ExcelUtil<Settlecategory> util = new ExcelUtil<Settlecategory>(Settlecategory. class);
        util.exportExcel(response, list, "结算类别数据");
    }


    /**
     * 获取结算类别详细信息
     */
    @ApiOperation(value = "获取结算类别详细信息")
    @PreAuthorize("@ss.hasPermi('system:settlecategory:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(settlecategoryService.getById(id));
    }

    /**
     * 新增结算类别
     */
    @ApiOperation(value = "新增结算类别")
    @PreAuthorize("@ss.hasPermi('system:settlecategory:add')")
    @Log(title = "结算类别", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Settlecategory settlecategory) {
        return toAjax(settlecategoryService.save(settlecategory));
    }

    /**
     * 修改结算类别
     */
    @ApiOperation(value = "修改结算类别")
    @PreAuthorize("@ss.hasPermi('system:settlecategory:edit')")
    @Log(title = "结算类别", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Settlecategory settlecategory) {
        return toAjax(settlecategoryService.updateById(settlecategory));
    }


    /**
     * 删除结算类别
     */
    @ApiOperation(value = "删除结算类别")
    @PreAuthorize("@ss.hasPermi('system:settlecategory:remove')")
    @Log(title = "结算类别", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(settlecategoryService.removeBatchByIds(Arrays.asList(ids)));
    }
}
