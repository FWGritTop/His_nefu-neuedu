<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
                  <el-form-item label="挂号ID" prop="registid">
                    <el-input
                        v-model="queryParams.registid"
                        placeholder="请输入挂号ID"
                        clearable
                        @keyup.enter.native="handleQuery"
                    />
                  </el-form-item>
                  <el-form-item label="发票ID" prop="invoiceid">
                    <el-input
                        v-model="queryParams.invoiceid"
                        placeholder="请输入发票ID"
                        clearable
                        @keyup.enter.native="handleQuery"
                    />
                  </el-form-item>
                  <el-form-item label="项目ID" prop="itemid">
                    <el-input
                        v-model="queryParams.itemid"
                        placeholder="请输入项目ID"
                        clearable
                        @keyup.enter.native="handleQuery"
                    />
                  </el-form-item>
                  <el-form-item label="项目名称" prop="name">
                    <el-input
                        v-model="queryParams.name"
                        placeholder="请输入项目名称"
                        clearable
                        @keyup.enter.native="handleQuery"
                    />
                  </el-form-item>
                  <el-form-item label="项目单价" prop="price">
                    <el-input
                        v-model="queryParams.price"
                        placeholder="请输入项目单价"
                        clearable
                        @keyup.enter.native="handleQuery"
                    />
                  </el-form-item>
                  <el-form-item label="数量" prop="amount">
                    <el-input
                        v-model="queryParams.amount"
                        placeholder="请输入数量"
                        clearable
                        @keyup.enter.native="handleQuery"
                    />
                  </el-form-item>
                  <el-form-item label="执行科室ID" prop="deptid">
                    <el-input
                        v-model="queryParams.deptid"
                        placeholder="请输入执行科室ID"
                        clearable
                        @keyup.enter.native="handleQuery"
                    />
                  </el-form-item>
                  <el-form-item label="开立时间" prop="createtime">
                    <el-date-picker clearable
                                    v-model="queryParams.createtime"
                                    type="date"
                                    value-format="yyyy-MM-dd"
                                    placeholder="请选择开立时间">
                    </el-date-picker>
                  </el-form-item>
                  <el-form-item label="开立人员ID" prop="createoperid">
                    <el-input
                        v-model="queryParams.createoperid"
                        placeholder="请输入开立人员ID"
                        clearable
                        @keyup.enter.native="handleQuery"
                    />
                  </el-form-item>
                  <el-form-item label="收/退费时间" prop="paytime">
                    <el-date-picker clearable
                                    v-model="queryParams.paytime"
                                    type="date"
                                    value-format="yyyy-MM-dd"
                                    placeholder="请选择收/退费时间">
                    </el-date-picker>
                  </el-form-item>
                  <el-form-item label="收/退费人员ID" prop="registerid">
                    <el-input
                        v-model="queryParams.registerid"
                        placeholder="请输入收/退费人员ID"
                        clearable
                        @keyup.enter.native="handleQuery"
                    />
                  </el-form-item>
                  <el-form-item label="退费对应记录ID" prop="backid">
                    <el-input
                        v-model="queryParams.backid"
                        placeholder="请输入退费对应记录ID"
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
            v-hasPermi="['system:patientcosts:add']"
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
            v-hasPermi="['system:patientcosts:edit']"
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
            v-hasPermi="['system:patientcosts:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
            type="warning"
            plain
            icon="el-icon-download"
            size="mini"
            @click="handleExport"
            v-hasPermi="['system:patientcosts:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="patientcostsList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
              <el-table-column label="ID主键" align="center" prop="id" />
              <el-table-column label="挂号ID" align="center" prop="registid" />
              <el-table-column label="发票ID" align="center" prop="invoiceid" />
              <el-table-column label="项目ID" align="center" prop="itemid" />
              <el-table-column label="项目类型 1-非药品 2-药品" align="center" prop="itemtype" />
              <el-table-column label="项目名称" align="center" prop="name" />
              <el-table-column label="项目单价" align="center" prop="price" />
              <el-table-column label="数量" align="center" prop="amount" />
              <el-table-column label="执行科室ID" align="center" prop="deptid" />
              <el-table-column label="开立时间" align="center" prop="createtime" width="180">
                <template slot-scope="scope">
                  <span>{{ parseTime(scope.row.createtime, '{y}-{m}-{d}') }}</span>
                </template>
              </el-table-column>
              <el-table-column label="开立人员ID" align="center" prop="createoperid" />
              <el-table-column label="收/退费时间" align="center" prop="paytime" width="180">
                <template slot-scope="scope">
                  <span>{{ parseTime(scope.row.paytime, '{y}-{m}-{d}') }}</span>
                </template>
              </el-table-column>
              <el-table-column label="收/退费人员ID" align="center" prop="registerid" />
              <el-table-column label="收费方式" align="center" prop="feetype" />
              <el-table-column label="退费对应记录ID" align="center" prop="backid" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
              size="mini"
              type="text"
              icon="el-icon-edit"
              @click="handleUpdate(scope.row)"
              v-hasPermi="['system:patientcosts:edit']"
          >修改</el-button>
          <el-button
              size="mini"
              type="text"
              icon="el-icon-delete"
              @click="handleDelete(scope.row)"
              v-hasPermi="['system:patientcosts:remove']"
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

    <!-- 添加或修改患者费用明细对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
                        <el-form-item label="挂号ID" prop="registid">
                          <el-input v-model="form.registid" placeholder="请输入挂号ID" />
                        </el-form-item>
                        <el-form-item label="发票ID" prop="invoiceid">
                          <el-input v-model="form.invoiceid" placeholder="请输入发票ID" />
                        </el-form-item>
                        <el-form-item label="项目ID" prop="itemid">
                          <el-input v-model="form.itemid" placeholder="请输入项目ID" />
                        </el-form-item>
                        <el-form-item label="项目名称" prop="name">
                          <el-input v-model="form.name" placeholder="请输入项目名称" />
                        </el-form-item>
                        <el-form-item label="项目单价" prop="price">
                          <el-input v-model="form.price" placeholder="请输入项目单价" />
                        </el-form-item>
                        <el-form-item label="数量" prop="amount">
                          <el-input v-model="form.amount" placeholder="请输入数量" />
                        </el-form-item>
                        <el-form-item label="执行科室ID" prop="deptid">
                          <el-input v-model="form.deptid" placeholder="请输入执行科室ID" />
                        </el-form-item>
                        <el-form-item label="开立人员ID" prop="createoperid">
                          <el-input v-model="form.createoperid" placeholder="请输入开立人员ID" />
                        </el-form-item>
                        <el-form-item label="收/退费时间" prop="paytime">
                          <el-date-picker clearable
                                          v-model="form.paytime"
                                          type="date"
                                          value-format="yyyy-MM-dd"
                                          placeholder="请选择收/退费时间">
                          </el-date-picker>
                        </el-form-item>
                        <el-form-item label="收/退费人员ID" prop="registerid">
                          <el-input v-model="form.registerid" placeholder="请输入收/退费人员ID" />
                        </el-form-item>
                        <el-form-item label="退费对应记录ID" prop="backid">
                          <el-input v-model="form.backid" placeholder="请输入退费对应记录ID" />
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
  import { listPatientcosts, getPatientcosts, delPatientcosts, addPatientcosts, updatePatientcosts } from "@/api/system/patientcosts";

  export default {
    name: "Patientcosts",
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
        // 患者费用明细表格数据
              patientcostsList: [],
        // 弹出层标题
        title: "",
        // 是否显示弹出层
        open: false,
        // 查询参数
        queryParams: {
          current: 1,
          size: 10,
                        registid: null,
                        invoiceid: null,
                        itemid: null,
                        itemtype: null,
                        name: null,
                        price: null,
                        amount: null,
                        deptid: null,
                        createtime: null,
                        createoperid: null,
                        paytime: null,
                        registerid: null,
                        feetype: null,
                        backid: null
        },
        // 表单参数
        form: {},
        // 表单校验
        rules: {
                        registid: [
                    { required: true, message: "挂号ID不能为空", trigger: "blur" }
                  ],
                        invoiceid: [
                    { required: true, message: "发票ID不能为空", trigger: "blur" }
                  ],
                        itemid: [
                    { required: true, message: "项目ID不能为空", trigger: "blur" }
                  ],
                        itemtype: [
                    { required: true, message: "项目类型 1-非药品 2-药品不能为空", trigger: "change" }
                  ],
                        name: [
                    { required: true, message: "项目名称不能为空", trigger: "blur" }
                  ],
                        price: [
                    { required: true, message: "项目单价不能为空", trigger: "blur" }
                  ],
                        amount: [
                    { required: true, message: "数量不能为空", trigger: "blur" }
                  ],
                        deptid: [
                    { required: true, message: "执行科室ID不能为空", trigger: "blur" }
                  ],
                        createtime: [
                    { required: true, message: "开立时间不能为空", trigger: "blur" }
                  ],
                        createoperid: [
                    { required: true, message: "开立人员ID不能为空", trigger: "blur" }
                  ],
                        paytime: [
                    { required: true, message: "收/退费时间不能为空", trigger: "blur" }
                  ],
                        registerid: [
                    { required: true, message: "收/退费人员ID不能为空", trigger: "blur" }
                  ],
                        feetype: [
                    { required: true, message: "收费方式不能为空", trigger: "change" }
                  ],
        }
      };
    },
    created() {
      this.getList();
    },
    methods: {
      /** 查询患者费用明细列表 */
      getList() {
        this.loading = true;
        listPatientcosts(this.queryParams).then(response => {
          this.patientcostsList = response.records;
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
                        registid: null,
                        invoiceid: null,
                        itemid: null,
                        itemtype: null,
                        name: null,
                        price: null,
                        amount: null,
                        deptid: null,
                        createtime: null,
                        createoperid: null,
                        paytime: null,
                        registerid: null,
                        feetype: null,
                        backid: null
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
        this.title = "添加患者费用明细";
      },
      /** 修改按钮操作 */
      handleUpdate(row) {
        this.reset();
        const id = row.id || this.ids
        getPatientcosts(id).then(response => {
          this.form = response.data;
          this.open = true;
          this.title = "修改患者费用明细";
        });
      },
      /** 提交按钮 */
      submitForm() {
        this.$refs["form"].validate(valid => {
          if (valid) {
            if (this.form.id != null) {
              updatePatientcosts(this.form).then(response => {
                this.$modal.msgSuccess("修改成功");
                this.open = false;
                this.getList();
              });
            } else {
              addPatientcosts(this.form).then(response => {
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
        this.$modal.confirm('是否确认删除患者费用明细编号为"' + ids + '"的数据项？').then(function() {
          return delPatientcosts(ids);
        }).then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
        }).catch(() => {});
      },
  /** 导出按钮操作 */
  handleExport() {
    this.download('system/patientcosts/export', {
      ...this.queryParams
    }, `patientcosts_${new Date().getTime()}.xlsx`)
  }
  }
  };
</script>
