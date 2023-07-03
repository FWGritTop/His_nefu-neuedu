package org.jshand.system.controller;

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
import org.jshand.system.domain.Fmeditem;
import org.jshand.system.service.IFmeditemService;
import org.jshand.support.common.utils.poi.ExcelUtil;

/**
 * 非药品收费Controller
 *
 * @author FireWin
 * @date 2023-07-03
 */
@Api(tags = "非药品收费模块")
@RestController
@RequestMapping("/system/fmeditem")
public class FmeditemController extends BaseController {
    @Autowired
    private IFmeditemService fmeditemService;

/**
 * 查询非药品收费列表
 */
@ApiOperation(value = "查询非药品收费列表")
@PreAuthorize("@ss.hasPermi('system:fmeditem:list')")
@GetMapping("/list")
    public Page<Fmeditem> list(Fmeditem entity, Page<Fmeditem> page) {
        LambdaQueryWrapper<Fmeditem> lambdaQueryWrapper = new LambdaQueryWrapper<Fmeditem>();
        if (entity.getItemcode()!=null){lambdaQueryWrapper.eq(Fmeditem::getItemcode,entity.getItemcode());}
        if (entity.getItemname()!=null){lambdaQueryWrapper.like(Fmeditem::getItemname,entity.getItemname());}
        if (entity.getFormat()!=null){lambdaQueryWrapper.like(Fmeditem::getFormat,entity.getFormat());}
        if (entity.getPrice()!=null){lambdaQueryWrapper.eq(Fmeditem::getPrice,entity.getPrice());}
        if (entity.getExpclassid()!=null){lambdaQueryWrapper.eq(Fmeditem::getExpclassid,entity.getExpclassid());}
        if (entity.getDeptid()!=null){lambdaQueryWrapper.eq(Fmeditem::getDeptid,entity.getDeptid());}
        if (entity.getMnemoniccode()!=null){lambdaQueryWrapper.like(Fmeditem::getMnemoniccode,entity.getMnemoniccode());}
        if (entity.getRecordtype()!=null){lambdaQueryWrapper.eq(Fmeditem::getRecordtype,entity.getRecordtype());}
        /*
        entity.getItemcode();
        entity.getItemname();
        entity.getFormat();
        entity.getPrice();
        entity.getExpclassid();
        entity.getDeptid();
        entity.getMnemoniccode();
        entity.getRecordtype();*/
        return fmeditemService.page(page, lambdaQueryWrapper);
    }

    /**
     * 导出非药品收费列表
     */
    @ApiOperation(value = "导出非药品收费列表")
    @PreAuthorize("@ss.hasPermi('system:fmeditem:export')")
    @Log(title = "非药品收费", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Fmeditem fmeditem) {
        LambdaQueryWrapper<Fmeditem> queryWrapper = new LambdaQueryWrapper<>();
        List<Fmeditem> list = fmeditemService.list(queryWrapper);
        ExcelUtil<Fmeditem> util = new ExcelUtil<Fmeditem>(Fmeditem. class);
        util.exportExcel(response, list, "非药品收费数据");
    }


    /**
     * 获取非药品收费详细信息
     */
    @ApiOperation(value = "获取非药品收费详细信息")
    @PreAuthorize("@ss.hasPermi('system:fmeditem:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(fmeditemService.getById(id));
    }

    /**
     * 新增非药品收费
     */
    @ApiOperation(value = "新增非药品收费")
    @PreAuthorize("@ss.hasPermi('system:fmeditem:add')")
    @Log(title = "非药品收费", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Fmeditem fmeditem) {
        return toAjax(fmeditemService.save(fmeditem));
    }

    /**
     * 修改非药品收费
     */
    @ApiOperation(value = "修改非药品收费")
    @PreAuthorize("@ss.hasPermi('system:fmeditem:edit')")
    @Log(title = "非药品收费", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Fmeditem fmeditem) {
        return toAjax(fmeditemService.updateById(fmeditem));
    }


    /**
     * 删除非药品收费
     */
    @ApiOperation(value = "删除非药品收费")
    @PreAuthorize("@ss.hasPermi('system:fmeditem:remove')")
    @Log(title = "非药品收费", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(fmeditemService.removeBatchByIds(Arrays.asList(ids)));
    }
}
