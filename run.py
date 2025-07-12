from src.source.traeted.d_address import DAddress
from src.source.traeted.d_customer import DCustomer
from src.source.traeted.d_film import DFilm
from src.source.traeted.d_staff import DStaff
from src.source.traeted.d_store import DStore
from src.source.traeted.f_payment_traeted import FPaymentTraeted

DAddress().run()
DCustomer().run()
DFilm().run()
DStaff().run()
DStore().run()
FPaymentTraeted().run()