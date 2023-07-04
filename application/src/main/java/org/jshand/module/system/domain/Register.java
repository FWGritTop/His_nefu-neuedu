package org.jshand.module.system.domain;

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
 * 挂号信息对象 register
 *
 * @author FireWin
 * @date 2023-07-04
 */
@Data
@Accessors(chain = true)
@TableName("register")
@ApiModel(value = "Register对象", description = "挂号信息")
public class Register extends BaseEntity
        {
private static final long serialVersionUID=1L;

    /** id */
    @ApiModelProperty("id")
        @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /** 真实姓名 */
            @Excel(name = "真实姓名")
    @ApiModelProperty("真实姓名")
        @TableField("RealName")
    private String realname;

    /** 性别 */
            @Excel(name = "性别")
    @ApiModelProperty("性别")
        @TableField("Gender")
    private Long gender;

    /** 身份证号 */
    @ApiModelProperty("身份证号")
        @TableField("IDnumber")
    private String idnumber;

    /** 出生日期 */
    @ApiModelProperty("出生日期")
        @TableField("BirthDate")
    private Date birthdate;

    /** 年龄 */
    @ApiModelProperty("年龄")
        @TableField("Age")
    private Long age;

    /** 年龄类型 */
    @ApiModelProperty("年龄类型")
        @TableField("AgeType")
    private Long agetype;

    /** 家庭住址 */
            @Excel(name = "家庭住址")
    @ApiModelProperty("家庭住址")
        @TableField("HomeAddress")
    private String homeaddress;

    /** 一名患者在同一医院看诊多次，根据患者是否使用同一个病历本，确定该患者的“病历号码”是否相同。 */
            @Excel(name = "一名患者在同一医院看诊多次，根据患者是否使用同一个病历本，确定该患者的“病历号码”是否相同。")
    @ApiModelProperty("一名患者在同一医院看诊多次，根据患者是否使用同一个病历本，确定该患者的“病历号码”是否相同。")
        @TableField("CaseNumber")
    private String casenumber;

    /** 本次看诊日期 */
            @JsonFormat(pattern = "yyyy-MM-dd")
            @Excel(name = "本次看诊日期", width = 30, dateFormat = "yyyy-MM-dd")
    @ApiModelProperty("本次看诊日期")
        @TableField("VisitDate")
    private Date visitdate;

    /** 本次挂号科室ID */
            @Excel(name = "本次挂号科室ID")
    @ApiModelProperty("本次挂号科室ID")
        @TableField("DeptId")
    private Long deptid;

    /** 本次挂号医生id */
            @Excel(name = "本次挂号医生id")
    @ApiModelProperty("本次挂号医生id")
        @TableField("UserId")
    private Long userid;

    /** 本次挂号级别id */
    @ApiModelProperty("本次挂号级别id")
        @TableField("RegistId")
    private Long registid;

    /** 结算类别id */
            @Excel(name = "结算类别id")
    @ApiModelProperty("结算类别id")
        @TableField("SettleID")
    private Long settleid;

    /** 病历本要否 */
    @ApiModelProperty("病历本要否")
        @TableField("IsBook")
    private String isbook;

    /** 挂号时间 */
            @JsonFormat(pattern = "yyyy-MM-dd")
            @Excel(name = "挂号时间", width = 30, dateFormat = "yyyy-MM-dd")
    @ApiModelProperty("挂号时间")
        @TableField("RegisterTime")
    private Date registertime;

    /** 挂号员ID */
    @ApiModelProperty("挂号员ID")
        @TableField("RegisterID")
    private Long registerid;

    /** 本次看诊状态 */
            @Excel(name = "本次看诊状态")
    @ApiModelProperty("本次看诊状态")
        @TableField("VisitState")
    private Long visitstate;

    /** 删除标记 */
    @ApiModelProperty("删除标记")
        @TableField("is_delete")
    private Long isDelete;


        }
