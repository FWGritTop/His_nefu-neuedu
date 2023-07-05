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
 * 病历信息对象 medicalrecord
 *
 * @author lhl&ljp
 * @date 2023-07-05
 */
@Data
@Accessors(chain = true)
@TableName("medicalrecord")
@ApiModel(value = "Medicalrecord对象", description = "病历信息")
public class Medicalrecord extends BaseEntity
        {
private static final long serialVersionUID=1L;

    /** id */
    @ApiModelProperty("id")
        @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /** 病历号 */
            @Excel(name = "病历号")
    @ApiModelProperty("病历号")
        @TableField("Case_Number")
    private String caseNumber;

    /** 挂号id */
            @Excel(name = "挂号id")
    @ApiModelProperty("挂号id")
        @TableField("Register_Id")
    private Long registerId;

    /** 主诉 */
            @Excel(name = "主诉")
    @ApiModelProperty("主诉")
        @TableField("Medical_Readme")
    private String medicalReadme;

    /** 现病史 */
            @Excel(name = "现病史")
    @ApiModelProperty("现病史")
        @TableField("Medical_Present")
    private String medicalPresent;

    /** 现病治疗情况 */
            @Excel(name = "现病治疗情况")
    @ApiModelProperty("现病治疗情况")
        @TableField("Present_Treat")
    private String presentTreat;

    /** 既往史 */
            @Excel(name = "既往史")
    @ApiModelProperty("既往史")
        @TableField("Medical_History")
    private String medicalHistory;

    /** 过敏史 */
            @Excel(name = "过敏史")
    @ApiModelProperty("过敏史")
        @TableField("Medical_Allergy")
    private String medicalAllergy;

    /** 体格检查 */
            @Excel(name = "体格检查")
    @ApiModelProperty("体格检查")
        @TableField("Medical_Physique")
    private String medicalPhysique;

    /** 检查建议 */
            @Excel(name = "检查建议")
    @ApiModelProperty("检查建议")
        @TableField("Test_Order")
    private String testOrder;

    /** 检验建议 */
            @Excel(name = "检验建议")
    @ApiModelProperty("检验建议")
        @TableField("Check_Order")
    private String checkOrder;

    /** 检查结果 */
            @Excel(name = "检查结果")
    @ApiModelProperty("检查结果")
        @TableField("Medical_Tested")
    private String medicalTested;

    /** 检验结果 */
            @Excel(name = "检验结果")
    @ApiModelProperty("检验结果")
        @TableField("Medical_Checked")
    private String medicalChecked;

    /** 诊断结果 */
            @Excel(name = "诊断结果")
    @ApiModelProperty("诊断结果")
        @TableField("Medical_Diagnosis")
    private String medicalDiagnosis;

    /** 处理意见 */
            @Excel(name = "处理意见")
    @ApiModelProperty("处理意见")
        @TableField("Medical_Handling")
    private String medicalHandling;

    /** 病历状态 */
            @Excel(name = "病历状态")
    @ApiModelProperty("病历状态")
        @TableField("Case_State")
    private String caseState;

    /** 删除标记 */
            @Excel(name = "删除标记")
    @ApiModelProperty("删除标记")
        @TableField("DelMark")
    private String delmark;



        }
