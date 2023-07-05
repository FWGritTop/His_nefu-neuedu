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
import org.jshand.module.system.domain.Checkdetailed;
import org.jshand.module.system.service.ICheckdetailedService;
import org.jshand.support.common.utils.poi.ExcelUtil;

/**
 * 检查申请明细Controller
 *
 * @author lhl
 * @date 2023-07-05
 */
@Api(tags = "检查申请明细模块")
@RestController
@RequestMapping("/system/checkdetailed")
public class CheckdetailedController extends BaseController {
    @Autowired
    private ICheckdetailedService checkdetailedService;

/**
 * 查询检查申请明细列表
 */
@ApiOperation(value = "查询检查申请明细列表")
@PreAuthorize("@ss.hasPermi('system:checkdetailed:list')")
@GetMapping("/list")
    public Page<Checkdetailed> list(Checkdetailed entity, Page<Checkdetailed> page) {

        LambdaQueryWrapper<Checkdetailed> lambdaQueryWrapper = new LambdaQueryWrapper<Checkdetailed>();
        return checkdetailedService.page(page, lambdaQueryWrapper);
    }

    /**
     * 导出检查申请明细列表
     */
    @ApiOperation(value = "导出检查申请明细列表")
    @PreAuthorize("@ss.hasPermi('system:checkdetailed:export')")
    @Log(title = "检查申请明细", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Checkdetailed checkdetailed) {
        LambdaQueryWrapper<Checkdetailed> queryWrapper = new LambdaQueryWrapper<>();
        List<Checkdetailed> list = checkdetailedService.list(queryWrapper);
        ExcelUtil<Checkdetailed> util = new ExcelUtil<Checkdetailed>(Checkdetailed. class);
        util.exportExcel(response, list, "检查申请明细数据");
    }


    /**
     * 获取检查申请明细详细信息
     */
    @ApiOperation(value = "获取检查申请明细详细信息")
    @PreAuthorize("@ss.hasPermi('system:checkdetailed:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(checkdetailedService.getById(id));
    }

    /**
     * 新增检查申请明细
     */
    @ApiOperation(value = "新增检查申请明细")
    @PreAuthorize("@ss.hasPermi('system:checkdetailed:add')")
    @Log(title = "检查申请明细", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Checkdetailed checkdetailed) {
        return toAjax(checkdetailedService.save(checkdetailed));
    }

    /**
     * 修改检查申请明细
     */
    @ApiOperation(value = "修改检查申请明细")
    @PreAuthorize("@ss.hasPermi('system:checkdetailed:edit')")
    @Log(title = "检查申请明细", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Checkdetailed checkdetailed) {
        return toAjax(checkdetailedService.updateById(checkdetailed));
    }


    /**
     * 删除检查申请明细
     */
    @ApiOperation(value = "删除检查申请明细")
    @PreAuthorize("@ss.hasPermi('system:checkdetailed:remove')")
    @Log(title = "检查申请明细", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(checkdetailedService.removeBatchByIds(Arrays.asList(ids)));
    }
}
