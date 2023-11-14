class PackCarrito:
    def __init__(self, request):
        self.request = request
        self.session = request.session
        pack_carrito = self.session.get("pack_carrito")
        if not pack_carrito:
            self.session["pack_carrito"] = {}
            self.pack_carrito = self.session["pack_carrito"]
        else:
            self.pack_carrito = pack_carrito

    def guardar_pack_carrito(self):
        self.session["pack_carrito"] = self.pack_carrito
        self.session.modified = True

    def limpiar_pack(self):
        self.session["pack_carrito"] = {}
        self.session.modified = True

    def agregar_pack(self, pack):
        id = str(pack.id)
        if id not in self.pack_carrito.keys():
            self.pack_carrito[id]={
                "prod_id": id,
                "nombre": pack.pa_nombre,
                "acumulado": float(pack.pa_precio),
                "cantidad": 1,
            }
        else:
            self.pack_carrito[id]["cantidad"] += 1
            self.pack_carrito[id]["acumulado"] += float(pack.pa_precio)

        self.guardar_pack_carrito()

    def eliminar_pack(self, pack):
        id = str(pack.id)
        if id in self.pack_carrito:
            del self.pack_carrito[id]
            self.guardar_pack_carrito()
    
    def restar_pack(self, pack):
        id = str(pack.id)
        if id in self.pack_carrito.keys():
            if self.pack_carrito[id]["cantidad"] > 1:
                self.pack_carrito[id]["cantidad"] -= 1
                self.pack_carrito[id]["acumulado"] -= float(pack.pa_precio)
            else:
                # Si la cantidad es 1, eliminar el pack
                del self.pack_carrito[id]

            self.guardar_pack_carrito()

    


