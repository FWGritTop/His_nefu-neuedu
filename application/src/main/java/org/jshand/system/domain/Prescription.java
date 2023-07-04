package org.jshand.system.domain;

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
 * 成药处方对象 prescription
 *
 * @author ljp
 * @date 2023-07-03
 */
@Data
@Accessors(chain = true)
@TableName("prescription")
@ApiModel(value = "Prescription对象", description = "成药处方")
public class Prescription extends BaseEntity
        {
private static final long serialVersionUID=1L;

    /** id */
    @ApiModelProperty("id")
        @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /** 病历id */
            @Excel(name = "病历id")
    @ApiModelProperty("病历id")
        @TableField("Medical_Id")
    private Long medicalId;

    /** 开立医生id */
            @Excel(name = "开立医生id")
    @ApiModelProperty("开立医生id")
        @TableField("User_Id")
    private Long userId;

    /** 处方名称 */
            @Excel(name = "处方名称")
    @ApiModelProperty("处方名称")
        @TableField("Prescription_Name")
    private String prescriptionName;

    /** 处方状态 */
            @Excel(name = "处方状态")
    @ApiModelProperty("处方状态")
        @TableField("Prescription_State")
    private Long prescriptionState;

    /** 开立时间 */
            @JsonFormat(pattern = "yyyy-MM-dd")
            @Excel(name = "开立时间", width = 30, dateFormat = "yyyy-MM-dd")
    @ApiModelProperty("开立时间")
        @TableField("Prescription_Time")
    private Date prescriptionTime;

    /** 发票编号 */
            @Excel(name = "发票编号")
    @ApiModelProperty("发票编号")
        @TableField("Invoice_id")
    private String invoiceId;

    /** 删除标记 */
            @Excel(name = "删除标记")
    @ApiModelProperty("删除标记")
        @TableField("DelMark")
    private String delmark;




        }
