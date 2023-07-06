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
      <el-form-item label="申请id" prop="checkappid">
        <el-input
          v-model="queryParams.checkappid"
          placeholder="请输入检查申请id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="项目id" prop="checkprojid">
        <el-input
          v-model="queryParams.checkprojid"
          placeholder="请输入检查项目id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="科室id" prop="deptid">
        <el-input
          v-model="queryParams.deptid"
          placeholder="请输入执行科室id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="开立时间" prop="creationtime">
        <el-date-picker
          clearable
          v-model="queryParams.creationtime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择开立时间"
        >
        </el-date-picker>
      </el-form-item>
      <!-- 1 - 已开立未交费
                        2 - 已交费未检查
                        3 - 已检查无结果
                        4 - 有结果 -->
      <el-form-item label="状态" prop="state">
        <el-tooltip
          class="item"
          effect="dark"
          content="1 - 已开立未交费
                        2 - 已交费未检查
                        3 - 已检查无结果
                        4 - 有结果"
          placement="top-start"
        >
          <el-input
            v-model="queryParams.state"
            placeholder="状态"
            clearable
            @keyup.enter.native="handleQuery"
          />
        </el-tooltip>
        <!-- 请输入1 - 已开立未交费
                              2 - 已交费未检查
                              3 - 已检查无结果
                              4 - 有结果 -->
      </el-form-item>
      <el-form-item label="单价" prop="price">
        <el-input
          v-model="queryParams.price"
          placeholder="请输入单价"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <!-- 1 - 检查项
                        2 - 检验项
                        3 - 处置项 -->
      <el-form-item label="选择项目" prop="identification">
        <!-- 请输入1 - 检查项
                              2 - 检验项
                              3 - 处置项 -->
        <el-tooltip
          class="item"
          effect="dark"
          content="请输入1 - 检查项
                              2 - 检验项
                              3 - 处置项 "
          placement="top-start"
        >
          <el-input
            v-model="queryParams.identification"
            placeholder="请输入对应项目号"
            clearable
            @keyup.enter.native="handleQuery"
          />
        </el-tooltip>
      </el-form-item>
      <el-form-item label="检查时间" prop="inspecttime">
        <el-date-picker
          clearable
          v-model="queryParams.inspecttime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择检查时间"
        >
        </el-date-picker>
      </el-form-item>
      <el-form-item label="结果时间" prop="resulttime">
        <el-date-picker
          clearable
          v-model="queryParams.resulttime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择结果时间"
        >
        </el-date-picker>
      </el-form-item>
      <el-form-item label="录入人id" prop="userid2">
        <el-input
          v-model="queryParams.userid2"
          placeholder="请输入结果录入人员id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="检查人id" prop="userid">
        <el-input
          v-model="queryParams.userid"
          placeholder="请输入检查人员id"
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
          v-hasPermi="['system:checkdetailed:add']"
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
          v-hasPermi="['system:checkdetailed:edit']"
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
          v-hasPermi="['system:checkdetailed:remove']"
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
          v-hasPermi="['system:checkdetailed:export']"
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
      :data="checkdetailedList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <!-- <el-table-column label="id" align="center" prop="id" /> -->
      <el-table-column label="申请id" align="center" prop="checkappid" />
      <el-table-column label="项目id" align="center" prop="checkprojid" />
      <el-table-column label="科室id" align="center" prop="deptid" />
      <el-table-column
        label="开立时间"
        align="center"
        prop="creationtime"
        width="180"
      >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.creationtime, "{y}-{m}-{d}") }}</span>
        </template>
      </el-table-column>
      <el-table-column label="检查目的和要求" align="center" prop="position" />
      <!-- 1 - 已开立未交费
                  2 - 已交费未检查
                  3 - 已检查无结果
                  4 - 有结果 -->
      <el-table-column label="检查状态" align="center" prop="state" />
      <el-table-column label="单价" align="center" prop="price" />
      <el-table-column
        label="1 - 检查项
            2 - 检验项
            3 - 处置项"
        align="center"
        prop="identification"
      >
        <template slot-scope="scope">
          <el-tag v-show="scope.row.state === 1" type="success">检查项</el-tag>
          <el-tag v-show="scope.row.state === 2" type="warning">检验项</el-tag>
          <el-tag v-show="scope.row.state === 3">处置项</el-tag>
        </template>
      </el-table-column>
      <el-table-column
        label="检查时间"
        align="center"
        prop="inspecttime"
        width="180"
      >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.inspecttime, "{y}-{m}-{d}") }}</span>
        </template>
      </el-table-column>
      <el-table-column label="检查结果" align="center" prop="result">
        <template slot-scope="scope">
          <span v-show="scope.row.result !== null">
            <el-button
              type="text"
              icon="el-icon-document"
              @click="handleView(scope.row)"
              >查看结果</el-button
            >
          </span>
          <span v-show="scope.row.result === null">
            <el-button
              type="text"
              icon="el-icon-edit"
              @click="handleUpdate(scope.row)"
              >录入结果</el-button
            >
          </span>
        </template>
      </el-table-column>
      <el-table-column
        label="结果时间"
        align="center"
        prop="resulttime"
        width="180"
      >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.resulttime, "{y}-{m}-{d}") }}</span>
        </template>
      </el-table-column>
      <el-table-column label="录入人id" align="center" prop="userid2" />
      <el-table-column label="检查人id" align="center" prop="userid" />
      <el-table-column label="删除标记" align="center" prop="delmark" />
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
            v-hasPermi="['system:checkdetailed:edit']"
            >修改</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:checkdetailed:remove']"
            >删除</el-button
          >
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total > 0"
      :total="total"
      :page.sync="queryParams.current"
      :limit.sync="queryParams.size"
      @pagination="getList"
    />

    <!-- 添加或修改检查申请明细对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="申请id" prop="checkappid">
          <el-input v-model="form.checkappid" placeholder="请输入检查申请id" />
        </el-form-item>
        <el-form-item label="项目id" prop="checkprojid">
          <el-input v-model="form.checkprojid" placeholder="请输入检查项目id" />
        </el-form-item>
        <el-form-item label="科室id" prop="deptid">
          <el-input v-model="form.deptid" placeholder="请输入执行科室id" />
        </el-form-item>
        <el-form-item label="开立时间" prop="creationtime">
          <el-date-picker
            clearable
            v-model="form.creationtime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择开立时间"
          >
          </el-date-picker>
        </el-form-item>
        <el-form-item label="目的要求" prop="position">
          <el-input
            v-model="form.position"
            type="textarea"
            placeholder="请输入检查目的和要求"
          />
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
          <el-tooltip
            class="item"
            effect="dark"
            content="1 - 已开立未交费
                        2 - 已交费未检查
                        3 - 已检查无结果
                        4 - 有结果"
            placement="top-start"
          >
            <el-input v-model="form.state" placeholder="请输入申请状态" />
          </el-tooltip>
        </el-form-item>
        <el-form-item label="单价" prop="price">
          <el-input v-model="form.price" placeholder="请输入单价" />
        </el-form-item>
        <!-- 1 - 检查项
            2 - 检验项
            3 - 处置项 -->
        <el-form-item label="选择项目" prop="identification">
          <el-tooltip
            class="item"
            effect="dark"
            content="请输入1 - 检查项
                              2 - 检验项
                              3 - 处置项 "
            placement="top-start"
          >
            <el-input
              v-model="form.identification"
              placeholder="请输入1 - 检查项
            2 - 检验项
            3 - 处置项"
            />
          </el-tooltip>
        </el-form-item>
        <el-form-item label="检查时间" prop="inspecttime">
          <el-date-picker
            clearable
            v-model="form.inspecttime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择检查时间"
          >
          </el-date-picker>
        </el-form-item>
        <el-form-item label="检查结果" prop="result">
          <!-- <template slot-scope="scope">
          <el-upload
              class="upload-demo"
              action="https://jsonplaceholder.typicode.com/posts/"
              :on-preview="handlePreview"
              :on-remove="handleRemove"
              :file-list="fileList2"
              list-type="picture">
              <el-button size="small" type="primary" @click="submitAns(scope.row)">点击上传</el-button>
              <div slot="tip" class="el-upload__tip">只能上传jpg/png文件,且不超过500kb</div>
            </el-upload>
          </template> -->
          <el-col :span="1.5">
              <input name="file" id="file" class="form-control" type="file" />
          </el-col>
          <!-- <el-col :span="1.5">
              <el-button
                type="primary"
                plain
                icon="el-icon-plus"
                size="mini"
                @click="submitHandler"
                >上传</el-button>
          </el-col> -->
          <!-- ------------------------------------把上面上传逻辑移动到确定 -->
          <!-- <el-input
            v-model="form.result"
            type="textarea"
            placeholder="请输入检查结果"
          /> -->
        </el-form-item>
        <el-form-item label="结果时间" prop="resulttime">
          <el-date-picker
            clearable
            v-model="form.resulttime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择结果时间"
          >
          </el-date-picker>
        </el-form-item>
        <el-form-item label="录入人id" prop="userid2">
          <el-input v-model="form.userid2" placeholder="请输入结果录入人员id" />
        </el-form-item>
        <el-form-item label="检查人id" prop="userid">
          <el-input v-model="form.userid" placeholder="请输入检查人员id" />
        </el-form-item>
        <el-form-item label="删除标记" prop="delmark">
          <el-input
            v-model="form.delmark"
            placeholder="请输入删除标记delmark"
          />
        </el-form-item>
        <el-form-item label="删除标记" prop="isDelete">
          <el-input
            v-model="form.isDelete"
            placeholder="请输入删除标记isDelete"
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
    <!-- 图片预览 -->
    <el-dialog
      class="el-dialog-img"
      title="病例结果"
      :visible.sync="previewVisible"
      :before-close="handleClose"
      width="50%"
    >
      <img
        class="god-img"
        :src="img.imgurl"
      />
      <!-- {{ previewPath }} -->
    </el-dialog>
  </div>
