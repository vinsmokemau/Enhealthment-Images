<template lang="html">
  <div>
    <b-navbar type="dark" variant="dark">
      <b-navbar-nav>
        <b-nav-item href="/">Home</b-nav-item>
      </b-navbar-nav>
    </b-navbar>
    
    <div class="container">
      
      <div class="row">
        <div class="col text-left">
          <h2>Subir Imagen</h2>
        </div>
      </div>

      <div class="row">
        <div class="col">
          <div class="card">
            <div class="card-body">
              
              <form @submit="onSubmit">

                <div class="form-group row">
                  <label for="name" class="col-sm-2 col-form-label">Nombre</label>
                  <div class="col-sm-6">
                    <input type="text" placeholder="Ej: Radiografia" name="name" class="form-control">
                  </div>
                </div>

                <div class="form-group row">
                  <label for="image" class="col-sm-2 col-form-label">Imagen</label>
                  <div class="col-sm-6">
                    <input type="file" name="image" class="form-control">
                  </div>                  
                </div>

                <div class="rows">
                  <div class="col text-left">
                    <b-button type="submit" variant="success">Subir</b-button>
                    <b-button type="submit" variant="danger" :to="{name:'ListImages'}">Cancelar</b-button>
                  </div>
                </div>

              </form>

            </div>
          </div>
        </div>
      </div>
    
    </div>

  </div>
</template>

<script>

import axios from 'axios';
import swal from 'sweetalert';

export default {
  data () {
    return {
      form: {
        name: '',
        image: '',
      },
    }
  },
  methods: {
    onSubmit (evt) {
      evt.preventDefault()

      const path = `http://localhost:8000/api/v1.0/images/`

      axios.post(path).then((response) => {
        this.form.name = response.data.name
        this.form.image = response.data.image

        swal("Imagen subida exitosamente!", "", "success")
      })
      .catch((error) => {
        swal("Hubo un error!", error, "error")
      })
    },
  },
}
</script>

<style lang="css" scoped>
</style>
