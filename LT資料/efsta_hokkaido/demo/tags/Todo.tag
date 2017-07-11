<Todo>
  <form onsubmit={ submitHandler }>
    <input name="task">
    <button>Add #{ items.length + 1 }</button>
  </form>

  <ul>
    <li each={ item, i in items }>{ item }</li>
  </ul>


  <script>
   this.items = []

   submitHandler(e) {
     var input = e.target['task']
     this.items.push(input.value)
       input.value = ''
   }
  </script>
</Todo>
