package org.jshand.module.system.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;
import org.jshand.support.common.annotation.Excel;
import org.jshand.support.common.core.domain.BaseEntity;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 挂号信息对象 register
 *
 * @author 金山
 * @date 2023-06-29
 */
@Data
@Accessors(chain = true)
@TableName("register")
@ApiModel(value = "Register对象", description = "挂号信息")
public class Register extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 患者ID
     */
    @ApiModelProperty("患者ID")
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 患者名称
     */
    @Excel(name = "患者名称")
    @ApiModelProperty("患者名称")
    @TableField("name")
    private String name;

    /**
     * 出生日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "出生日期", width = 30, dateFormat = "yyyy-MM-dd")
    @ApiModelProperty("出生日期")
    @TableField("birthday")
    private Date birthday;

    /**
     * 性别
     */
    @Excel(name = "性别")
    @ApiModelProperty("性别")
    @TableField("gender")
    private String gender;

    /**
     * 费用
     */
    @Excel(name = "费用")
    @ApiModelProperty("费用")
    @TableField("fee")
    private BigDecimal fee;


}
