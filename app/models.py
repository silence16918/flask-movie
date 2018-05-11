# _*_ coding: utf-8 _*_
__author__ = 'chen'
__date__ = '2018/1/23 16:43'

from datetime import datetime
from app import db

# from flask import Flask
# from flask_sqlalchemy import SQLAlchemy
# app = Flask(__name__)
# app.config["SQLALCHEMY_DATABASE_URI"] = "mysql+pymysql://root:@127.0.0.1:3306/movie"
# app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = True
# db = SQLAlchemy(app)


#会员
class User(db.Model):
    __tablename__ = "user"
    id = db.Column(db.Integer, primary_key=True) #编号
    name = db.Column(db.String(100), unique=True) #会员名
    pwd = db.Column(db.String(100)) #密码
    email = db.Column(db.String(100), unique=True) #邮箱
    phone = db.Column(db.String(11), unique=True) #电话
    info = db.Column(db.Text) #简介
    face = db.Column(db.String(255), unique=True) #头像
    addtime = db.Column(db.DateTime, index=True, default=datetime.now) #添加时间,索引
    uuid = db.Column(db.String(255), unique=True) #唯一标志
    userlogs = db.relationship('Userlog', backref='user') #会员的登录日志关联
    comments = db.relationship('Comment', backref='user') #会员的评论关联
    moviecols = db.relationship('Moviecol', backref='user') #会员的收藏关联

    def __repr__(self):
        return "<User %r>" % self.name

    def check_pwd(self, pwd):
        from werkzeug.security import check_password_hash
        return check_password_hash(self.pwd, pwd)#正确返回True,错误返回False

#会员登录日志
class Userlog(db.Model):
    __tablename__ = "userlog"
    id = db.Column(db.Integer, primary_key=True) #编号
    user_id = db.Column(db.Integer, db.ForeignKey('user.id')) #所属的会员
    ip = db.Column(db.String(100)) #地址
    addtime = db.Column(db.DateTime, index=True, default=datetime.now) #添加时间

    def __repr__(self):
        return "<Userlog %r>" % self.id

#标签
class Tag(db.Model):
    __tablename__ = "tag"
    id = db.Column(db.Integer, primary_key=True) #编号
    name =db.Column(db.String(100), unique=True) #标签名
    addtime = db.Column(db.DateTime, index=True, default=datetime.now) #添加时间
    movies = db.relationship("Movie", backref='tag') #标签下的电影关联

    def __repr__(self):
        return "<Tag %r>" % self.name

#电影
class Movie(db.Model):
    __tablename__ = "movie"
    id = db.Column(db.Integer, primary_key=True) #编号
    title = db.Column(db.String(255), unique=True) #电影名
    url = db.Column(db.String(255), unique=True) #存放地址
    info = db.Column(db.Text) #简介
    logo = db.Column(db.String(255), unique=True) #封面l
    star = db.Column(db.SmallInteger) #星级
    playnum = db.Column(db.BigInteger) #播放量
    commentnum = db.Column(db.BigInteger) #评论量
    tag_id = db.Column(db.Integer, db.ForeignKey('tag.id')) #所属标签类别
    area = db.Column(db.String(255)) #地区
    release_time = db.Column(db.Date) #上映时间
    length = db.Column(db.String(100)) #时长
    addtime = db.Column(db.DateTime, index=True, default=datetime.now) #添加时间
    comments = db.relationship('Comment', backref='movie') #电影的评论量关联
    moviecols = db.relationship('Moviecol', backref='movie') #电影的收藏数关联

    def __repr__(self):
        return "<Movie %r>" % self.title

#上映预告
class Preview(db.Model):
    __tablename__ = "preview"
    id = db.Column(db.Integer, primary_key=True) #编号
    title = db.Column(db.String(255), unique=True) #标题
    logo = db.Column(db.String(255), unique=True) #封面
    addtime = db.Column(db.DateTime, index=True, default=datetime.now) #添加时间

    def __repr__(self):
        return "<Preview %r>" %self.title

