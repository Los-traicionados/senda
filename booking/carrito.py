# Sessiones necesarias para el Carrito de Pack
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
                "imagen": pack.pa_imagen.url,
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

    
# Sessiones necesarias para el Carrito de Actividad
class ActividadCarrito:
    def __init__(self, request):
        self.request = request
        self.session = request.session
        actividad_carrito = self.session.get("actividad_carrito")
        if not actividad_carrito:
            self.session["actividad_carrito"] = {}
            self.actividad_carrito = self.session["actividad_carrito"]
        else:
            self.actividad_carrito = actividad_carrito

    def guardar_actividad_carrito(self):
        self.session["actividad_carrito"] = self.actividad_carrito
        self.session.modified = True

    def limpiar_actividad(self):
        self.session["actividad_carrito"] = {}
        self.session.modified = True

    def agregar_actividad(self, actividad):
        id = str(actividad.id)
        if id not in self.actividad_carrito.keys():
            self.actividad_carrito[id]={
                "prod_id": id,
                "nombre": actividad.act_nombre,
                "imagen": actividad.act_imagen.url,
                "acumulado": float(actividad.act_precio),
                "cantidad": 1,
            }
        else:
            self.actividad_carrito[id]["cantidad"] += 1
            self.actividad_carrito[id]["acumulado"] += float(actividad.act_precio)

        self.guardar_actividad_carrito()

    def eliminar_actividad(self, actividad):
        id = str(actividad.id)
        if id in self.actividad_carrito:
            del self.actividad_carrito[id]
            self.guardar_actividad_carrito()
    
    def restar_actividad(self, actividad):
        id = str(actividad.id)
        if id in self.actividad_carrito.keys():
            if self.actividad_carrito[id]["cantidad"] > 1:
                self.actividad_carrito[id]["cantidad"] -= 1
                self.actividad_carrito[id]["acumulado"] -= float(actividad.act_precio)
            else:
                # Si la cantidad es 1, eliminar el actividad
                del self.actividad_carrito[id]

            self.guardar_actividad_carrito()

# Sessiones necesarias para el Carrito de Hotel
class HotelCarrito:
    def __init__(self, request):
        self.request = request
        self.session = request.session
        hotel_carrito = self.session.get("hotel_carrito")
        if not hotel_carrito:
            self.session["hotel_carrito"] = {}
            self.hotel_carrito = self.session["hotel_carrito"]
        else:
            self.hotel_carrito = hotel_carrito

    def guardar_hotel_carrito(self):
        self.session["hotel_carrito"] = self.hotel_carrito
        self.session.modified = True

    def limpiar_hotel(self):
        self.session["hotel_carrito"] = {}
        self.session.modified = True

    def agregar_hotel(self, hotel):
        id = str(hotel.id)
        if id not in self.hotel_carrito.keys():
            self.hotel_carrito[id]={
                "prod_id": id,
                "nombre": hotel.ho_nombre,
                "imagen": hotel.ho_imagen.url,
                "acumulado": float(hotel.ho_precio),
                "cantidad": 1,
            }
        else:
            self.hotel_carrito[id]["cantidad"] += 1
            self.hotel_carrito[id]["acumulado"] += float(hotel.ho_precio)

        self.guardar_hotel_carrito()

    def eliminar_hotel(self, hotel):
        id = str(hotel.id)
        if id in self.hotel_carrito:
            del self.hotel_carrito[id]
            self.guardar_hotel_carrito()
    
    def restar_hotel(self, hotel):
        id = str(hotel.id)
        if id in self.hotel_carrito.keys():
            if self.hotel_carrito[id]["cantidad"] > 1:
                self.hotel_carrito[id]["cantidad"] -= 1
                self.hotel_carrito[id]["acumulado"] -= float(hotel.ho_precio)
            else:
                # Si la cantidad es 1, eliminar el hotel
                del self.hotel_carrito[id]

            self.guardar_hotel_carrito()

# Sessiones necesarias para el Carrito de Vuelo
class VueloCarrito:
    def __init__(self, request):
        self.request = request
        self.session = request.session
        vuelo_carrito = self.session.get("vuelo_carrito")
        if not vuelo_carrito:
            self.session["vuelo_carrito"] = {}
            self.vuelo_carrito = self.session["vuelo_carrito"]
        else:
            self.vuelo_carrito = vuelo_carrito

    def guardar_vuelo_carrito(self):
        self.session["vuelo_carrito"] = self.vuelo_carrito
        self.session.modified = True

    def limpiar_vuelo(self):
        self.session["vuelo_carrito"] = {}
        self.session.modified = True

    def agregar_vuelo(self, vuelo):
        id = str(vuelo.id)
        if id not in self.vuelo_carrito.keys():
            self.vuelo_carrito[id]={
                "prod_id": id,
                "nombre": vuelo.vu_nombre,
                "imagen": vuelo.vu_imagen.url,
                "acumulado": float(vuelo.vu_precio),
                "cantidad": 1,
            }
        else:
            self.vuelo_carrito[id]["cantidad"] += 1
            self.vuelo_carrito[id]["acumulado"] += float(vuelo.vu_precio)

        self.guardar_vuelo_carrito()

    def eliminar_vuelo(self, vuelo):
        id = str(vuelo.id)
        if id in self.vuelo_carrito:
            del self.vuelo_carrito[id]
            self.guardar_vuelo_carrito()
    
    def restar_vuelo(self, vuelo):
        id = str(vuelo.id)
        if id in self.vuelo_carrito.keys():
            if self.vuelo_carrito[id]["cantidad"] > 1:
                self.vuelo_carrito[id]["cantidad"] -= 1
                self.vuelo_carrito[id]["acumulado"] -= float(vuelo.vu_precio)
            else:
                # Si la cantidad es 1, eliminar el vuelo
                del self.vuelo_carrito[id]

            self.guardar_vuelo_carrito()
