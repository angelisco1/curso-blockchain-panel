<template>
  <div>
    <h1>Retos</h1>
    <div v-for="apuesta in apuestas" :key="apuesta.id">
      <p>{{apuesta.titulo}}</p>
      <p>Posible perdida: {{apuesta.dinero}} WEIs</p>
      <button type="button" @click="completarReto(apuesta.id, true)">Reto completado</button>
      <button type="button" @click="completarReto(apuesta.id, false)">Reto falliod</button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Home',
  data() {
    return {
      apuestas: []
    }
  },
  methods: {
    completarReto(id, completado) {
      this.$contrato.methods.completarApuesta(id, completado)
        .send({
          from: window.ethereum.selectedAddress
        })
    },
    getApuestas() {
      this.$contrato.methods.getApuestasIds()
        .call()
        .then(idsApuestas => {
          console.log(idsApuestas)

          const apuestas = idsApuestas.map(id => {
            return this.$contrato.methods.apuestas(id)
              .call()
          })

          return Promise.all(apuestas)
        })
        .then(datos => {
          console.log(datos)
          const arrApuestas = []
          for (const apuesta of datos) {
            arrApuestas.push({
              dinero: apuesta.dinero,
              id: apuesta.id,
              titulo: apuesta.titulo,
              pagado: apuesta.pagado,
              usuario: apuesta.usuario,
              notario: apuesta.notario
            })
          }
          this.apuestas = arrApuestas
        })
    }
  },
  created() {
    this.getApuestas()
    this.$contrato.events.ApuestaCompletada({}, (err, event) => {
      const datos = event.returnValues;
      alert(`La apuesta ${datos._apuestaId} ha resultado ${datos._ganada ? 'ganadora' : 'fallida'}`)
    })
  }
}
</script>
