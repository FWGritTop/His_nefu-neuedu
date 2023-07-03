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
      <el-form-item label="项目编码" prop="itemcode">
        <el-input
          v-model="queryParams.itemcode"
          placeholder="请输入项目编码"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="项目名称" prop="itemname">
        <el-input
          v-model="queryParams.itemname"
          placeholder="请输入项目名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="规格" prop="format">
        <el-input
          v-model="queryParams.format"
          placeholder="请输入规格"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="单价" prop="price">
        <el-input
          v-model="queryParams.price"
          placeholder="请输入单价"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="所属费用科目ID" prop="expclassid">
        <el-input
          v-model="queryParams.expclassid"
          placeholder="请输入费用科目ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="执行科ID" prop="deptid">
        <el-input
          v-model="queryParams.deptid"
          placeholder="请输入执行科室ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="助记码" prop="mnemoniccode">
        <el-input
          v-model="queryParams.mnemoniccode"
          placeholder="请输入拼音助记码"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="项目类型" prop="recordtype">
        <el-input
          v-model="queryParams.recordtype"
          placeholder="请输入项目类型"
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
          v-hasPermi="['system:fmeditem:add']"
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
          v-hasPermi="['system:fmeditem:edit']"
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
          v-hasPermi="['system:fmeditem:remove']"
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
          v-hasPermi="['system:fmeditem:export']"
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
      :data="fmeditemList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="项目编码" align="center" prop="itemcode" />
      <el-table-column label="项目名称" align="center" prop="itemname" />
      <el-table-column label="规格" align="center" prop="format" />
      <el-table-column label="单价" align="center" prop="price" />
      <el-table-column
        label="所属费用科目ID"
        align="center"
        prop="expclassid"
      />
      <el-table-column label="执行科室ID" align="center" prop="deptid" />
      <el-table-column label="拼音助记码" align="center" prop="mnemoniccode" />
      <el-table-column label="项目类型" align="center" prop="recordtype" />
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
            v-hasPermi="['system:fmeditem:edit']"
            >修改</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:fmeditem:remove']"
            >删除</el-button
          >
        </template>
      </el-table-column>
    </el-table>

    <el-pagination
      @size-change="getList"
      @current-change="getList"
      :current-page.sync="queryParams.current"
      :page-size.sync="queryParams.size"
      layout="total, sizes, prev, pager, next, jumper"
      :total="total"
    ></el-pagination>

    <!-- 添加或修改非药品收费对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="项目编码" prop="itemcode">
          <el-input v-model="form.itemcode" placeholder="请输入项目编码" />
        </el-form-item>
        <el-form-item label="项目名称" prop="itemname">
          <el-input v-model="form.itemname" placeholder="请输入项目名称" />
        </el-form-item>
        <el-form-item label="规格" prop="format">
          <el-input v-model="form.format" placeholder="请输入规格" />
        </el-form-item>
        <el-form-item label="单价" prop="price">
          <el-input v-model="form.price" placeholder="请输入单价" />
        </el-form-item>
        <el-form-item label="所属费用科目ID" prop="expclassid">
          <el-input
            v-model="form.expclassid"
            placeholder="请输入所属费用科目ID"
          />
        </el-form-item>
        <el-form-item label="执行科室ID" prop="deptid">
          <el-input v-model="form.deptid" placeholder="请输入执行科室ID" />
        </el-form-item>
        <el-form-item label="拼音助记码" prop="mnemoniccode">
          <el-input
            v-model="form.mnemoniccode"
            placeholder="请输入拼音助记码"
          />
        </el-form-item>
        <el-form-item label="项目类型" prop="recordtype">
          <el-input
            v-model="form.recordtype"
            placeholder="请输入项目类型"
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
  listFmeditem,
  getFmeditem,
  delFmeditem,
  addFmeditem,
  updateFmeditem,
} from "@/api/system/fmeditem";

export default {
  name: "Fmeditem",
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
      // 非药品收费表格数据
      fmeditemList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        current:1,
        size:10,
        itemcode: null,
        itemname: null,
        format: null,
        price: null,
        expclassid: null,
        deptid: null,
        mnemoniccode: null,
        recordtype: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        itemcode: [
          { required: true, message: "项目编码不能为空", trigger: "blur" },
        ],
        itemname: [
          { required: true, message: "项目名称不能为空", trigger: "blur" },
        ],
        price: [{ required: true, message: "单价不能为空", trigger: "blur" }],
        creationdate: [
          { required: true, message: "创建时间不能为空", trigger: "blur" },
        ],
        delmark: [
          { required: true, message: "删除标记不能为空", trigger: "blur" },
        ],
      },
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询非药品收费列表 */
    getList() {
      this.loading = true;
      listFmeditem(this.queryParams).then((response) => {
        this.fmeditemList = response.records;
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
        itemcode: null,
        itemname: null,
        format: null,
        price: null,
        expclassid: null,
        deptid: null,
        mnemoniccode: null,
        creationdate: null,
        lastupdatedate: null,
        recordtype: null,
        delmark: null,
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
      this.title = "添加非药品收费";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids;
      getFmeditem(id).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改非药品收费";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.id != null) {
            updateFmeditem(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addFmeditem(this.form).then((response) => {
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
        .confirm('是否确认删除非药品收费编号为"' + ids + '"的数据项？')
        .then(function () {
          return delFmeditem(ids);
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
        "system/fmeditem/export",
        {
          ...this.queryParams,
        },
        `fmeditem_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>
