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
 * 检查检验申请对象 checkapply
 *
 * @author lhl
 * @date 2023-07-04
 */
@Data
@Accessors(chain = true)
@TableName("checkapply")
@ApiModel(value = "Checkapply对象", description = "检查检验申请")
public class Checkapply extends BaseEntity
        {
private static final long serialVersionUID=1L;

    /** id */
    @ApiModelProperty("id")
        @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /** 申请名称 */
            @Excel(name = "申请名称")
    @ApiModelProperty("申请名称")
        @TableField("Name")
    private String name;

    /** 病历id */
            @Excel(name = "病历id")
    @ApiModelProperty("病历id")
        @TableField("Medical_Id")
    private Long medicalId;

    /** 申请时间 */
            @JsonFormat(pattern = "yyyy-MM-dd")
            @Excel(name = "申请时间", width = 30, dateFormat = "yyyy-MM-dd")
    @ApiModelProperty("申请时间")
        @TableField("Creation_Time")
    private Date creationTime;

    /** 总金额 */
            @Excel(name = "总金额")
    @ApiModelProperty("总金额")
        @TableField("Total_Sum")
    private BigDecimal totalSum;

    /** 目的要求 */
            @Excel(name = "目的要求")
    @ApiModelProperty("目的要求")
        @TableField("Objective")
    private String objective;

    /** 开立医生id */
            @Excel(name = "开立医生id")
    @ApiModelProperty("开立医生id")
        @TableField("User_Id")
    private Long userId;

    /** 状态 */
            @Excel(name = "状态")
    @ApiModelProperty("状态")
        @TableField("state")
    private Long state;

    /** 发票编号（删除） */
            @Excel(name = "发票编号", readConverterExp = "删=除")
    @ApiModelProperty("发票编号（删除）")
        @TableField("Invoice_Number")
    private String invoiceNumber;

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
