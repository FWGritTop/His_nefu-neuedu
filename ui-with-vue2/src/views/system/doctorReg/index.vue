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
      <el-form-item label="姓名" prop="realname">
        <el-input
          v-model="queryParams.realname"
          placeholder="请输入病患名字"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="性别" prop="gender">
        <el-select
          v-model="queryParams.gender"
          placeholder="请选择性别"
          :style="{ width: '100%' }"
        >
          <el-option
            v-for="(item, index) in genderOptions"
            :key="index"
            :label="item.label"
            :value="item.value"
            :disabled="item.disabled"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="问诊状态" prop="visitstate">
        <el-select
          v-model="queryParams.visitstate"
          placeholder="请选择问诊状态"
          :style="{ width: '100%' }"
        >
          <el-option
            v-for="(item, index) in stateOptions"
            :key="index"
            :label="item.label"
            :value="item.value"
            :disabled="item.disabled"
          ></el-option>
        </el-select>
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
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
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
          v-hasPermi="['system:register:remove']"
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
          v-hasPermi="['system:register:export']"
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
      :data="registerList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="挂号ID" align="center" prop="id" />
      <el-table-column label="患者名称" align="center" prop="realname" />

      <el-table-column label="性别" align="center" prop="gender">
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.sys_user_sex"
            :value="scope.row.gender"
          />
        </template>
      </el-table-column>
      <el-table-column
        label="家庭地址"
        align="center"
        prop="homeaddress"
        width="180"
      >
      </el-table-column>
      <el-table-column label="状态" align="center" prop="visitstate">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.visitstate == 0" type="info">未问诊</el-tag>
          <el-tag v-else type="success">已问诊</el-tag>
        </template>
      </el-table-column>
      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="success"
            @click="handleAdddetail(scope.row)"
            plain
            >问诊</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            >修改</el-button
          >
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total > 0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改挂号信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="患者名称" prop="realname">
          <el-input
            v-model="form.realname"
            type="textarea"
            placeholder="请输入内容"
          />
        </el-form-item>
        <el-form-item label="出生日期" prop="birthdate">
          <el-date-picker
            clearable
            v-model="form.birthdate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择出生日期"
          >
          </el-date-picker>
        </el-form-item>
        <el-form-item label="年龄" prop="age">
          <el-input v-model="form.age" placeholder="请输入年龄" />
        </el-form-item>
        </el-form-item>
        <el-form-item label="性别" prop="gender">
        <el-select
          v-model="form.gender"
          placeholder="请选择性别"
          :style="{ width: '100%' }"
        >
          <el-option
            v-for="(item, index) in genderOptions"
            :key="index"
            :label="item.label"
            :value="item.value"
            :disabled="item.disabled"
          ></el-option>
        </el-select>
        
      </el-form-item>
        <el-form-item label="身份证号" prop="idnumber">
          <el-input v-model="form.idnumber" placeholder="请输入身份证号" />
        </el-form-item>
      </el-form-item>
        <el-form-item label="家庭地址" prop="homeaddress">
          <el-input v-model="form.homeaddress" placeholder="请输入家庭地址" />
        </el-form-item>
      </el-form>
      
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <el-dialog title="病例信息" :visible.sync="open_detail" width="500px" append-to-body>
      <el-form ref="form" :model="detailForm" :rules="rules" label-width="80px">
                        <el-form-item label="姓名" prop="caseNumber">
                          <span>{{ detailForm.caseNumber }}</span>
                        </el-form-item>
                        <el-form-item label="挂号id" prop="registerId">
                          <span>{{ detailForm.registerId }}</span>
                        </el-form-item>
                        <el-form-item label="主诉" prop="medicalReadme">
                          <el-input v-model="detailForm.medicalReadme" type="textarea" placeholder="请输入内容" />
                        </el-form-item>
                        <el-form-item label="现病史" prop="medicalPresent">
                          <el-input v-model="detailForm.medicalPresent" type="textarea" placeholder="请输入内容" />
                        </el-form-item>
                        <el-form-item label="现病治疗情况" prop="presentTreat">
                          <el-input v-model="detailForm.presentTreat" type="textarea" placeholder="请输入内容" />
                        </el-form-item>
                        <el-form-item label="既往史" prop="medicalHistory">
                          <el-input v-model="detailForm.medicalHistory" type="textarea" placeholder="请输入内容" />
                        </el-form-item>
                        <el-form-item label="过敏史" prop="medicalAllergy">
                          <el-input v-model="detailForm.medicalAllergy" type="textarea" placeholder="请输入内容" />
                        </el-form-item>
                        <el-form-item label="体格检查" prop="medicalPhysique">
                          <el-input v-model="detailForm.medicalPhysique" type="textarea" placeholder="请输入内容" />
                        </el-form-item>
                        <el-form-item label="检查建议" prop="testOrder">
                          <el-input v-model="detailForm.testOrder" placeholder="请输入检查建议" />
                        </el-form-item>
                        <el-form-item label="检验建议" prop="checkOrder">
                          <el-input v-model="detailForm.checkOrder" placeholder="请输入检验建议" />
                        </el-form-item>
                        <el-form-item label="检查结果" prop="medicalTested">
                          <el-input v-model="detailForm.medicalTested" type="textarea" placeholder="请输入内容" />
                        </el-form-item>
                        <el-form-item label="检验结果" prop="medicalChecked">
                          <el-input v-model="detailForm.medicalChecked" type="textarea" placeholder="请输入内容" />
                        </el-form-item>
                        <el-form-item label="诊断结果" prop="medicalDiagnosis">
                          <el-input v-model="detailForm.medicalDiagnosis" type="textarea" placeholder="请输入内容" />
                        </el-form-item>
                        <el-form-item label="处理意见" prop="medicalHandling">
                          <el-input v-model="detailForm.medicalHandling" type="textarea" placeholder="请输入内容" />
                        </el-form-item>
                        <el-form-item label="备注" prop="remark">
                          <el-input v-model="form.remark" placeholder="请输入备注" />
                        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitdetailForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {
  listRegister,
  getRegister,
  delRegister,
  addRegister,
  updateRegister,
  listRegisterbyuser,
} from "@/api/system/register";
import { addMedicalrecord } from "@/api/system/medicalrecord";

