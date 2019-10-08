<template>
  <div>
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span>Formulario Persona</span>
      </div>
      <el-form  :model="form" ref="form" label-width="120px">
        <el-form-item label="Nombre:">
          <el-input v-model="form.nombre"></el-input>
        </el-form-item>

        <el-form-item label="Apellido:">
            <el-input v-model="form.apellido" ></el-input>
        </el-form-item>
        <el-row :gutter="20">
         <el-col :span="12">
            <el-form-item label="Telefono:">
                <el-input v-model="form.telefono"></el-input>
            </el-form-item>
         </el-col>
         <el-col :span="12">
            <el-form-item label="Nit:">
                <el-input v-model="form.nit"></el-input>
            </el-form-item>
         </el-col>
        </el-row>

        <el-form-item>
          <el-button
          @click="onSubmit('form')"
          type="primary"
          class="btn btn-success"
          
        >Guardar</el-button>
          <el-button>Cancel</el-button>
        </el-form-item>
      </el-form>
    </el-card>
  </div>
</template>

<script>
export default {
  data() {
    return {
      form: {
        nombre: "",
        apellido: "",
        telefono: "",
        nit: "",
        
      }
    };
  },
  methods: {
    onSubmit(form) {
        const axios = require('axios');
        var url = '/addPersona';
                
        axios
        .post(url, {
            nombre: this.form.nombre,
            apellido: this.form.apellido,
            telefono: this.form.telefono,
            nit : this.form.nit,
        }
        )
        .then(response => {    
            console.log(response.data);        
            // const status = JSON.parse(response.status);
            // if (status == "200") {
            // this.$message({
            //     message: h("p", null, [
            //     h("i", { style: "color: teal" }, "Datos Actualizados!")
            //     ]),
            //     type: 'success'
            // });
            // this.getPlantillasData();
            // this.dialogFormVisible = false;
            // this.form.name= "";
            // this.form.address ="";
            // }
        })
    }
  }
};
</script>

