<template>
  <div>
    <el-form
      ref="elForm"
      :model="formData"
      :rules="rules"
      size="medium"
      label-width="100px"
    >
      <el-form-item label="姓名" prop="realname">
        <el-input
          v-model="formData.realname"
          placeholder="请输入姓名"
          :maxlength="11"
          prefix-icon="el-icon-user-solid"
          :style="{ width: '100%' }"
        ></el-input>
      </el-form-item>
      <el-form-item label="性别" prop="gender">
        <el-select
          v-model="formData.gender"
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
        <el-input
          v-model="formData.idnumber"
          placeholder="请输入身份证号"
          :style="{ width: '100%' }"
        ></el-input>
      </el-form-item>
      <el-form-item label="出生日期" prop="birthdate">
        <el-date-picker
          v-model="formData.birthdate"
          format="yyyy-MM-dd"
          value-format="yyyy-MM-dd"
          :style="{ width: '100%' }"
          placeholder="请选择出生日期"
        ></el-date-picker>
      </el-form-item>
      <el-form-item label="年龄" prop="age">
        <el-input
          v-model="formData.age"
          placeholder="请输入年龄"
          :style="{ width: '100%' }"
        ></el-input>
      </el-form-item>
      <el-form-item label="家庭住址" prop="homeaddress">
        <el-input
          v-model="formData.homeaddress"
          placeholder="请输入家庭住址"
          :style="{ width: '100%' }"
        ></el-input>
      </el-form-item>
      <el-form-item label="挂号日期" prop="registertime">
        <el-date-picker
          v-model="formData.registertime"
          format="yyyy-MM-dd"
          value-format="yyyy-MM-dd"
          :style="{ width: '100%' }"
          placeholder="请选择挂号日期"
        ></el-date-picker>
      </el-form-item>
      <el-form-item prop="getoper">
        <el-button
          type="primary"
          icon="el-icon-mouse"
          size="medium"
          @click="getoper"
        >
          获取挂号员账号
        </el-button>
      </el-form-item>
      <el-form-item prop="getdocter">
        <el-button
          type="primary"
          icon="el-icon-mouse"
          size="medium"
          @click="getdocter"
        >
          选择医生
        </el-button>
      </el-form-item>
      <el-form-item size="large">
        <el-button type="primary" @click="submitForm"
        v-hasPermi="['system:register:add']">提交</el-button>
        <el-button @click="resetForm">重置</el-button>
      </el-form-item>
    </el-form>

    <el-dialog
      :visible.sync="open"
      title="医生选择"
      style="width: 80%"
      append-to-body
    >
      <el-input
        v-model="formData.deptname"
        placeholder="更多科室请搜索"
        :maxlength="11"
        show-word-limit
        clearable
        prefix-icon="el-icon-mobile"
        :style="{ width: '100%' }"
      ></el-input>
      <el-button
        type="primary"
        icon="el-icon-search"
        size="medium"
        @click="querydept"
      >
        搜索科室
      </el-button>
      <el-select
        v-model="formData.deptid"
        placeholder="请选择科室"
        @change="deptChanged()"
      >
        <el-option
          v-for="item in deptOptions"
          :key="item.id"
          :label="item.deptname"
          :value="item.id"
        >
        </el-option>
      </el-select>
      <el-select
        v-model="formData.userid"
        placeholder="请选择医生"
        @change="doctorChanged()"
      >
        <el-option
          v-for="item in deptOptionofuser"
          :key="item.userId"
          :label="item.nickName"
          :value="item.userId"
        >
        </el-option>
      </el-select>
      <div slot="footer">
        <el-button type="primary" @click="handleConfirm"
        >确定</el-button>
      </div>
    </el-dialog>
  </div>
</template>
  <script>
import { getUserProfile, listUser } from "@/api/system/user";
import { listDepartment } from "@/api/system/department";
import { addRegister} from "@/api/system/register";
export default {
  components: {},
  props: [],
  data() {
    return {
      formData: {
        realname: "",
        gender: undefined,
        idnumber: undefined,
        birthdate: null,
        age: undefined,
        homeaddress: undefined,
        registertime: null,
        getoper: undefined,
        getdocter: undefined,
        deptname: "",
        deptid: undefined,
        userid: undefined,
        registerid:undefined
      },
      deptOptions: undefined,
      deptOptionofuser: undefined,
      open: false,
      oper: {
        id: "",
        name: "",
      },
      queryParams: {
        deptname: undefined,
        deptId: undefined,
      },
      rules: {
        name: [
          {
            required: true,
            message: "请输入姓名",
            trigger: "blur",
          },
        ],
        gender: [],
        idnumber: [],
        birthdate: [],
        age: [],
        homeaddress: [],
        registertime: [
          {
            required: true,
            message: "请选择挂号日期",
            trigger: "change",
          },
        ],
      },
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
    };
  },
  computed: {},
  watch: {},
  created() {},
  mounted() {},
  methods: {
    submitForm() {
      this.$refs["elForm"].validate((valid) => {
        if (!valid) return;
        // TODO 提交表单
        this.formData.registerid=this.oper.id
        if (
          this.formData.userid == undefined ||
          this.formData.deptid == undefined ||
          this.formData.registerid == undefined
        ) {
          this.$message({
            type: "error",
            message: "请选择医生和获取挂号员",
          });
        }
        addRegister(this.formData).then((response) => {
          this.$modal.msgSuccess("挂号成功");
          this.open = false;
          this.getList();
        });
        this.resetForm();
      });
    },
    resetForm() {
      this.$refs["elForm"].resetFields();
    },
    getdocter() {
      this.open = true;
      listDepartment(this.queryParams).then((response) => {
        this.deptOptions = response.records;
      });
    },
    getoper() {
      getUserProfile().then((response) => {
        this.oper.id = response.data.userId;
        this.oper.name = response.data.userName;
      });
      this.$message({
        type: "success",
        message: "你好~" + this.oper.name,
      });
      //console.log(this.oper);
    },
    handleConfirm() {
      this.open = false;
      if (
        this.formData.userid != undefined &&
        this.formData.deptid != undefined
      ) {
        this.$message({
          type: "success",
          message: "选择成功",
        });
      } else {
        this.$message({
          type: "error",
          message: "选择失败请重试",
        });
      }
    },
    getdoctor() {
      listUser(this.queryParams).then((response) => {
        this.deptOptionofuser = response.rows;
        //console.log(this.deptOptionofuser);
      });
    },
    userdeptQuery(id) {
      this.queryParams.deptId = id;
      console.log(id);
      this.getList();
    },
    querydept() {
      this.queryParams.deptname = this.formData.deptname;
      this.queryParams.deptId = undefined;
      listDepartment(this.queryParams).then((response) => {
        this.deptOptions = response.records;
      });
      this.formData.deptid=undefined;
      this.$forceUpdate();
      
    },
    deptChanged(e) {
      // 强制刷新
      this.$forceUpdate();
      this.deptOptionofuser = undefined;
      this.queryParams.deptId = this.formData.deptid;
      //console.log(this.formData.deptId);
      this.getdoctor();
    },
    doctorChanged() {
      this.$forceUpdate();
      //console.log(this.formData.userid);
    },
  },
};
</script>
  <style>
</style>
  