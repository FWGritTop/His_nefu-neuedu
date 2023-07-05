<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
                  <el-form-item label="病历号" prop="caseNumber">
                    <el-input
                        v-model="queryParams.caseNumber"
                        placeholder="请输入病历号"
                        clearable
                        @keyup.enter.native="handleQuery"
                    />
                  </el-form-item>
                  <el-form-item label="挂号id" prop="registerId">
                    <el-input
                        v-model="queryParams.registerId"
                        placeholder="请输入挂号id"
                        clearable
                        @keyup.enter.native="handleQuery"
                    />
                  </el-form-item>
                  <el-form-item label="检查建议" prop="testOrder">
                    <el-input
                        v-model="queryParams.testOrder"
                        placeholder="请输入检查建议"
                        clearable
                        @keyup.enter.native="handleQuery"
                    />
                  </el-form-item>
                  <el-form-item label="检验建议" prop="checkOrder">
                    <el-input
                        v-model="queryParams.checkOrder"
                        placeholder="请输入检验建议"
                        clearable
                        @keyup.enter.native="handleQuery"
                    />
                  </el-form-item>
                  <el-form-item label="病历状态" prop="caseState">
                    <el-input
                        v-model="queryParams.caseState"
                        placeholder="请输入病历状态"
                        clearable
                        @keyup.enter.native="handleQuery"
                    />
                  </el-form-item>
                  <el-form-item label="删除标记" prop="delmark">
                    <el-input
                        v-model="queryParams.delmark"
                        placeholder="请输入删除标记"
                        clearable
                        @keyup.enter.native="handleQuery"
                    />
                  </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
            type="primary"
            plain
            icon="el-icon-plus"
            size="mini"
            @click="handleAdd"
            v-hasPermi="['system:medicalrecord:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
            type="success"
            plain
            icon="el-icon-edit"
            size="mini"
            :disabled="single"
            @click="handleUpdate"
            v-hasPermi="['system:medicalrecord:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
            type="danger"
            plain
            icon="el-icon-delete"
            size="mini"
            :disabled="multiple"
            @click="handleDelete"
            v-hasPermi="['system:medicalrecord:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
            type="warning"
            plain
            icon="el-icon-download"
            size="mini"
            @click="handleExport"
            v-hasPermi="['system:medicalrecord:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="medicalrecordList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
              <el-table-column label="病历号" align="center" prop="caseNumber" />
              <el-table-column label="挂号id" align="center" prop="registerId" />
              <el-table-column label="主诉" align="center" prop="medicalReadme" />
              <el-table-column label="现病史" align="center" prop="medicalPresent" />
              <el-table-column label="现病治疗情况" align="center" prop="presentTreat" />
              <el-table-column label="既往史" align="center" prop="medicalHistory" />
              <el-table-column label="过敏史" align="center" prop="medicalAllergy" />
              <el-table-column label="体格检查" align="center" prop="medicalPhysique" />
              <el-table-column label="检查建议" align="center" prop="testOrder" />
              <el-table-column label="检验建议" align="center" prop="checkOrder" />
              <el-table-column label="检查结果" align="center" prop="medicalTested" />
              <el-table-column label="检验结果" align="center" prop="medicalChecked" />
      <el-table-column label="检查申请操作" align="center" width="100px">
        <template slot-scope="scope">
          <el-button
            type="danger"
            size="mini"
            @click="handleAdd_check"
          >检查申请</el-button>
        </template>
      </el-table-column>
              <el-table-column label="诊断结果" align="center" prop="medicalDiagnosis" />
              <el-table-column label="处理意见" align="center" prop="medicalHandling" />
              <el-table-column label="病历状态" align="center" prop="caseState">
                <template slot-scope="scope">
                      <dict-tag :options="dict.type.case_state" :value="scope.row.caseState"/>
                </template>
              </el-table-column>
              <el-table-column label="删除标记" align="center" prop="delmark" />
              <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
              size="mini"
              type="text"
              icon="el-icon-edit"
              @click="handleUpdate(scope.row)"
              v-hasPermi="['system:medicalrecord:edit']"
          >修改</el-button>
          <el-button
              size="mini"
              type="text"
              icon="el-icon-delete"
              @click="handleDelete(scope.row)"
              v-hasPermi="['system:medicalrecord:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
        v-show="total>0"
        :total="total"
        :page.sync="queryParams.pageNum"
        :limit.sync="queryParams.pageSize"
        @pagination="getList"
    />

    <!--添加检查申请表对话框-->
    <el-dialog :title="title_check" :visible.sync="open_check" width="500px" append-to-body>
      <el-form ref="form_check" :model="form_check" :rules="rules" label-width="80px">
            <el-form-item label="申请名称" prop="name">
              <el-input v-model="form_check.name" placeholder="请输入申请名称" />
            </el-form-item>
            <el-form-item label="病历id" prop="medicalId">
              <el-input v-model="form_check.medicalId" placeholder="请输入病历id" />
            </el-form-item>
            <el-form-item label="申请时间" prop="creationTime">
              <el-date-picker clearable
                              v-model="form_check.creationTime"
                              type="date"
                              value-format="yyyy-MM-dd"
                              placeholder="请选择申请时间">
              </el-date-picker>
            </el-form-item>
            <el-form-item label="总金额" prop="totalSum">
              <el-input v-model="form_check.totalSum" placeholder="请输入总金额" />
            </el-form-item>
            <el-form-item label="目的要求" prop="objective">
              <el-input v-model="form_check.objective" type="textarea" placeholder="请输入内容" />
            </el-form-item>
            <el-form-item label="开立医生id" prop="userId">
              <el-input v-model="form_check.userId" placeholder="请输入开立医生id" />
            </el-form-item>
            <el-form-item label="状态" prop="state">
              <el-input v-model="form_check.state" placeholder="请输入状态" />
            </el-form-item>
            <el-form-item label="发票编号" prop="invoiceNumber">
              <el-input v-model="form_check.invoiceNumber" placeholder="请输入发票编号" />
            </el-form-item>
            <el-form-item label="删除标记" prop="delmark">
              <el-input v-model="form_check.delmark" placeholder="请输入删除标记" />
            </el-form-item>
            <el-form-item label="删除标记" prop="isDelete">
              <el-input v-model="form_check.isDelete" placeholder="请输入删除标记" />
            </el-form-item>
            <el-form-item label="备注" prop="remark">
              <el-input v-model="form_check.remark" placeholder="请输入备注" />
            </el-form-item>
          </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm_check">确 定</el-button>
        <el-button @click="cancel_check">取 消</el-button>
      </div>
    </el-dialog>
    <!-- 添加或修改病历信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
                        <el-form-item label="病历号" prop="caseNumber">
                          <el-input v-model="form.caseNumber" placeholder="请输入病历号" />
                        </el-form-item>
                        <el-form-item label="挂号id" prop="registerId">
                          <el-input v-model="form.registerId" placeholder="请输入挂号id" />
                        </el-form-item>
                        <el-form-item label="主诉" prop="medicalReadme">
                          <el-input v-model="form.medicalReadme" type="textarea" placeholder="请输入内容" />
                        </el-form-item>
                        <el-form-item label="现病史" prop="medicalPresent">
                          <el-input v-model="form.medicalPresent" type="textarea" placeholder="请输入内容" />
                        </el-form-item>
                        <el-form-item label="现病治疗情况" prop="presentTreat">
                          <el-input v-model="form.presentTreat" type="textarea" placeholder="请输入内容" />
                        </el-form-item>
                        <el-form-item label="既往史" prop="medicalHistory">
                          <el-input v-model="form.medicalHistory" type="textarea" placeholder="请输入内容" />
                        </el-form-item>
                        <el-form-item label="过敏史" prop="medicalAllergy">
                          <el-input v-model="form.medicalAllergy" type="textarea" placeholder="请输入内容" />
                        </el-form-item>
                        <el-form-item label="体格检查" prop="medicalPhysique">
                          <el-input v-model="form.medicalPhysique" type="textarea" placeholder="请输入内容" />
                        </el-form-item>
                        <el-form-item label="检查建议" prop="testOrder">
                          <el-input v-model="form.testOrder" placeholder="请输入检查建议" />
                        </el-form-item>
                        <el-form-item label="检验建议" prop="checkOrder">
                          <el-input v-model="form.checkOrder" placeholder="请输入检验建议" />
                        </el-form-item>
                        <el-form-item label="检查结果" prop="medicalTested">
                          <el-input v-model="form.medicalTested" type="textarea" placeholder="请输入内容" />
                        </el-form-item>
                        <el-form-item label="检验结果" prop="medicalChecked">
                          <el-input v-model="form.medicalChecked" type="textarea" placeholder="请输入内容" />
                        </el-form-item>
                        <el-form-item label="诊断结果" prop="medicalDiagnosis">
                          <el-input v-model="form.medicalDiagnosis" type="textarea" placeholder="请输入内容" />
                        </el-form-item>
                        <el-form-item label="处理意见" prop="medicalHandling">
                          <el-input v-model="form.medicalHandling" type="textarea" placeholder="请输入内容" />
                        </el-form-item>
                        <el-form-item label="病历状态" prop="caseState">
                          <el-select v-model="form.caseState" placeholder="请选择病历状态" />
                          <el-option
                            v-for="(item, index) in caseStateOption"
                            :key="index"
                            :label="item.label"
                            :value="item.value"
                            :disabled="item.disabled"
                          ></el-option>
                        </el-form-item>
                        <el-form-item label="删除标记" prop="delmark">
                          <el-input v-model="form.delmark" placeholder="请输入删除标记" />
                        </el-form-item>
                        <el-form-item label="删除标记" prop="isDelete">
                          <el-input v-model="form.isDelete" placeholder="请输入删除标记" />
                        </el-form-item>
                        <el-form-item label="备注" prop="remark">
                          <el-input v-model="form.remark" placeholder="请输入备注" />
                        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
  import { listMedicalrecord, getMedicalrecord, delMedicalrecord, addMedicalrecord, updateMedicalrecord } from "@/api/system/medicalrecord";
  import { addCheckapply} from "@/api/system/checkapply";

  export default {
    name: "Medicalrecord",
    dicts:["case_state"],
    data() {
      return {
        // 遮罩层
        loading: true,
        // 选中数组
        ids: [],
        // 非单个禁用
        single: true,
        // 非多个禁用
        multiple: true,
        // 显示搜索条件
        showSearch: true,
        // 总条数
        total: 0,
        // 病历信息表格数据
              medicalrecordList: [],
        // 弹出层标题
        title: "",
        title_check: "",
        // 是否显示弹出层
        open: false,
        open_check:false,
        // 查询参数
        queryParams: {
          pageNum: 1,
          pageSize: 10,
                        caseNumber: null,
                        registerId: null,
                        medicalReadme: null,
                        medicalPresent: null,
                        presentTreat: null,
                        medicalHistory: null,
                        medicalAllergy: null,
                        medicalPhysique: null,
                        testOrder: null,
                        checkOrder: null,
                        medicalTested: null,
                        medicalChecked: null,
                        medicalDiagnosis: null,
                        medicalHandling: null,
                        caseState: undefined,
                        delmark: null,
        },
        // 表单参数
        form: {},
        form_check:{
          name: null,
          medicalId: null,
          creationTime: null,
          totalSum: null,
          objective: null,
          userId: null,
          state: null,
          invoiceNumber: null,
          delmark: null,
        },
        // 表单校验
        rules: {
          caseNumber: [
            { required: true, message: "病历号不能为空", trigger: "blur" }
          ],
          registerId: [
            { required: true, message: "挂号id不能为空", trigger: "blur" }
          ],
          medicalTested: [
            { required: true, message: "检查结果不能为空", trigger: "blur" }
          ],
          CheckAppId:[
            {required: true, message:"检查申请id不能为空", trigger: "blur"}
          ],
          CheckProjId:[
            {required: true, message:"检查项目id不能为空", trigger: "blur"}
          ],
          caseState:[],
        },
        caseStateOption: [
          {
            label: "待诊断",
            value: 0,
          },
          {
            label: "已诊断",
            value: 1,
          },
          {
            label: "已中断",
            value: 2,
          },
        ],
      };
    },
    created() {
      this.getList();
    },
    methods: {
      /** 查询病历信息列表 */
      getList() {
        this.loading = true;
        listMedicalrecord(this.queryParams).then(response => {
          this.medicalrecordList = response.records;
          this.total = response.total;
          this.loading = false;
        });
      },
      // 取消按钮
      cancel() {
        this.open = false;
        this.reset();
      },
      cancel_check() {
        this.open_check = false;
        this.reset_check();
      },
      // 表单重置
      reset() {
        this.form = {
                        id: null,
                        caseNumber: null,
                        registerId: null,
                        medicalReadme: null,
                        medicalPresent: null,
                        presentTreat: null,
                        medicalHistory: null,
                        medicalAllergy: null,
                        medicalPhysique: null,
                        testOrder: null,
                        checkOrder: null,
                        medicalTested: null,
                        medicalChecked: null,
                        medicalDiagnosis: null,
                        medicalHandling: null,
                        caseState: undefined,
                        delmark: null,
                        isDelete: null,
                        remark: null,
                        updateTime: null,
                        updateBy: null,
                        createBy: null,
                        createTime: null
        };
        this.resetForm("form");
      },
      reset_check() {
        this.form = {
          name: null,
          medicalId: null,
          creationTime: null,
          totalSum: null,
          objective: null,
          userId: null,
          state: null,
          invoiceNumber: null,
          delmark: null,
        };
        this.resetForm("form_check");
      },
      /** 搜索按钮操作 */
      handleQuery() {
        this.queryParams.pageNum = 1;
        this.getList();
      },
      /** 重置按钮操作 */
      resetQuery() {
        this.resetForm("queryForm");
        this.handleQuery();
      },
      // 多选框选中数据
      handleSelectionChange(selection) {
        this.ids = selection.map(item => item.id)
        this.single = selection.length!==1
        this.multiple = !selection.length
      },
      /** 新增按钮操作 */
      handleAdd() {
        this.reset();
        this.open = true;
        this.title = "添加病历信息";
      },
      handleAdd_check() {
        this.reset_check();
        this.open_check = true;
        this.title_check = "填写检验申请表";
      },
      /** 修改按钮操作 */
      handleUpdate(row) {
        this.reset();
        const id = row.id || this.ids
        getMedicalrecord(id).then(response => {
          this.form = response.data;
          this.open = true;
          this.title = "修改病历信息";
        });
      },
      /** 提交按钮 */
      submitForm() {
        this.$refs["form"].validate(valid => {
          if (valid) {
            if (this.form.id != null) {
              updateMedicalrecord(this.form).then(response => {
                this.$modal.msgSuccess("修改成功");
                this.open = false;
                this.getList();
              });
            } else {
              addMedicalrecord(this.form).then(response => {
                this.$modal.msgSuccess("新增成功");
                this.open = false;
                this.getList();
              });
            }
          }
        });
      },
      submitForm_check() {
        this.$refs["form_check"].validate(valid => {
          if (valid) {
            if (this.form_check.id != null) {
                this.$modal.msgWarning("申请已存在");
                this.open_check = false;
              }
            else {
              addCheckapply(this.form_check).then(response => {
                this.$modal.msgSuccess("新增申请成功");
                this.open_check = false;
              });
            }
          }
        });
      },
      /** 删除按钮操作 */
      handleDelete(row) {
        const ids = row.id || this.ids;
        this.$modal.confirm('是否确认删除病历信息编号为"' + ids + '"的数据项？').then(function() {
          return delMedicalrecord(ids);
        }).then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
        }).catch(() => {});
      },
  /** 导出按钮操作 */
  handleExport() {
    this.download('system/medicalrecord/export', {
      ...this.queryParams
    }, `medicalrecord_${new Date().getTime()}.xlsx`)
  }
  }
  };
</script>
