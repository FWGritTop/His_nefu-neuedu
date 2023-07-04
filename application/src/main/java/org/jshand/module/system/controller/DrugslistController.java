package org.jshand.module.system.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import ch.qos.logback.core.helpers.CyclicBuffer;
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
import org.jshand.module.system.domain.Drugslist;
import org.jshand.module.system.service.IDrugslistService;
import org.jshand.support.common.utils.poi.ExcelUtil;

/**
 * 成品药Controller
 *
 * @author ljp
 * @date 2023-07-04
 */
@Api(tags = "成品药模块")
@RestController
@RequestMapping("/system/drugslist")
public class DrugslistController extends BaseController {
    @Autowired
    private IDrugslistService drugslistService;

/**
 * 查询成品药列表
 */
@ApiOperation(value = "查询成品药列表")
@PreAuthorize("@ss.hasPermi('system:drugslist:list')")
@GetMapping("/list")
    public Page<Drugslist> list(Drugslist entity, Page<Drugslist> page) {

        LambdaQueryWrapper<Drugslist> lambdaQueryWrapper = new LambdaQueryWrapper<Drugslist>();
        return drugslistService.page(page, lambdaQueryWrapper);
    }

    /**
     * 导出成品药列表
     */
    @ApiOperation(value = "导出成品药列表")
    @PreAuthorize("@ss.hasPermi('system:drugslist:export')")
    @Log(title = "成品药", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Drugslist drugslist) {
        LambdaQueryWrapper<Drugslist> queryWrapper = new LambdaQueryWrapper<>();
        List<Drugslist> list = drugslistService.list(queryWrapper);
        ExcelUtil<Drugslist> util = new ExcelUtil<Drugslist>(Drugslist. class);
        util.exportExcel(response, list, "成品药数据");
    }


    /**
     * 获取成品药详细信息
     */
    @ApiOperation(value = "获取成品药详细信息")
    @PreAuthorize("@ss.hasPermi('system:drugslist:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(drugslistService.getById(id));
    }

    /**
     * 新增成品药
     */
    @ApiOperation(value = "新增成品药")
    @PreAuthorize("@ss.hasPermi('system:drugslist:add')")
    @Log(title = "成品药", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Drugslist drugslist) {
        return toAjax(drugslistService.save(drugslist));
    }

    /**
     * 修改成品药
     */
    @ApiOperation(value = "修改成品药")
    @PreAuthorize("@ss.hasPermi('system:drugslist:edit')")
    @Log(title = "成品药", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Drugslist drugslist) {
        return toAjax(drugslistService.updateById(drugslist));
    }


    /**
     * 删除成品药
     */
    @ApiOperation(value = "删除成品药")
    @PreAuthorize("@ss.hasPermi('system:drugslist:remove')")
    @Log(title = "成品药", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(drugslistService.removeBatchByIds(Arrays.asList(ids)));
    }
}
