<template>
  <div>
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span>Formulario Detalle Factura</span>
      </div>
      <el-form  :model="form" ref="form" label-width="120px" :rules="rules">
        <el-form-item label="Producto:" prop="producto">
          <!-- <el-input v-model="form.cliente"></el-input> -->
            <el-select  name="idSede" class="vue-select" v-model="form.producto" placeholder="Seleccione" style="width:100%;">
                  <el-option v-for="(item,idx) in dataClientes" :key="idx" :label=" item.name " :value=" item.code "></el-option>
            </el-select>
        </el-form-item>
        <el-form-item label="Factura:" prop="factura">
          <!-- <el-input v-model="form.cliente"></el-input> -->
            <el-select  name="idSede" class="vue-select" v-model="form.factura" placeholder="Seleccione" style="width:100%;">
                  <el-option v-for="(item,idx) in dataCliente" :key="idx" :label=" item.name " :value=" item.id_factura "></el-option>
            </el-select>
        </el-form-item>

        <el-row :gutter="20">
         <el-col :span="12">
          <el-form-item label="Cantidad:" prop="cantidad">
              <el-input v-model="form.cantidad"></el-input>
          </el-form-item>
         </el-col>
         <el-col :span="12">
            <el-form-item label="Precio:" prop="precio">
                <el-input v-model="form.precio"></el-input>
            </el-form-item>
         </el-col>
         <el-col :span="12">
            <el-form-item label="Total" prop="total">
                <el-input v-model="form.total"></el-input>
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
          prop="producto"
          label="Producto"
          >
        </el-table-column>
        <el-table-column
          prop="cantidad"
          label="Cantidad"
          >
        </el-table-column>
        <el-table-column
          prop="precio"
          label="Precio"
          >
        </el-table-column>
        <el-table-column
          prop="total"
          label="Total"
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
        producto: "",
        factura: "",
        cantidad: "",
        precio:"",
        total:""
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
        producto: [
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
        cantidad: [
          {
            required: true,
            message: "ingrese dato valido",
            trigger: "blur"
          }
        ],
        precio: [
          {
            required: true,
            message: "ingrese dato valido",
            trigger: "blur"
          }
        ],
        total: [
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
        var url = '/adddFactura';
        this.$refs[form].validate(valid => {
        const h = this.$createElement;
        if (valid) {
            this.fullscreenLoading = true;        
            axios.post(url, {
                producto: this.form.producto,
                factura: this.form.factura,
                cantidad: this.form.cantidad,
                precio: this.form.precio,
                total: this.form.total,
               
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
                this.form.producto= "";
                this.form.factura ="";
                this.form.cantidad= "";
                this.form.precio= "";
                this.form.total= "";
                
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
      
      var url = 'getdFactura';
      axios.get(url).then(response =>{
        // console.log(response.data);
        this.total = response.data.length;
        this.responseData = response.data;
      })
    },
    getdataPregunta(){
      
      var url = 'getProducto';
      axios.get(url).then(response =>{
        this.dataClientes = response.data;
      })
    },
    getdataClientes(){
      
      var url = 'getfactura';
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

