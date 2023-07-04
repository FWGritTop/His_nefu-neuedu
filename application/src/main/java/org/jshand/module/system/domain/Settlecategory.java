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
 * 结算类别对象 settlecategory
 *
 * @author lhl
 * @date 2023-07-04
 */
@Data
@Accessors(chain = true)
@TableName("settlecategory")
@ApiModel(value = "Settlecategory对象", description = "结算类别")
public class Settlecategory extends BaseEntity
        {
private static final long serialVersionUID=1L;

    /** id */
    @ApiModelProperty("id")
        @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /** 类别编码 */
            @Excel(name = "类别编码")
    @ApiModelProperty("类别编码")
        @TableField("SettleCode")
    private String settlecode;

    /** 类别名称 */
            @Excel(name = "类别名称")
    @ApiModelProperty("类别名称")
        @TableField("SettleName")
    private String settlename;

    /** 是否默认 */
            @Excel(name = "是否默认")
    @ApiModelProperty("是否默认")
        @TableField("IsDefault")
    private Long isdefault;

    /** 显示顺序号 */
            @Excel(name = "显示顺序号")
    @ApiModelProperty("显示顺序号")
        @TableField("Sequence")
    private Long sequence;

    /** 1为删除 */
            @Excel(name = "1为删除")
    @ApiModelProperty("1为删除")
        @TableField("DelMark")
    private Long delmark;

    /** 删除标记 */
    @ApiModelProperty("删除标记")
        @TableField("is_delete")
    private Long isDelete;


        }
