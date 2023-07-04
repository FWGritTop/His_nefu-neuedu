package org.jshand.module.system.domain;

    import java.math.BigDecimal;

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
 * 非药品收费对象 fmeditem
 *
 * @author FireWin
 * @date 2023-07-03
 */
@Data
@Accessors(chain = true)
@TableName("fmeditem")
@ApiModel(value = "Fmeditem对象", description = "非药品收费")
public class Fmeditem extends BaseEntity
        {
private static final long serialVersionUID=1L;

    /** ID主键 */
    @ApiModelProperty("ID主键")
        @TableId(value = "ID", type = IdType.AUTO)
    private Long id;

    /** 项目编码 */
            @Excel(name = "项目编码")
    @ApiModelProperty("项目编码")
        @TableField("ItemCode")
    private String itemcode;

    /** 项目名称 */
            @Excel(name = "项目名称")
    @ApiModelProperty("项目名称")
        @TableField("ItemName")
    private String itemname;

    /** 规格 */
            @Excel(name = "规格")
    @ApiModelProperty("规格")
        @TableField("Format")
    private String format;

    /** 单价 */
            @Excel(name = "单价")
    @ApiModelProperty("单价")
        @TableField("Price")
    private BigDecimal price;

    /** 所属费用科目ID */
            @Excel(name = "所属费用科目ID")
    @ApiModelProperty("所属费用科目ID")
        @TableField("ExpClassID")
    private Long expclassid;

    /** 执行科室ID */
            @Excel(name = "执行科室ID")
    @ApiModelProperty("执行科室ID")
        @TableField("DeptID")
    private Long deptid;

    /** 拼音助记码 */
            @Excel(name = "拼音助记码")
    @ApiModelProperty("拼音助记码")
        @TableField("MnemonicCode")
    private String mnemoniccode;


    /** 项目类型 */
            @Excel(name = "项目类型")
    @ApiModelProperty("项目类型")
        @TableField("RecordType")
    private Long recordtype;

    /** 删除标记 */
    @ApiModelProperty("删除标记")
        @TableField("DelMark")
    private Long delmark;

        }
