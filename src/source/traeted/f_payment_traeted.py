from os.path import dirname as dirname
from ...utils.postgres_connection import PostgressConection

class FPaymentTraeted(PostgressConection):
    def __init__(self):
        super().__init__()
        self.table_name = 'f_payment_traeted'
        querys_path = f'{dirname(dirname(dirname(__file__)))}/sql/'
        self.query = f"({open(f'{querys_path}f_payment_traeted.sql', 'r').read()}) as f_payment_traeted"

    def run(self):
        self.df = self.execute_query(self.query)
        self.create_trated_table(self.df, self.table_name)