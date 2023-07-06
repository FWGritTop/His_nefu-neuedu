<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="申请名称" prop="name">
        <el-input v-model="queryParams.name" placeholder="请输入申请名称" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="病历id" prop="medicalId">
        <el-input v-model="queryParams.medicalId" placeholder="请输入病历id" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="申请时间" prop="creationTime">
        <el-date-picker clearable v-model="queryParams.creationTime" type="date" value-format="yyyy-MM-dd"
          placeholder="请选择申请时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="总金额" prop="totalSum">
        <el-input v-model="queryParams.totalSum" placeholder="请输入总金额" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="医生id" prop="userId">
        <el-input v-model="queryParams.userId" placeholder="请输入开立医生id" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="状态" prop="state">
        <el-input v-model="queryParams.state" placeholder="请输入状态" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="发票编号" prop="invoiceNumber">
        <el-input v-model="queryParams.invoiceNumber" placeholder="请输入发票编号" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="删除标记" prop="delmark">
        <el-input v-model="queryParams.delmark" placeholder="请输入删除标记" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd"
          v-hasPermi="['system:checkapply:add']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="el-icon-edit" size="mini" :disabled="single" @click="handleUpdate"
          v-hasPermi="['system:checkapply:edit']">修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-delete" size="mini" :disabled="multiple" @click="handleDelete"
          v-hasPermi="['system:checkapply:remove']">删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="el-icon-download" size="mini" @click="handleExport"
          v-hasPermi="['system:checkapply:export']">导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="checkapplyList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <!-- <el-table-column label="id" align="center" prop="id" /> -->
      <el-table-column label="申请名称" align="center" prop="name" />
      <el-table-column label="病历id" align="center" prop="medicalId" />
      <el-table-column label="申请时间" align="center" prop="creationTime" width="180">
        <!-- <template slot-scope="scope">
                  <span>{{ parseTime(scope.row.creationTime, '{y}-{m}-{d}') }}</span>
                </template> -->
      </el-table-column>
      <el-table-column label="总金额" align="center" prop="totalSum" />
      <el-table-column label="目的要求" align="center" prop="objective" />
      <el-table-column label="医生id" align="center" prop="userId" />
      <el-table-column label="状态" align="center" prop="state">
        <template slot-scope="scope">
          <el-tag v-show="scope.row.state === 1" type="success">已检查</el-tag>
          <el-tag v-show="scope.row.state === 0" type="danger">未检查</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="发票编号" align="center" prop="invoiceNumber" />
      <!-- <el-table-column label="删除标记" align="center" prop="delmark" /> -->
      <el-table-column label="操作" align="center">
        <template slot-scope="scope">
          <el-button size="mini" type="text" icon="el-icon-tickets" @click="agreeApply(scope.row)">同意申请</el-button>
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)"
            v-hasPermi="['system:checkapply:edit']">修改</el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)"
            v-hasPermi="['system:checkapply:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total > 0" :total="total" :page.sync="queryParams.current" :limit.sync="queryParams.size"
      @pagination="getList" />

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
          <el-date-picker clearable v-model="form.creationTime" type="date" value-format="yyyy-MM-dd"
            placeholder="请选择申请时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="总金额" prop="totalSum">
          <el-input v-model="form.totalSum" placeholder="请输入总金额" />
        </el-form-item>
        <el-form-item label="目的要求" prop="objective">
          <el-input v-model="form.objective" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="医生id" prop="userId">
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
    <!-- 新增细节页面 -->
    <el-dialog :title="newtitle" :visible.sync="newopen" width="500px" append-to-body>
      <el-form ref="newform" :model="newform" :rules="newrules" label-width="80px">
        <el-form-item label="申请id" prop="checkappid">
          <el-input v-model="newform.checkappid" placeholder="请输入检查申请id" />
        </el-form-item>
        <el-form-item label="项目id" prop="checkprojid">
          <el-input v-model="newform.checkprojid" placeholder="请输入检查项目id" />
        </el-form-item>
        <el-form-item label="科室id" prop="deptid">
          <el-input v-model="newform.deptid" placeholder="请输入执行科室id" />
        </el-form-item>
        <el-form-item label="开立时间" prop="creationtime">
          <el-date-picker clearable v-model="newform.creationtime" type="date" value-format="yyyy-MM-dd"
            placeholder="请选择开立时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="目的要求" prop="position">
          <el-input v-model="newform.position" type="textarea" placeholder="请输入检查目的和要求" />
        </el-form-item>
        <!-- 1 - 已开立未交费
            2 - 已交费未检查
            3 - 已检查无结果
            4 - 有结果 -->
        <el-form-item label="申请状态" prop="state">
          <!-- 请输入1 - 已开立未交费
            2 - 已交费未检查
            3 - 已检查无结果
            4 - 有结果 -->
          <el-tooltip class="item" effect="dark" content="1 - 已开立未交费
                        2 - 已交费未检查
                        3 - 已检查无结果
                        4 - 有结果" placement="top-start">
            <el-input v-model="newform.state" placeholder="请输入申请状态" />
          </el-tooltip>
        </el-form-item>
        <el-form-item label="单价" prop="price">
          <el-input v-model="newform.price" placeholder="请输入单价" />
        </el-form-item>
        <!-- 1 - 检查项
            2 - 检验项
            3 - 处置项 -->
        <el-form-item label="选择项目" prop="identification">
          <el-tooltip class="item" effect="dark" content="请输入1 - 检查项
                              2 - 检验项
                              3 - 处置项 " placement="top-start">
            <el-input v-model="newform.identification" placeholder="请输入1 - 检查项
            2 - 检验项
            3 - 处置项" />
          </el-tooltip>
        </el-form-item>
        <el-form-item label="检查时间" prop="inspecttime">
          <el-date-picker clearable v-model="newform.inspecttime" type="date" value-format="yyyy-MM-dd"
            placeholder="请选择检查时间">
          </el-date-picker>
        </el-form-item>
        <!-- <el-form-item label="检查结果" prop="result">
          <template slot-scope="scope">
            <el-upload class="upload-demo" action="https://jsonplaceholder.typicode.com/posts/"
              :on-preview="handlePreview" :on-remove="handleRemove" :file-list="fileList2" list-type="picture">
              <el-button size="small" type="primary" @click="submitAns(scope.row)">点击上传</el-button>
              <div slot="tip" class="el-upload__tip">只能上传jpg/png文件,且不超过500kb</div>
            </el-upload>
          </template>
           <el-input v-model="form.result" type="textarea" placeholder="请输入检查结果" /> 
        </el-form-item> -->
        <el-form-item label="结果时间" prop="resulttime">
          <el-date-picker clearable v-model="newform.resulttime" type="date" value-format="yyyy-MM-dd" placeholder="请选择结果时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="录入人id" prop="userid2">
          <el-input v-model="newform.userid2" placeholder="请输入结果录入人员id" />

        </el-form-item>
        <el-form-item label="检查人id" prop="userid">
          <el-input v-model="newform.userid" placeholder="请输入检查人员id" />
        </el-form-item>
        <el-form-item label="删除标记" prop="delmark">
          <el-input v-model="newform.delmark" placeholder="请输入删除标记delmark" />
        </el-form-item>
        <el-form-item label="删除标记" prop="isDelete">
          <el-input v-model="newform.isDelete" placeholder="请输入删除标记isDelete" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="newform.remark" placeholder="请输入备注" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="newsubmitForm">确 定</el-button>
        <el-button @click="newcancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listCheckapply, getCheckapply, delCheckapply, addCheckapply, updateCheckapply } from "@/api/system/checkapply";
