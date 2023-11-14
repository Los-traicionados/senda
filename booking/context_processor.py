from decimal import Decimal

def total_pack(request):
    total = 0
    if request.session["pack_carrito"]:
        print(request.session["pack_carrito"])
        for key, value in request.session["pack_carrito"].items():
            total += Decimal(value["acumulado"])
    print('Total', total)

    return {"total_pack": total}