</template>

<script>
import {
  listCheckdetailed,
  getCheckdetailed,
  delCheckdetailed,
  addCheckdetailed,
  updateCheckdetailed,
} from "@/api/system/checkdetailed";
import $ from 'jquery';
import {upload,getfile} from "@/api/system/files"
// import { URL } from "url"
export default {
  name: "Checkdetailed",
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
      // 检查申请明细表格数据
      checkdetailedList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        current: 1,
        size: 10,
        checkappid: null,
        checkprojid: null,
        deptid: null,
        creationtime: null,
        position: null,
        state: null,
        price: null,
        identification: null,
        inspecttime: null,
        result: null, // 检查结果
        resulttime: null,
        userid2: null,
        userid: null,
        delmark: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {},
      // 文件列表
      // fileList2: [{name: 'food.jpeg', url: 'https://fuss10.elemecdn.com/3/63/4e7f3a15429bfda99bce42a18cdd1jpeg.jpeg?imageMogr2/thumbnail/360x360/format/webp/quality/100'}],
      previewVisible: false,
      //图片预览控制
      // 预览路径
      previewPath: "",
      img:{
        imgurl:undefined,
        filename:undefined
      }

    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询检查申请明细列表 */
    getList() {
      this.loading = true;
      listCheckdetailed(this.queryParams).then((response) => {
        this.checkdetailedList = response.records;
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
        createTime: null,
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
      this.ids = selection.map((item) => item.id);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加检查申请明细";
      // this.form.result=JSON.stringify(this.fileList2); //转换存储到数据库
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids;
      getCheckdetailed(id).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改检查申请明细";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.id != null) {
            this.submitHandler();
            updateCheckdetailed(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            this.submitHandler();
            addCheckdetailed(this.form).then((response) => {
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
        .confirm('是否确认删除检查申请明细编号为"' + ids + '"的数据项？')
        .then(function () {
          return delCheckdetailed(ids);
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
        "system/checkdetailed/export",
        {
          ...this.queryParams,
        },
        `checkdetailed_${new Date().getTime()}.xlsx`
      );
    },
    // 上传图片
    // submitAns(row) {
    //   console.log(row)
    // },
    // handlePreview(file) {
    //   console.log(file)
    //   this.previewPath = file.response.data.url
    //   this.previewVisible = true
    // },
    // handleRemove(file, fileList) {
    //   console.log(file, fileList)
    // }
    handleView(row) {
      console.log(row);
      console.log("2222222222222");
      // this.previewPath = row.result;
      this.img.filename=row.result;
      getfile(this.img.filename).then(res => {//这里获取文件名
        this.img.imgurl = 'data:image/png;base64,' + res
        console.log(res);
        this.loading});
      this.previewVisible = true;

    },
    handleClose(done) {
      this.$confirm("确认关闭？")
        .then((_) => {
          done();
        })
        .catch((_) => {});
    },

    /**文件上传write by gsx */
    submitHandler() {
      // debugger;
      var formData = new FormData();
      if ($("#file")[0].files[0] == null) {
        this.$message.error('请先选择文件');
        return false;
      }
      this.form.result=$("#file")[0].files[0].name;
      //文件
      formData.append("file", document.getElementById("file").files[0]);

      //上传
      upload(formData).then(res=>{//这里返回文件名
        this.img.filename=res;
        console.log(this.img.filename);

      })

    },
  },
};
</script>

<style lang="scss" scoped>
.previewImg {
  width: 100%;
}
.god-img{
  width:100%;
}
</style>
