<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="类别编码" prop="settlecode">
        <el-input v-model="queryParams.settlecode" placeholder="请输入类别编码" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="类别名称" prop="settlename">
        <el-input v-model="queryParams.settlename" placeholder="请输入类别名称" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="是否默认" prop="isdefault">
        <el-input v-model="queryParams.isdefault" placeholder="请输入是否默认" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="显示顺序号" prop="sequence">
        <el-input v-model="queryParams.sequence" placeholder="请输入显示顺序号" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="1为删除" prop="delmark">
        <el-input v-model="queryParams.delmark" placeholder="请输入1为删除" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd"
          v-hasPermi="['system:settlecategory:add']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="el-icon-edit" size="mini" :disabled="single" @click="handleUpdate"
          v-hasPermi="['system:settlecategory:edit']">修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-delete" size="mini" :disabled="multiple" @click="handleDelete"
          v-hasPermi="['system:settlecategory:remove']">删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="el-icon-download" size="mini" @click="handleExport"
          v-hasPermi="['system:settlecategory:export']">导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="settlecategoryList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <!-- <el-table-column label="id" align="center" prop="id" /> -->
      <el-table-column label="类别编码" align="center" prop="settlecode" />
      <el-table-column label="类别名称" align="center" prop="settlename" />
      <el-table-column label="是否默认" align="center" prop="isdefault" />
      <el-table-column label="显示顺序号" align="center" prop="sequence" />
      <el-table-column label="1为删除" align="center" prop="delmark" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)"
            v-hasPermi="['system:settlecategory:edit']">修改</el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)"
            v-hasPermi="['system:settlecategory:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <el-pagination @size-change="getList" @current-change="getList" :current-page.sync="queryParams.current"
      :page-size.sync="queryParams.size" layout="total, sizes, prev, pager, next, jumper" :total="total"></el-pagination>

    <!-- 添加或修改结算类别对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="类别编码" prop="settlecode">
          <el-input v-model="form.settlecode" placeholder="请输入类别编码" />
        </el-form-item>
        <el-form-item label="类别名称" prop="settlename">
          <el-input v-model="form.settlename" placeholder="请输入类别名称" />
        </el-form-item>
        <el-form-item label="是否默认" prop="isdefault">
          <el-input v-model="form.isdefault" placeholder="请输入是否默认" />
        </el-form-item>
        <el-form-item label="显示顺序号" prop="sequence">
          <el-input v-model="form.sequence" placeholder="请输入显示顺序号" />
        </el-form-item>
        <el-form-item label="1为删除" prop="delmark">
          <el-input v-model="form.delmark" placeholder="请输入1为删除" />
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
import { listSettlecategory, getSettlecategory, delSettlecategory, addSettlecategory, updateSettlecategory } from "@/api/system/settlecategory";

export default {
  name: "Settlecategory",
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
      // 结算类别表格数据
      settlecategoryList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        current: 1,
        size: 10,
        settlecode: null,
        settlename: null,
        isdefault: null,
        sequence: null,
        delmark: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        settlecode: [
          { required: true, message: "类别编码不能为空", trigger: "blur" }
        ],
        settlename: [
          { required: true, message: "类别名称不能为空", trigger: "blur" }
        ],
        sequence: [
          { required: true, message: "显示顺序号不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询结算类别列表 */
    getList() {
      this.loading = true;
      listSettlecategory(this.queryParams).then(response => {
        this.settlecategoryList = response.records;
        // console.log(this.settlecategoryList);
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
        settlecode: null,
        settlename: null,
        isdefault: null,
        sequence: null,
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
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加结算类别";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getSettlecategory(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改结算类别";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateSettlecategory(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addSettlecategory(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除结算类别编号为"' + ids + '"的数据项？').then(function () {
        return delSettlecategory(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => { });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/settlecategory/export', {
        ...this.queryParams
      }, `settlecategory_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
