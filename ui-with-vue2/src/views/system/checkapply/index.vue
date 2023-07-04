<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
                  <el-form-item label="申请名称" prop="name">
                    <el-input
                        v-model="queryParams.name"
                        placeholder="请输入申请名称"
                        clearable
                        @keyup.enter.native="handleQuery"
                    />
                  </el-form-item>
                  <el-form-item label="病历id" prop="medicalId">
                    <el-input
                        v-model="queryParams.medicalId"
                        placeholder="请输入病历id"
                        clearable
                        @keyup.enter.native="handleQuery"
                    />
                  </el-form-item>
                  <el-form-item label="申请时间" prop="creationTime">
                    <el-date-picker clearable
                                    v-model="queryParams.creationTime"
                                    type="date"
                                    value-format="yyyy-MM-dd"
                                    placeholder="请选择申请时间">
                    </el-date-picker>
                  </el-form-item>
                  <el-form-item label="总金额" prop="totalSum">
                    <el-input
                        v-model="queryParams.totalSum"
                        placeholder="请输入总金额"
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
                  <el-form-item label="状态" prop="state">
                    <el-input
                        v-model="queryParams.state"
                        placeholder="请输入状态"
                        clearable
                        @keyup.enter.native="handleQuery"
                    />
                  </el-form-item>
                  <el-form-item label="发票编号" prop="invoiceNumber">
                    <el-input
                        v-model="queryParams.invoiceNumber"
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
            v-hasPermi="['system:checkapply:add']"
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
            v-hasPermi="['system:checkapply:edit']"
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
            v-hasPermi="['system:checkapply:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
            type="warning"
            plain
            icon="el-icon-download"
            size="mini"
            @click="handleExport"
            v-hasPermi="['system:checkapply:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="checkapplyList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
              <el-table-column label="id" align="center" prop="id" />
              <el-table-column label="申请名称" align="center" prop="name" />
              <el-table-column label="病历id" align="center" prop="medicalId" />
              <el-table-column label="申请时间" align="center" prop="creationTime" width="180">
                <template slot-scope="scope">
                  <span>{{ parseTime(scope.row.creationTime, '{y}-{m}-{d}') }}</span>
                </template>
              </el-table-column>
              <el-table-column label="总金额" align="center" prop="totalSum" />
              <el-table-column label="目的要求" align="center" prop="objective" />
              <el-table-column label="医生id" align="center" prop="userId" />
              <el-table-column label="状态" align="center" prop="state" />
              <el-table-column label="发票编号" align="center" prop="invoiceNumber" />
              <el-table-column label="删除标记" align="center" prop="delmark" />
              <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
              size="mini"
              type="text"
              icon="el-icon-edit"
              @click="handleUpdate(scope.row)"
              v-hasPermi="['system:checkapply:edit']"
          >修改</el-button>
          <el-button
              size="mini"
              type="text"
              icon="el-icon-delete"
              @click="handleDelete(scope.row)"
              v-hasPermi="['system:checkapply:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
        v-show="total>0"
        :total="total"
        :page.sync="queryParams.current"
        :limit.sync="queryParams.size"
        @pagination="getList"
    />

    <!-- 添加或修改检查检验申请对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
                        <el-form-item label="申请名称" prop="name">
                          <el-input v-model="form.name" placeholder="请输入申请名称" />
                        </el-form-item>
                        <el-form-item label="病历id" prop="medicalId">
                          <el-input v-model="form.medicalId" placeholder="请输入病历id" />
                        </el-form-item>
                        <el-form-item label="申请时间" prop="creationTime">
                          <el-date-picker clearable
                                          v-model="form.creationTime"
                                          type="date"
                                          value-format="yyyy-MM-dd"
                                          placeholder="请选择申请时间">
                          </el-date-picker>
                        </el-form-item>
                        <el-form-item label="总金额" prop="totalSum">
                          <el-input v-model="form.totalSum" placeholder="请输入总金额" />
                        </el-form-item>
                        <el-form-item label="目的要求" prop="objective">
                          <el-input v-model="form.objective" type="textarea" placeholder="请输入内容" />
                        </el-form-item>
                        <el-form-item label="开立医生id" prop="userId">
                          <el-input v-model="form.userId" placeholder="请输入开立医生id" />
                        </el-form-item>
                        <el-form-item label="状态" prop="state">
                          <el-input v-model="form.state" placeholder="请输入状态" />
                        </el-form-item>
                        <el-form-item label="发票编号" prop="invoiceNumber">
                          <el-input v-model="form.invoiceNumber" placeholder="请输入发票编号" />
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
  import { listCheckapply, getCheckapply, delCheckapply, addCheckapply, updateCheckapply } from "@/api/system/checkapply";

  export default {
    name: "Checkapply",
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
        // 检查检验申请表格数据
              checkapplyList: [],
        // 弹出层标题
        title: "",
        // 是否显示弹出层
        open: false,
        // 查询参数
        queryParams: {
          current: 1,
          size: 10,
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
        // 表单参数
        form: {},
        // 表单校验
        rules: {
        }
      };
    },
    created() {
      this.getList();
      // console.log("11111111111");
    },
    methods: {
      /** 查询检查检验申请列表 */
      getList() {
        this.loading = true;
        listCheckapply(this.queryParams).then(response => {
          this.checkapplyList = response.records;
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
                        name: null,
                        medicalId: null,
                        creationTime: null,
                        totalSum: null,
                        objective: null,
                        userId: null,
                        state: null,
                        invoiceNumber: null,
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
        this.queryParams.current = 1;
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
        this.title = "添加检查检验申请";
      },
      /** 修改按钮操作 */
      handleUpdate(row) {
        this.reset();
        const id = row.id || this.ids
        getCheckapply(id).then(response => {
          this.form = response.data;
          this.open = true;
          this.title = "修改检查检验申请";
        });
      },
      /** 提交按钮 */
      submitForm() {
        this.$refs["form"].validate(valid => {
          if (valid) {
            if (this.form.id != null) {
              updateCheckapply(this.form).then(response => {
                this.$modal.msgSuccess("修改成功");
                this.open = false;
                this.getList();
              });
            } else {
              addCheckapply(this.form).then(response => {
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
        this.$modal.confirm('是否确认删除检查检验申请编号为"' + ids + '"的数据项？').then(function() {
          return delCheckapply(ids);
        }).then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
        }).catch(() => {});
      },
  /** 导出按钮操作 */
  handleExport() {
    this.download('system/checkapply/export', {
      ...this.queryParams
    }, `checkapply_${new Date().getTime()}.xlsx`)
  }
  }
  };
</script>
