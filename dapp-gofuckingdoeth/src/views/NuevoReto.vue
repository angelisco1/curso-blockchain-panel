<template>
  <div>
    <h1>Nuevo reto</h1>
    <form @submit.prevent="crearReto">
      <div>
        <label for="titulo">Título</label>
        <input type="text" v-model="reto.titulo">
      </div>
      <div>
        <label for="ethers">Ethers</label>
        <input type="number" v-model="reto.dinero">
      </div>
      <div>
        <label for="notario">Dirección del notario</label>
        <input type="text" v-model="reto.notario">
      </div>

      <button type="submit">Crear reto</button>

    </form>
  </div>
</template>

<script>
export default {
  data() {
    return {
      reto: {
        dinero: 1,
        notario: '0xd61b4ca28b633673849fe8ade8324c07de9c7f67',
        titulo: 'Correr una marathon'
      }
    }
  },
  methods: {
    crearReto() {
      const idApuesta = Math.random().toString().slice(2);
      this.$contrato.methods.crearApuesta(idApuesta, this.reto.titulo, this.reto.notario)
        .send({
          from: window.ethereum.selectedAddress,
          value: window.web3.utils.toWei(this.reto.dinero.toString(), 'ether')
        })
    }
  }
}
</script>