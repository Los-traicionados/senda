from decimal import Decimal

def total_carrito(request):
    total = 0
    # Capturando el acumulado de Pack
    if request.session.get("pack_carrito"):
        print(request.session["pack_carrito"])
        for key, value in request.session["pack_carrito"].items():
            total += Decimal(value["acumulado"])
    # Capturando el acumulado de Actividad
    if request.session.get("actividad_carrito"):
        print(request.session["actividad_carrito"])
        for key, value in request.session["actividad_carrito"].items():
            total += Decimal(value["acumulado"])
    # Capturando el acumulado de Hotel
    if request.session.get("hotel_carrito"):
        print(request.session["hotel_carrito"])
        for key, value in request.session["hotel_carrito"].items():
            total += Decimal(value["acumulado"])
    # Capturando el acumulado de Vuelo
    if request.session.get("vuelo_carrito"):
        print(request.session["vuelo_carrito"])
        for key, value in request.session["vuelo_carrito"].items():
            total += Decimal(value["acumulado"])
    
    return {"total_carrito": total}