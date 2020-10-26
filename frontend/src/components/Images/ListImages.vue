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

            <b-table 
              striped hover 
              :items="events"
              :fields="fields"
              :per-page="perPage"
              :current-page="currentPage">
              <template slot="action" slot-scope="data">
                <b-button size="sm" variant="primary" :to="{ name:'Event', params: {eventUUID: data.item.uuid} }">
                  Ver más
                </b-button>
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
        { key: 'uuid', label: 'UUID'},
        { key: 'name', label: 'Nombre'},
        { key: 'reporter', label: 'Reporter'},
        { key: 'description', label: 'Descripción'},
        { key: 'type', label: 'Tipo'},
        { key: 'location', label: 'Locación'},
        { key: 'datetime', label: 'Fecha Unix'},
        { key: 'action', label: ''},
      ],
      events: [],
    }
  },
  methods: {
    getEvents () {
      const path = 'http://localhost:8000/events/'
      axios.get(path).then((response) => {
        this.events = response.data
      })
      .catch((error) => {
        console.log(error)
      })
    }
  },
  computed: {
    rows() {
      return this.events.length
    }
  },
  created(){
    this.getEvents()
  }
}
</script>

<style lang="css" scoped>
</style>
