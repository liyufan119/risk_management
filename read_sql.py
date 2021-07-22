def __init__(self,host,user,pwd,db):
self.host = '172.21.195.22'
self.user = 'liyufan'
self.pwd = 'Liyf#001001'
self.db = 'dw_detail'
def __getConn(self):
if not self.db:
raise(NameError,'没有设置数据库信息')
self.conn = connect(host=self.host, prot = 10000, user=self.user, password=self.pwd, database=self.db, auth_mechanism='PLAIN')
cur = self.conn.cursor()
if not cur:
raise(NameError,'连接数据库失败')
else:
return cur

writer = pd.ExcelWriter(file)
df_fetch_data[rs_startrow:i*N].to_excel(writer, header=isHeader, index=False, startrow=startRow)
def exportToExcel(self, **args):

for sourceTB in args['sourceTB']:
    arc_dict = dict(
                    sourceTB = sourceTB,
                    path=args['path'],
                    startRow=args['startRow'],
                    isHeader=args['isHeader'],
                    batch=args['batch']
                   )

print('\n当前导出的数据表为：%s' %(sourceTB))
self.writeToExcel(**arc_dict)
return 'success'


