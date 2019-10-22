<template>
  <div>
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span>Bitácora</span>
      </div>
      <!-- tablas -->
       <el-table
        :data="responseData.slice((currentPage-1)*pagesize,currentPage*pagesize).filter(data => !search || data.name.toLowerCase().includes(search.toLowerCase()))"
        style="width: 100%">
        <el-table-column
          prop="id_bitacora"
          label="ID"
          width="180">
        </el-table-column>
        <el-table-column
          prop="tabla"
          label="TABLA"
          width="180">
        </el-table-column>
        <el-table-column
          prop="cambioanterior"
          label="CAMBIO ANTERIOR">
        </el-table-column>
        <el-table-column
          prop="cambionuevo"
          label="CAMBIO NUEVO">
        </el-table-column>
        <el-table-column
          prop="fecha"
          label="FECHA">
        </el-table-column>
        <el-table-column
          prop="tipo"
          label="TIPO">
        </el-table-column>
        <el-table-column label="Operaciones" width="200">
        <template slot="header" slot-scope="scope">
          <el-input
            v-model="search"
            size="mini"
            placeholder="Buscar"/>
        </template>
        
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
        nombre: "",
        apellido: "",
        telefono: "",
        nit: "",
        
      },
      responseData:[],
      pagesize: 10,
      total: 0,
      currentPage: 1,
      search: '',
      fullscreenLoading: false,
      loading: false,
      rules: {
        nombre: [
          {
            required: true,
            message: "ingrese dato valido",
            trigger: "blur"
          }
        ],
        apellido: [
          {
            required: true,
            message: "ingrese dato valido",
            trigger: "blur"
          }
        ],
        nit: [
          {
            required: true,
            message: "ingrese dato valido",
            trigger: "blur"
          }
        ],
        telefono: [
          {
            required: true,
            message: "ingrese dato valido",
            trigger: "blur"
          }
        ]
      },
    };
  },     
  mounted() {
    this.getPersona();
  },
  methods: {
    getPersona(){
      
      var url = 'getbitacora';
      axios.get(url).then(response =>{
        // console.log(response.data);
        this.total = response.data.length;
        this.responseData = response.data;
      })
    },
    current_change: function(currentPage) {
      this.currentPage = currentPage;
    },

  }
};
</script>

