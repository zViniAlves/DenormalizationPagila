from os.path import dirname as dirname
from ...utils.postgres_connection import PostgressConection

class DStaff(PostgressConection):
    def __init__(self):
        super().__init__()
        self.table_name = 'd_staff'
        querys_path = f'{dirname(dirname(dirname(__file__)))}/sql/'
        self.query = f"({open(f'{querys_path}d_staff.sql', 'r').read()}) as d_staff"

    def run(self):
        self.df = self.execute_query(self.query)
        self.create_trated_table(self.df, self.table_name)