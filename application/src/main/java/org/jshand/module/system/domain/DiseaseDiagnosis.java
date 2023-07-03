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
 * 病历疾病诊断对象 DiseaseDiagnosis
 *
 * @author lhl
 * @date 2023-07-03
 */
@Data
@Accessors(chain = true)
@TableName("DiseaseDiagnosis")
@ApiModel(value = "DiseaseDiagnosis对象", description = "病历疾病诊断")
public class DiseaseDiagnosis extends BaseEntity
        {
private static final long serialVersionUID=1L;

    /** id */
    @ApiModelProperty("id")
        @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /** 病历id */
            @Excel(name = "病历id")
    @ApiModelProperty("病历id")
        @TableField("MedicalId")
    private Long medicalid;

    /** 疾病id */
            @Excel(name = "疾病id")
    @ApiModelProperty("疾病id")
        @TableField("DrugId")
    private Long drugid;

    /** 状态 */
            @Excel(name = "状态")
    @ApiModelProperty("状态")
        @TableField("state")
    private String state;

//    /** 删除标记 */
//    @ApiModelProperty("删除标记")
//        @TableField("is_delete")
//    private Long isDelete;
//

        }
