# _*_ coding: utf-8 _*_
__author__ = 'chen'
__date__ = '2018/1/23 16:42'
from flask import Flask, render_template
from flask_sqlalchemy import SQLAlchemy
import pymysql
import os

app = Flask(__name__)

#SQLAlchemy连接数据库
app.config["SQLALCHEMY_DATABASE_URI"] = "mysql+pymysql://root:@127.0.0.1:3306/movie"
#SQLAlchemy追踪对象修改并发送信号
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = True

#csrf_token 跨站请求伪造
app.config['SECRET_KEY'] = 'd238344b3dd64a2abeb6e79cb77ffe7d'

#配置文件上传路径
#电影封面
app.config["UP_DIR"] = os.path.join(os.path.abspath(os.path.dirname(__file__)),"static/uploads/")
#电影预告
app.config["UPP_DIR"] = os.path.join(os.path.abspath(os.path.dirname(__file__)),"static/uploads/previews/")
#会员头像
app.config["FC_DIR"] = os.path.join(os.path.abspath(os.path.dirname(__file__)),"static/uploads/logos/")

app.debug = True
db = SQLAlchemy(app)


#注册蓝图
from app.home import home as home_blueprint
from app.admin import admin as admin_blueprint

app.register_blueprint(home_blueprint)
app.register_blueprint(admin_blueprint, url_prefix="/admin")

@app.errorhandler(404)
def page_not_found(error):
    return render_template("home/404.html"), 404


