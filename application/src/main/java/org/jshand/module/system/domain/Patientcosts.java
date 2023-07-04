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
 * 患者费用明细对象 patientcosts
 *
 * @author lhl
 * @date 2023-07-04
 */
@Data
@Accessors(chain = true)
@TableName("patientcosts")
@ApiModel(value = "Patientcosts对象", description = "患者费用明细")
public class Patientcosts extends BaseEntity
        {
private static final long serialVersionUID=1L;

    /** ID主键 */
    @ApiModelProperty("ID主键")
        @TableId(value = "ID", type = IdType.AUTO)
    private Long id;

    /** 挂号ID */
            @Excel(name = "挂号ID")
    @ApiModelProperty("挂号ID")
        @TableField("RegistID")
    private Long registid;

    /** 发票ID */
            @Excel(name = "发票ID")
    @ApiModelProperty("发票ID")
        @TableField("InvoiceID")
    private Long invoiceid;

    /** 项目ID */
            @Excel(name = "项目ID")
    @ApiModelProperty("项目ID")
        @TableField("ItemID")
    private Long itemid;

    /** 项目类型 1-非药品 2-药品 */
            @Excel(name = "项目类型 1-非药品 2-药品")
    @ApiModelProperty("项目类型 1-非药品 2-药品")
        @TableField("ItemType")
    private Long itemtype;

    /** 项目名称 */
            @Excel(name = "项目名称")
    @ApiModelProperty("项目名称")
        @TableField("Name")
    private String name;

    /** 项目单价 */
            @Excel(name = "项目单价")
    @ApiModelProperty("项目单价")
        @TableField("Price")
    private BigDecimal price;

    /** 数量 */
            @Excel(name = "数量")
    @ApiModelProperty("数量")
        @TableField("Amount")
    private BigDecimal amount;

    /** 执行科室ID */
            @Excel(name = "执行科室ID")
    @ApiModelProperty("执行科室ID")
        @TableField("DeptID")
    private Long deptid;

    /** 开立人员ID */
            @Excel(name = "开立人员ID")
    @ApiModelProperty("开立人员ID")
        @TableField("CreateOperID")
    private Long createoperid;

    /** 收/退费时间 */
            @JsonFormat(pattern = "yyyy-MM-dd")
            @Excel(name = "收/退费时间", width = 30, dateFormat = "yyyy-MM-dd")
    @ApiModelProperty("收/退费时间")
        @TableField("PayTime")
    private Date paytime;

    /** 收/退费人员ID */
            @Excel(name = "收/退费人员ID")
    @ApiModelProperty("收/退费人员ID")
        @TableField("RegisterID")
    private Long registerid;

    /** 收费方式 */
            @Excel(name = "收费方式")
    @ApiModelProperty("收费方式")
        @TableField("FeeType")
    private Long feetype;

    /** 退费对应记录ID */
            @Excel(name = "退费对应记录ID")
    @ApiModelProperty("退费对应记录ID")
        @TableField("BackID")
    private Long backid;


        }
