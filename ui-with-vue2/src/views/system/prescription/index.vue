<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
                  <el-form-item label="病历id" prop="medicalId">
                    <el-input
                        v-model="queryParams.medicalId"
                        placeholder="请输入病历id"
                        clearable
                        @keyup.enter.native="handleQuery"
                    />
                  </el-form-item>
                  <el-form-item label="开立医生id" prop="userId">
                    <el-input
                        v-model="queryParams.userId"
                        placeholder="请输入开立医生id"
                        clearable
                        @keyup.enter.native="handleQuery"
                    />
                  </el-form-item>
                  <el-form-item label="处方名称" prop="prescriptionName">
                    <el-input
                        v-model="queryParams.prescriptionName"
                        placeholder="请输入处方名称"
                        clearable
                        @keyup.enter.native="handleQuery"
                    />
                  </el-form-item>
                  <el-form-item label="处方状态" prop="prescriptionState">
                    <el-input
                        v-model="queryParams.prescriptionState"
                        placeholder="请输入处方状态"
                        clearable
                        @keyup.enter.native="handleQuery"
                    />
                  </el-form-item>
                  <el-form-item label="开立时间" prop="prescriptionTime">
                    <el-date-picker clearable
                                    v-model="queryParams.prescriptionTime"
                                    type="date"
                                    value-format="yyyy-MM-dd"
                                    placeholder="请选择开立时间">
                    </el-date-picker>
                  </el-form-item>
                  <el-form-item label="发票编号" prop="invoiceId">
                    <el-input
                        v-model="queryParams.invoiceId"
                        placeholder="请输入发票编号"
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
            v-hasPermi="['system:prescription:add']"
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
            v-hasPermi="['system:prescription:edit']"
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
            v-hasPermi="['system:prescription:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
            type="warning"
            plain
            icon="el-icon-download"
            size="mini"
            @click="handleExport"
            v-hasPermi="['system:prescription:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="prescriptionList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
              <el-table-column label="id" align="center" prop="id" />
              <el-table-column label="病历id" align="center" prop="medicalId" />
              <el-table-column label="开立医生id" align="center" prop="userId" />
              <el-table-column label="处方名称" align="center" prop="prescriptionName" />
              <el-table-column label="处方状态" align="center" prop="prescriptionState" />
              <el-table-column label="开立时间" align="center" prop="prescriptionTime" width="180">
                <template slot-scope="scope">
                  <span>{{ parseTime(scope.row.prescriptionTime, '{y}-{m}-{d}') }}</span>
                </template>
              </el-table-column>
              <el-table-column label="发票编号" align="center" prop="invoiceId" />
              <el-table-column label="删除标记" align="center" prop="delmark" />
              <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
              size="mini"
              type="text"
              icon="el-icon-edit"
              @click="handleUpdate(scope.row)"
              v-hasPermi="['system:prescription:edit']"
          >修改</el-button>
          <el-button
              size="mini"
              type="text"
              icon="el-icon-delete"
              @click="handleDelete(scope.row)"
              v-hasPermi="['system:prescription:remove']"
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

    <el-pagination
      @size-change="getList"
      @current-change="getList"
      :current-page.sync="queryParams.current"
      :page-size.sync= "queryParams.size"
      layout="total, sizes, prev, pager, next, jumper"
      :total="total"
    ></el-pagination>

    <!-- 添加或修改成药处方对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
                        <el-form-item label="病历id" prop="medicalId">
                          <el-input v-model="form.medicalId" placeholder="请输入病历id" />
                        </el-form-item>
                        <el-form-item label="开立医生id" prop="userId">
                          <el-input v-model="form.userId" placeholder="请输入开立医生id" />
                        </el-form-item>
                        <el-form-item label="处方名称" prop="prescriptionName">
                          <el-input v-model="form.prescriptionName" placeholder="请输入处方名称" />
                        </el-form-item>
                        <el-form-item label="处方状态" prop="prescriptionState">
                          <el-input v-model="form.prescriptionState" placeholder="请输入处方状态" />
                        </el-form-item>
                        <el-form-item label="开立时间" prop="prescriptionTime">
                          <el-date-picker clearable
                                          v-model="form.prescriptionTime"
                                          type="date"
                                          value-format="yyyy-MM-dd"
                                          placeholder="请选择开立时间">
                          </el-date-picker>
                        </el-form-item>
                        <el-form-item label="发票编号" prop="invoiceId">
                          <el-input v-model="form.invoiceId" placeholder="请输入发票编号" />
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
  import { listPrescription, getPrescription, delPrescription, addPrescription, updatePrescription } from "@/api/system/prescription";

  export default {
    name: "Prescription",
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
        // 成药处方表格数据
              prescriptionList: [],
        // 弹出层标题
        title: "",
        // 是否显示弹出层
        open: false,
        // 查询参数
        queryParams: {
          pageNum: 1,
          pageSize: 10,
                        medicalId: null,
                        userId: null,
                        prescriptionName: null,
                        prescriptionState: null,
                        prescriptionTime: null,
                        invoiceId: null,
                        delmark: null,
        },
        // 表单参数
        form: {},
        // 表单校验
        rules: {
        }
      };
    },
    created() {
      this.getList();
    },
    methods: {
      /** 查询成药处方列表 */
      getList() {
        this.loading = true;
        listPrescription(this.queryParams).then(response => {
          this.prescriptionList = response.records;
          this.total = response.total;
          this.loading = false;
        });
      },
      // 取消按钮
      cancel() {
        this.open = false;
        this.reset();
      },
      // 表单重置
      reset() {
        this.form = {
                        id: null,
                        medicalId: null,
                        userId: null,
                        prescriptionName: null,
                        prescriptionState: null,
                        prescriptionTime: null,
                        invoiceId: null,
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
        this.title = "添加成药处方";
      },
      /** 修改按钮操作 */
      handleUpdate(row) {
        this.reset();
        const id = row.id || this.ids
        getPrescription(id).then(response => {
          this.form = response.data;
          this.open = true;
          this.title = "修改成药处方";
        });
      },
      /** 提交按钮 */
      submitForm() {
        this.$refs["form"].validate(valid => {
          if (valid) {
            if (this.form.id != null) {
              updatePrescription(this.form).then(response => {
                this.$modal.msgSuccess("修改成功");
                this.open = false;
                this.getList();
              });
            } else {
              addPrescription(this.form).then(response => {
                this.$modal.msgSuccess("新增成功");
                this.open = false;
                this.getList();
              });
            }
          }
        });
      },
      /** 删除按钮操作 */
      handleDelete(row) {
        const ids = row.id || this.ids;
        this.$modal.confirm('是否确认删除成药处方编号为"' + ids + '"的数据项？').then(function() {
          return delPrescription(ids);
        }).then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
        }).catch(() => {});
      },
  /** 导出按钮操作 */
  handleExport() {
    this.download('system/prescription/export', {
      ...this.queryParams
    }, `prescription_${new Date().getTime()}.xlsx`)
  }
  }
  };
</script>
