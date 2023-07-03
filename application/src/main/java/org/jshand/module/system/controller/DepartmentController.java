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
import org.jshand.module.system.domain.Department;
import org.jshand.module.system.service.IDepartmentService;
import org.jshand.support.common.utils.poi.ExcelUtil;

/**
 * 科室Controller
 *
 * @author lhl
 * @date 2023-07-03
 */
@Api(tags = "科室模块")
@RestController
@RequestMapping("/system/department")
public class DepartmentController extends BaseController {
    @Autowired
    private IDepartmentService departmentService;

/**
 * 查询科室列表
 */
@ApiOperation(value = "查询科室列表")
@PreAuthorize("@ss.hasPermi('system:department:list')")
@GetMapping("/list")
    public Page<Department> list(Department entity, Page<Department> page) {

        LambdaQueryWrapper<Department> lambdaQueryWrapper = new LambdaQueryWrapper<Department>();
        return departmentService.page(page, lambdaQueryWrapper);
    }

    /**
     * 导出科室列表
     */
    @ApiOperation(value = "导出科室列表")
    @PreAuthorize("@ss.hasPermi('system:department:export')")
    @Log(title = "科室", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Department department) {
        LambdaQueryWrapper<Department> queryWrapper = new LambdaQueryWrapper<>();
        List<Department> list = departmentService.list(queryWrapper);
        ExcelUtil<Department> util = new ExcelUtil<Department>(Department. class);
        util.exportExcel(response, list, "科室数据");
    }


    /**
     * 获取科室详细信息
     */
    @ApiOperation(value = "获取科室详细信息")
    @PreAuthorize("@ss.hasPermi('system:department:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(departmentService.getById(id));
    }

    /**
     * 新增科室
     */
    @ApiOperation(value = "新增科室")
    @PreAuthorize("@ss.hasPermi('system:department:add')")
    @Log(title = "科室", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Department department) {
        return toAjax(departmentService.save(department));
    }

    /**
     * 修改科室
     */
    @ApiOperation(value = "修改科室")
    @PreAuthorize("@ss.hasPermi('system:department:edit')")
    @Log(title = "科室", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Department department) {
        return toAjax(departmentService.updateById(department));
    }


    /**
     * 删除科室
     */
    @ApiOperation(value = "删除科室")
    @PreAuthorize("@ss.hasPermi('system:department:remove')")
    @Log(title = "科室", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(departmentService.removeBatchByIds(Arrays.asList(ids)));
    }
}