import { addCheckdetailed } from "@/api/system/checkdetailed";
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
      },
      // 新增
      newtitle: '',
      newopen: false,
      newrules: {
      },
      newform:{}
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
      this.single = selection.length !== 1
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
      this.$modal.confirm('是否确认删除检查检验申请编号为"' + ids + '"的数据项？').then(function () {
        return delCheckapply(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => { });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/checkapply/export', {
        ...this.queryParams
      }, `checkapply_${new Date().getTime()}.xlsx`)
    },
    // 新增功能 同意申请
    agreeApply(row) {
      console.log(row.id);
      if (row.state == 1) {
        this.$message.error("该申请已经同意");
      }
      else {
        this.loading = true;
        console.log(this.form.state);
        this.reset();
        const id = row.id || this.ids
        getCheckapply(id).then(response => {
          this.form = response.data;
          this.addDetail(row);
        });
        this.loading = false;
      }
    },
    addDetail(row) {
      this.newopen= true;
      this.newtitle = "已同意检查申请,请填写申请明细";
      this.newreset();
      this.newform.checkappid=row.id;
      console.log(this.newform);
    },
    newsubmitForm() {
      this.form.state = 1;
          updateCheckapply(this.form).then(response => {
            // this.$modal.msgSuccess("已经同意申请，如有具体要求请跳转检查申请明细");
            this.getList();
            // this.$router.push('http://localhost/CheckApply/checkdetailed');
          })
      console.log(this.newform);
      this.$refs["newform"].validate(valid => {
        if (valid) {
            addCheckdetailed(this.newform).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.newopen = false;
              // this.getList();
              //  路由跳转
              // this.$router.push('@/CheckApply/checkdetailed');
            });
        }
      });
    },
    // 表单重置
    newreset() {
      this.newform = {
        id: null,
        checkappid: null,
        checkprojid: null,
        deptid: null,
        creationtime: null,
        position: null,
        state: null,
        price: null,
        identification: null,
        inspecttime: null,
        result: null,
        resulttime: null,
        userid2: null,
        userid: null,
        delmark: null,
        isDelete: null,
        remark: null,
        updateTime: null,
        updateBy: null,
        createBy: null,
        createTime: null
      };
      // this.resetForm("newform");
    },
    newcancel() {
      this.newopen = false;
      this.newreset();
    },
  }
};
</script>
