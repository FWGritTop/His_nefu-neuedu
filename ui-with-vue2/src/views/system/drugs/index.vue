<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      size="small"
      :inline="true"
      v-show="showSearch"
      label-width="68px"
    >
      <el-form-item label="药品编码" prop="drugsCode">
        <el-input
          v-model="queryParams.drugsCode"
          placeholder="请输入药品编码"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="药品名称" prop="drugsName">
        <el-input
          v-model="queryParams.drugsName"
          placeholder="请输入药品名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="药品规格" prop="drugsFormat">
        <el-input
          v-model="queryParams.drugsFormat"
          placeholder="请输入药品规格"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="包装单位" prop="drugsUnit">
        <el-input
          v-model="queryParams.drugsUnit"
          placeholder="请输入包装单位"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="生产厂家" prop="manufacturer">
        <el-input
          v-model="queryParams.manufacturer"
          placeholder="请输入生产厂家"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="药品剂型" prop="drugsDosage">
        <el-input
          v-model="queryParams.drugsDosage"
          placeholder="请输入药品剂型"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="药品单价" prop="drugsPrice">
        <el-input
          v-model="queryParams.drugsPrice"
          placeholder="请输入药品单价"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="拼音助记码" prop="mnemonicCode">
        <el-input
          v-model="queryParams.mnemonicCode"
          placeholder="请输入拼音助记码"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button
          type="primary"
          icon="el-icon-search"
          size="mini"
          @click="handleQuery"
          >搜索</el-button
        >
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery"
          >重置</el-button
        >
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
          v-hasPermi="['system:drugs:add']"
          >新增</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:drugs:edit']"
          >修改</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:drugs:remove']"
          >删除</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:drugs:export']"
          >导出</el-button
        >
      </el-col>
      <right-toolbar
        :showSearch.sync="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="drugsList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="药品编码" align="center" prop="drugsCode" />
      <el-table-column label="药品名称" align="center" prop="drugsName" />
      <el-table-column label="药品规格" align="center" prop="drugsFormat" />
      <el-table-column label="包装单位" align="center" prop="drugsUnit" />
      <el-table-column label="生产厂家" align="center" prop="manufacturer" />
      <el-table-column label="药品剂型" align="center" prop="drugsDosage" />
      <el-table-column label="药品类型" align="center" prop="drugsType" />
      <el-table-column label="药品单价" align="center" prop="drugsPrice" />
      <el-table-column label="拼音助记码" align="center" prop="mnemonicCode" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:drugs:edit']"
            >修改</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:drugs:remove']"
            >删除</el-button
          >
        </template>
      </el-table-column>
    </el-table>

    <el-pagination
        @size-change="getList"
        @current-change="getList"
        :current-page.sync="queryParams.current" 
        :page-size.sync= "queryParams.size"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total"
      ></el-pagination>

    <!-- 添加或修改成品药对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="药品编码" prop="drugsCode">
          <el-input v-model="form.drugsCode" placeholder="请输入药品编码" />
        </el-form-item>
        <el-form-item label="药品名称" prop="drugsName">
          <el-input v-model="form.drugsName" placeholder="请输入药品名称" />
        </el-form-item>
        <el-form-item label="药品规格" prop="drugsFormat">
          <el-input v-model="form.drugsFormat" placeholder="请输入药品规格" />
        </el-form-item>
        <el-form-item label="包装单位" prop="drugsUnit">
          <el-input v-model="form.drugsUnit" placeholder="请输入包装单位" />
        </el-form-item>
        <el-form-item label="生产厂家" prop="manufacturer">
          <el-input
            v-model="form.manufacturer"
            type="textarea"
            placeholder="请输入内容"
          />
        </el-form-item>
        <el-form-item label="药品剂型" prop="drugsDosage">
          <el-input v-model="form.drugsDosage" placeholder="请输入药品剂型" />
        </el-form-item>
        <el-form-item label="药品单价" prop="drugsPrice">
          <el-input v-model="form.drugsPrice" placeholder="请输入药品单价" />
        </el-form-item>
        <el-form-item label="拼音助记码" prop="mnemonicCode">
          <el-input
            v-model="form.mnemonicCode"
            placeholder="请输入拼音助记码"
          />
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
import {
  listDrugs,
  getDrugs,
  delDrugs,
  addDrugs,
  updateDrugs,
} from "@/api/system/drugs";

export default {
  name: "Drugs",
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
      // 成品药表格数据
      drugsList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        current:1,
        size: 10,
        drugsCode: null,
        drugsName: null,
        drugsFormat: null,
        drugsUnit: null,
        manufacturer: null,
        drugsDosage: null,
        drugsType: null,
        drugsPrice: null,
        mnemonicCode: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {},
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询成品药列表 */
    getList() {
      this.loading = true;
      listDrugs(this.queryParams).then((response) => {
        this.drugsList = response.records;
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
        drugsCode: null,
        drugsName: null,
        drugsFormat: null,
        drugsUnit: null,
        manufacturer: null,
        drugsDosage: null,
        drugsType: null,
        drugsPrice: null,
        mnemonicCode: null,
        isDelete: null,
        remark: null,
        updateTime: null,
        updateBy: null,
        createBy: null,
        createTime: null,
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
      this.ids = selection.map((item) => item.id);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加成品药";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids;
      getDrugs(id).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改成品药";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.id != null) {
            updateDrugs(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addDrugs(this.form).then((response) => {
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
      this.$modal
        .confirm('是否确认删除成品药编号为"' + ids + '"的数据项？')
        .then(function () {
          return delDrugs(ids);
        })
        .then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
        })
        .catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download(
        "system/drugs/export",
        {
          ...this.queryParams,
        },
        `drugs_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>
