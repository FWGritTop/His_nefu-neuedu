package org.jshand.module.system.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;
import org.jshand.support.common.annotation.Excel;
import org.jshand.support.common.core.domain.BaseEntity;

/**
 * 科室对象 department
 *
 * @author lhl
 * @date 2023-07-03
 */
@Data
@Accessors(chain = true)
@TableName("department")
@ApiModel(value = "Department对象", description = "科室")
public class Department extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * ID主键
     */
    @ApiModelProperty("ID主键")
    @TableId(value = "ID", type = IdType.AUTO)
    private Long id;

    /**
     * 科室编码
     */
    @Excel(name = "科室编码")
    @ApiModelProperty("科室编码")
    @TableField("DeptCode")
    private String deptcode;

    /**
     * 科室名称
     */
    @Excel(name = "科室名称")
    @ApiModelProperty("科室名称")
    @TableField("DeptName")
    private String deptname;

    /**
     * 科室分类
     */
    @Excel(name = "科室分类")
    @ApiModelProperty("科室分类")
    @TableField("DeptCategoryID")
    private Long deptcategoryid;

    /**
     * 科室类型
     */
    @Excel(name = "科室类型")
    @ApiModelProperty("科室类型")
    @TableField("DeptType")
    private Long depttype;


}