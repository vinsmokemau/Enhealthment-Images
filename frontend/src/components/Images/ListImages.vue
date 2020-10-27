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
          <h2>Listado de Eventos</h2>

          <div class="col-md-12">
            <div class="overflow-auto">
              <b-pagination
                v-model="currentPage"
                :total-rows="rows"
                :per-page="perPage"
                aria-controls="my-table"
              ></b-pagination>
            </div>
            <p class="mt-3">Página: {{ currentPage }}</p>

            <b-table striped hover :items="images" :fields="fields">
              <template v-slot:cell(id)="row">
                <p>{{row.item.id}}</p>
              </template>
              <template v-slot:cell(name)="row">
                <p>{{row.item.name}}</p>
              </template>
              <template v-slot:cell(image)="row">
                <img :src="row.item.image" style="width: 200px; height: 200px;">
              </template>
            </b-table>
          </div>

        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
export default {
  data () {
    return {
      perPage: 5,
      currentPage: 1,
      fields: [
        { key: 'id', label: 'ID'},
        { key: 'name', label: 'Nombre'},
        { key: 'image', label: 'Imagen'},
        { key: 'action', label: ''},
      ],
      images: [],
    }
  },
  methods: {
    getImages () {
      const path = 'http://localhost:8000/api/v1.0/images/'
      axios.get(path).then((response) => {
        this.images = response.data
      })
      .catch((error) => {
        console.log(error)
      })
    }
  },
  computed: {
    rows() {
      return this.images.length
    }
  },
  created(){
    this.getImages()
  }
}
</script>

<style lang="css" scoped>
</style>
