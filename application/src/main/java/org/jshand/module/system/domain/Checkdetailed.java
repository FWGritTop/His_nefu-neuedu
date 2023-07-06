package org.jshand.module.system.domain;

    import java.math.BigDecimal;
    import java.util.Date;
    import com.fasterxml.jackson.annotation.JsonFormat;
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
 * 检查申请明细对象 checkdetailed
 *
 * @author lhl
 * @date 2023-07-05
 */
@Data
@Accessors(chain = true)
@TableName("checkdetailed")
@ApiModel(value = "Checkdetailed对象", description = "检查申请明细")
public class Checkdetailed extends BaseEntity
        {
private static final long serialVersionUID=1L;

    /** id */
    @ApiModelProperty("id")
        @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /** 检查申请id */
            @Excel(name = "检查申请id")
    @ApiModelProperty("检查申请id")
        @TableField("CheckAppId")
    private Long checkappid;

    /** 检查项目id */
            @Excel(name = "检查项目id")
    @ApiModelProperty("检查项目id")
        @TableField("CheckProjId")
    private Long checkprojid;

    /** 执行科室id */
            @Excel(name = "执行科室id")
    @ApiModelProperty("执行科室id")
        @TableField("DeptId")
    private Long deptid;

    /** 开立时间 */
            @JsonFormat(pattern = "yyyy-MM-dd")
            @Excel(name = "开立时间", width = 30, dateFormat = "yyyy-MM-dd")
    @ApiModelProperty("开立时间")
        @TableField("CreationTime")
    private Date creationtime;

    /** 检查目的和要求 */
            @Excel(name = "检查目的和要求")
    @ApiModelProperty("检查目的和要求")
        @TableField("Position")
    private String position;

    /** 1 - 已开立未交费
            2 - 已交费未检查
            3 - 已检查无结果
            4 - 有结果 */
            @Excel(name = "1 - 已开立未交费 2 - 已交费未检查 3 - 已检查无结果 4 - 有结果")
    @ApiModelProperty("1 - 已开立未交费 2 - 已交费未检查 3 - 已检查无结果 4 - 有结果")
        @TableField("State")
    private Long state;

    /** 单价 */
            @Excel(name = "单价")
    @ApiModelProperty("单价")
        @TableField("Price")
    private BigDecimal price;

    /** 1 - 检查项
            2 - 检验项
            3 - 处置项 */
            @Excel(name = "1 - 检查项 2 - 检验项 3 - 处置项")
    @ApiModelProperty("1 - 检查项 2 - 检验项 3 - 处置项")
        @TableField("Identification")
    private Long identification;

    /** 检查时间 */
            @JsonFormat(pattern = "yyyy-MM-dd")
            @Excel(name = "检查时间", width = 30, dateFormat = "yyyy-MM-dd")
    @ApiModelProperty("检查时间")
        @TableField("InspectTime")
    private Date inspecttime;

    /** 检查结果 */
            @Excel(name = "检查结果")
    @ApiModelProperty("检查结果")
        @TableField("Result")
    private String result;

    /** 结果时间 */
            @JsonFormat(pattern = "yyyy-MM-dd")
            @Excel(name = "结果时间", width = 30, dateFormat = "yyyy-MM-dd")
    @ApiModelProperty("结果时间")
        @TableField("ResultTime")
    private Date resulttime;

    /** 结果录入人员id */
            @Excel(name = "结果录入人员id")
    @ApiModelProperty("结果录入人员id")
        @TableField("UserId2")
    private Long userid2;

    /** 检查人员id */
            @Excel(name = "检查人员id")
    @ApiModelProperty("检查人员id")
        @TableField("UserId")
    private Long userid;

    /** 删除标记 */
            @Excel(name = "删除标记")
    @ApiModelProperty("删除标记")
        @TableField("DelMark")
    private String delmark;

    /** 删除标记 */
    @ApiModelProperty("删除标记")
        @TableField("is_delete")
    private Long isDelete;


        }