#评论
class Comment(db.Model):
    __tablename__ = "comment"
    id = db.Column(db.Integer, primary_key=True) #编号
    content = db.Column(db.Text) #内容
    movie_id = db.Column(db.Integer, db.ForeignKey('movie.id')) #所属的电影
    user_id = db.Column(db.Integer, db.ForeignKey('user.id')) #所属的会员
    addtime = db.Column(db.DateTime, index=True, default=datetime.now) #添加时间

    def __repr__(self):
        return "<Comment %r>" %self.id

#电影收藏
class Moviecol(db.Model):
    __tablename__ = "moviecol"
    id = db.Column(db.Integer, primary_key=True) #编号
    movie_id = db.Column(db.Integer, db.ForeignKey('movie.id')) #所属的电影
    user_id = db.Column(db.Integer, db.ForeignKey('user.id')) #所属的会员
    addtime = db.Column(db.DateTime, index=True, default=datetime.now) #添加时间

    def __repr__(self):
        return "<Moviecol %r>" %self.id

#权限
class Auth(db.Model):
    __tablename__ = "auth"
    id = db.Column(db.Integer, primary_key=True) #编号
    name = db.Column(db.String(100), unique=True) #权限名
    url = db.Column(db.String(255), unique=True) #路径
    addtime = db.Column(db.DateTime, index=True, default=datetime.now) #添加时间

    def __repr__(self):
        return "<Auth %r>" %self.name

#角色
class Role(db.Model):
    __tablename__ = "role"
    id = db.Column(db.Integer, primary_key=True) #编号
    name = db.Column(db.String(100), unique=True) #角色名
    auths = db.Column(db.String(600)) #权限列表
    addtime = db.Column(db.DateTime, index=True, default=datetime.now) #添加时间
    admins = db.relationship("Admin", backref="role") #所属的管理员关联

    def __repr__(self):
        return "<Role %r>" % self.name

#管理员
class Admin(db.Model):
    __tablename__ = "admin"
    id = db.Column(db.Integer, primary_key=True) #编号
    name = db.Column(db.String(100), unique=True) #管理员名
    pwd = db.Column(db.String(100)) #管理员密码
    is_super = db.Column(db.SmallInteger) #是否超级管理员
    role_id = db.Column(db.Integer, db.ForeignKey('role.id')) #管理员角色
    addtime = db.Column(db.DateTime, index=True, default=datetime.now) #添加时间
    adminlogs = db.relationship("Adminlog", backref='admin') #管理员登录日志关联
    oplogs = db.relationship("Oplog", backref='admin') #管理员操作日志关联

    def __repr__(self):
        return "<Admin %r>" % self.name

    def check_pwd(self, pwd):
        from werkzeug.security import check_password_hash
        return check_password_hash(self.pwd, pwd)

#管理员登录日志
class Adminlog(db.Model):
    __tablename__ = "adminlog"
    id = db.Column(db.Integer, primary_key=True) #编号
    admin_id = db.Column(db.Integer, db.ForeignKey('admin.id')) #日志记录的管理员
    ip = db.Column(db.String(100)) #地址
    addtime = db.Column(db.DateTime, index=True, default=datetime.now) #添加时间

    def __repr__(self):
        return "<Adminlog %r>" % self.id

#操作日志
class Oplog(db.Model):
    __tablename__ = "oplog"
    id = db.Column(db.Integer, primary_key=True) #编号
    admin_id = db.Column(db.Integer, db.ForeignKey('admin.id')) #操作的管理员
    ip = db.Column(db.String(100)) #地址
    reason = db.Column(db.String(600)) #操作原因
    addtime = db.Column(db.DateTime, index=True, default=datetime.now) #添加时间

    def __repr__(self):
        return "<Oplog %r>" % self.id

# if __name__ == "__main__":
#     db.create_all()

    # role = Role(
    #     name = "超级管理员",
    #     auths = ""
    # )
    # db.session.add(role)
    # db.session.commit()

    # from werkzeug.security import generate_password_hash
    # admin = Admin(
    #     name="chen1",
    #     pwd=generate_password_hash("123456"),
    #     is_super=0,
    #     role_id=1
    # )
    # db.session.add(admin)
    # db.session.commit()
