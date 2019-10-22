<template>
  <div>
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span>Formulario Factura</span>
      </div>
      <el-form  :model="form" ref="form" label-width="120px" :rules="rules">
        <el-form-item label="Expediente:" prop="pregunta">
          <!-- <el-input v-model="form.cliente"></el-input> -->
            <el-select  name="idSede" class="vue-select" v-model="form.pregunta" placeholder="Seleccione" style="width:100%;">
                  <el-option v-for="(item,idx) in dataClientes" :key="idx" :label=" item.name " :value=" item.code "></el-option>
            </el-select>
        </el-form-item>

        <el-row :gutter="20">
         <el-col :span="12">
          <el-form-item label="Fecha:" prop="cliente">
              <el-date-picker
                v-model="form.cliente"
                type="date"
                placeholder="fecha">
              </el-date-picker>
          </el-form-item>
         </el-col>
         <el-col :span="12">
            <el-form-item label="Nit:" prop="descripcion">
                <el-input v-model="form.descripcion"></el-input>
            </el-form-item>
         </el-col>
         <el-col :span="12">
            <el-form-item label="No. Serie:" prop="serie">
                <el-input v-model="form.serie"></el-input>
            </el-form-item>
         </el-col>
         <el-col :span="12">
            <el-form-item label="No. Factura:" prop="factura">
                <el-input v-model="form.factura"></el-input>
            </el-form-item>
         </el-col>
        </el-row>

        <el-form-item>
          <el-button
          @click="onSubmit('form')"
          type="primary"
          class="btn btn-success"
          v-loading.fullscreen.lock="fullscreenLoading"
        >Guardar</el-button>
         
        </el-form-item>
      </el-form>
      <!-- tablas -->
       <el-table
        :data="responseData.slice((currentPage-1)*pagesize,currentPage*pagesize).filter(data => !search || data.serie.toLowerCase().includes(search.toLowerCase()))"
        style="width: 100%">
        <el-table-column
          prop="code"
          label="ID"
          width="180">
        </el-table-column>
        <el-table-column
          prop="fecha"
          label="Fecha"
          >
        </el-table-column>
        <el-table-column
          prop="nit"
          label="Nit"
          >
        </el-table-column>
        <el-table-column
          prop="serie"
          label="No. Serie"
          >
        </el-table-column>
        <el-table-column label="Operaciones" width="200">
        <template slot="header" slot-scope="scope">
          <el-input
            v-model="search"
            size="mini"
            placeholder="Buscar"/>
        </template>
        <!-- <template slot-scope="scope">
          <el-button
            size="mini"
            type="danger"
            @click="handleDelete(scope.row.code)"
          >Inactivar</el-button>
        </template> -->
      </el-table-column>
      </el-table>
       <div style="text-align: left;margin-top: 30px;">
      <el-pagination
        background
        layout="total,prev, pager, next"
        :total="total"
        @current-change="current_change"
      ></el-pagination>
    </div>
    </el-card>
  </div>
</template>

<script>
  import axios from 'axios';
export default {
  data() {
    return {
      form: {
        pregunta: "",
        cliente: "",
        descripcion: "",
        serie:"",
        factura:""
        
      },
      responseData:[],
      cliente:"seleccione",
      pagesize: 10,
      total: 0,
      currentPage: 1,
      search: '',
      dataCliente:[],
      dataClientes:[],
      fullscreenLoading: false,
      loading: false,
      rules: {
        pregunta: [
          {
            required: true,
            message: "ingrese dato valido",
            trigger: "blur"
          }
        ],
        cliente: [
          {
            required: true,
            message: "ingrese dato valido",
            trigger: "blur"
          }
        ],
        descripcion: [
          {
            required: true,
            message: "ingrese dato valido",
            trigger: "blur"
          }
        ],
        serie: [
          {
            required: true,
            message: "ingrese dato valido",
            trigger: "blur"
          }
        ],
        factura: [
          {
            required: true,
            message: "ingrese dato valido",
            trigger: "blur"
          }
        ],
        
      },
    };
  },     
  mounted() {
    this.getPersona();
    this.getdataPregunta();
    this.getdataClientes();
  },
  methods: {
    onSubmit(form) {
        const axios = require('axios');
        var url = '/addfactura';
        this.$refs[form].validate(valid => {
        const h = this.$createElement;
        if (valid) {
            this.fullscreenLoading = true;        
            axios.post(url, {
                cliente: this.form.pregunta,
                tipocliente: this.form.cliente,
                comentario: this.form.descripcion,
                serie: this.form.serie,
                factura: this.form.factura,
               
            })
            .then(response => {    
                // console.log(response.data);        
                const status = JSON.parse(response.status);
                if (status == "200") {
                this.$message({
                    message: h("p", null, [
                    h("i", { style: "color: teal" }, "Datos Actualizados!")
                    ]),
                    type: 'success'
                });
                this.getPersona();
                this.fullscreenLoading = false;
                this.form.pregunta= "";
                this.form.cliente ="";
                this.form.descripcion= "";
                this.form.serie= "";
                this.form.factura= "";
                
                }
            })
        }else {
            this.$message.error({
                message: h("p", null, [
                h("i", { style: "color: red" }, 'Ingrese datos validos')
                ])
            });
          return false;
        }
      });
    },
    getPersona(){
      
      var url = 'getfactura';
      axios.get(url).then(response =>{
        // console.log(response.data);
        this.total = response.data.length;
        this.responseData = response.data;
      })
    },
    getdataPregunta(){
      
      var url = 'getdexpediente';
      axios.get(url).then(response =>{
        this.dataClientes = response.data;
      })
    },
    getdataClientes(){
      
      var url = 'getTCliente';
      axios.get(url).then(response =>{
        this.dataCliente = response.data;
      })
    },
    handleDelete(row) {
          const config = { headers: {'Content-Type': 'application/json'} };
          const h = this.$createElement;
          this.fullscreenLoading = true;
          var url = "/deleteCliente";
          axios
            .put(url, {
              id: row
            },config
            )
            .then(response => {
              const status = JSON.parse(response.status);
              if (status == "200") {
                this.$message({
                  message: h("p", null, [
                    h("i", { style: "color: teal" }, "Inactivo!")
                  ]),
                  type: 'success'
                });
                // this.formInline.name = "";
                this.getPersona();
                this.fullscreenLoading = false;
              }
            })
            .catch(error => {
                this.$message.error({
                  message: h("p", null, [
                    h("i", { style: "color: red" }, 'Error, servidor no encontrado')
                  ])
                });
                this.fullscreenLoading = false;
            });
    },
    current_change: function(currentPage) {
      this.currentPage = currentPage;
    },

  }
};
</script>

