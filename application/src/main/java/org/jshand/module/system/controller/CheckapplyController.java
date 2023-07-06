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
import org.jshand.module.system.domain.Checkapply;
import org.jshand.module.system.service.ICheckapplyService;
import org.jshand.support.common.utils.poi.ExcelUtil;

/**
 * 检查检验申请Controller
 *
 * @author lhl
 * @date 2023-07-04
 */
@Api(tags = "检查检验申请模块")
@RestController
@RequestMapping("/system/checkapply")
public class CheckapplyController extends BaseController {
    @Autowired
    private ICheckapplyService checkapplyService;

/**
 * 查询检查检验申请列表
 */
@ApiOperation(value = "查询检查检验申请列表")
@PreAuthorize("@ss.hasPermi('system:checkapply:list')")
@GetMapping("/list")
    public Page<Checkapply> list(Checkapply entity, Page<Checkapply> page) {

        LambdaQueryWrapper<Checkapply> lambdaQueryWrapper = new LambdaQueryWrapper<Checkapply>();
        return checkapplyService.page(page, lambdaQueryWrapper);
    }

    /**
     * 导出检查检验申请列表
     */
    @ApiOperation(value = "导出检查检验申请列表")
    @PreAuthorize("@ss.hasPermi('system:checkapply:export')")
    @Log(title = "检查检验申请", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Checkapply checkapply) {
        LambdaQueryWrapper<Checkapply> queryWrapper = new LambdaQueryWrapper<>();
        List<Checkapply> list = checkapplyService.list(queryWrapper);
        ExcelUtil<Checkapply> util = new ExcelUtil<Checkapply>(Checkapply. class);
        util.exportExcel(response, list, "检查检验申请数据");
    }


    /**
     * 获取检查检验申请详细信息
     */
    @ApiOperation(value = "获取检查检验申请详细信息")
    @PreAuthorize("@ss.hasPermi('system:checkapply:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(checkapplyService.getById(id));
    }

    /**
     * 新增检查检验申请
     */
    @ApiOperation(value = "新增检查检验申请")
    @Log(title = "检查检验申请", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Checkapply checkapply) {
        return toAjax(checkapplyService.save(checkapply));
    }

    /**
     * 修改检查检验申请
     */
    @ApiOperation(value = "修改检查检验申请")
    @PreAuthorize("@ss.hasPermi('system:checkapply:edit')")
    @Log(title = "检查检验申请", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Checkapply checkapply) {
        return toAjax(checkapplyService.updateById(checkapply));
    }


    /**
     * 删除检查检验申请
     */
    @ApiOperation(value = "删除检查检验申请")
    @PreAuthorize("@ss.hasPermi('system:checkapply:remove')")
    @Log(title = "检查检验申请", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(checkapplyService.removeBatchByIds(Arrays.asList(ids)));
    }
}
