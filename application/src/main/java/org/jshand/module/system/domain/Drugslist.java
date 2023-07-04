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
 * 成品药对象 drugs
 *
 * @author ljp
 * @date 2023-07-04
 */
@Data
@Accessors(chain = true)
@TableName("drugs")
@ApiModel(value = "Drugslist对象", description = "成品药")
public class Drugslist extends BaseEntity
        {
private static final long serialVersionUID=1L;

    /** id */
    @ApiModelProperty("id")
        @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /** 药品编码 */
            @Excel(name = "药品编码")
    @ApiModelProperty("药品编码")
        @TableField("Drugs_Code")
    private String drugsCode;

    /** 药品名称 */
            @Excel(name = "药品名称")
    @ApiModelProperty("药品名称")
        @TableField("Drugs_Name")
    private String drugsName;

    /** 药品规格 */
            @Excel(name = "药品规格")
    @ApiModelProperty("药品规格")
        @TableField("Drugs_Format")
    private String drugsFormat;

    /** 包装单位 */
            @Excel(name = "包装单位")
    @ApiModelProperty("包装单位")
        @TableField("Drugs_Unit")
    private String drugsUnit;

    /** 生产厂家 */
            @Excel(name = "生产厂家")
    @ApiModelProperty("生产厂家")
        @TableField("Manufacturer")
    private String manufacturer;

    /** 药品剂型 */
            @Excel(name = "药品剂型")
    @ApiModelProperty("药品剂型")
        @TableField("Drugs_Dosage")
    private String drugsDosage;

    /** 药品类型 */
            @Excel(name = "药品类型")
    @ApiModelProperty("药品类型")
        @TableField("Drugs_Type")
    private String drugsType;

    /** 药品单价 */
            @Excel(name = "药品单价")
    @ApiModelProperty("药品单价")
        @TableField("Drugs_Price")
    private BigDecimal drugsPrice;

    /** 拼音助记码 */
            @Excel(name = "拼音助记码")
    @ApiModelProperty("拼音助记码")
        @TableField("Mnemonic_Code")
    private String mnemonicCode;



        }
