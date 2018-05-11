# _*_ coding: utf-8 _*_
__author__ = 'chen'
__date__ = '2018/1/23 16:43'

from flask import Blueprint

admin = Blueprint("admin", __name__)

import app.admin.views