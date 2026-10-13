-- 1.创建数据库
create DATABASE ai_chat_app;

-- 2.切换到该数据库
use ai_chat_app;

-- 3. 创建用户表 (users)
CREATE TABLE users (
    id         INT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT '用户ID',
    username   VARCHAR(50)  NOT NULL UNIQUE COMMENT '用户名',
    password   VARCHAR(255) NOT NULL COMMENT '加密密码',
    created_at DATETIME     DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间'
) COMMENT '用户表';

-- 4. 创建对话记录表 (conversations)
CREATE TABLE conversations (
    id         INT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT '记录ID',
    user_id    INT UNSIGNED NOT NULL COMMENT '所属用户ID',
    role       ENUM('user', 'assistant') NOT NULL COMMENT '角色',
    content    TEXT         NOT NULL COMMENT '消息内容',
    created_at DATETIME     DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) COMMENT '对话记录表';