export default {
  realname: "Register",
  dicts: ["sys_user_sex"],
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
      // 挂号信息表格数据
      registerList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      open_detail: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        realname: undefined,
        gender: undefined,
        deptid: undefined,
        visitstate: undefined,
        userid: undefined,
      },
      stateOptions: [
        {
          label: "未问诊",
          value: 0,
        },
        {
          label: "已问诊",
          value: 1,
        },
      ],
      genderOptions: [
        {
          label: "男",
          value: 0,
        },
        {
          label: "女",
          value: 1,
        },
      ],
      // 表单参数
      form: {},
      // 表单校验
      rules: {},
      detailForm: {},
    };
  },
  created() {
    this.loading = true;
    this.getList();
  },
  methods: {
    /** 查询挂号信息列表 */
    getList() {
      this.loading = true;
      listRegisterbyuser(this.queryParams).then((response) => {
        this.registerList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.open_detail = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        deptid: undefined,
        realname: undefined,
        gender: undefined,
        visitstate: undefined,
      };
      this.detailForm = {};
      this.resetForm("detailForm");
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
      this.title = "添加挂号信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids;
      getRegister(id).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改挂号信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.id != null) {
            updateRegister(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addRegister(this.form).then((response) => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    submitdetailForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          addMedicalrecord(this.detailForm).then((response) => {
            this.form.visitstate = 1;
            updateRegister(this.form).then(()=>{
              this.$modal.msgSuccess("已问诊");
              this.loading
              this.getList();
              this.open_detail = false;
            });
          });
        }
      });
    },
    /**添加病历表操作 */
    handleAdddetail(row) {
      if (row.visitstate == 1) {
        this.$message.error("已经生成问诊信息请勿重复提交");
        return;
      }
      const ids = row.id || this.ids;
      this.reset();
      this.form.id = ids;
      this.detailForm.registerId = ids;
      this.detailForm.caseState = 0;
      this.detailForm.caseNumber = row.realname;
      this.open_detail = true;
      //console.log(ids);
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal
        .confirm('是否确认删除挂号信息编号为"' + ids + '"的数据项？')
        .then(function () {
          return delRegister(ids);
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
        "system/register/export",
        {
          ...this.queryParams,
        },
        `register_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>
