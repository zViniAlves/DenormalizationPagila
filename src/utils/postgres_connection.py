import os
from dotenv import load_dotenv,find_dotenv
from pyspark.sql import SparkSession

load_dotenv(find_dotenv())

class PostgressConection():

    def __init__(self):
        self.spark = SparkSession.builder.appName('Postgres Connection').getOrCreate()
        self.host = os.getenv('HOST_DB')
        self.port = os.getenv('PORT_DB')
        self.user = os.getenv('USER_DB')
        self.psw = os.getenv('PSW_DB')

        if not self.host or not self.port or not self.user or not self.psw:
            raise FileNotFoundError('Could not load the environment variables from the .env file. Please verify that it is set up correctly.')

        self.url = f"jdbc:postgresql://{self.host}:{self.port}/pagila"
        self.properties = {
            "user": self.user,
            "password": self.psw
        }

    def execute_query(self,query:str):
        return self.spark.read.jdbc(url=self.url,table=query,properties=self.properties)

    def create_trated_table(self,df,table_name:str):
        df.write.mode('overwrite').jdbc(url=self.url,table=f'traeted.{table_name}',properties=self.properties)