import pymysql

# 1. 建立连接
conn = pymysql.connect(
    host='localhost',
    port=3306,
    user='root',
    password='56162818' ,            # 实践中应从环境变量读取!!!
    database='ai_chat_app',     # 指定要操作的数据库
    charset='utf8mb4'
)

# 2. 创建游标（可以理解为一个执行SQL的"操作杆"）
cursor = conn.cursor()

# 3. 执行 SQL 命令
cursor.execute("SELECT * FROM users;")

# 4. 获取结果
results = cursor.fetchall()
for row in results:
    print(row)

# 5. 关闭资源（先关游标，再关连接）
# cursor.close()
# conn.close()