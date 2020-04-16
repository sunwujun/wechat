package db

import (
	"fmt"
	_ "github.com/go-sql-driver/mysql"
	"github.com/go-xorm/xorm"
	"wechat/config"
	"wechat/pkg/logger"
)

var db *xorm.Engine

func init() {
	var err error
	c := config.Conf.Database
	db, err = xorm.NewEngine("mysql", fmt.Sprintf("%s:%s@tcp(%s)/%s?charset=utf8", c.Username, c.Password, c.URL, c.Dbname))
	if err != nil {
		logger.Error("数据库连接失败", logger.WithError(err))
	}
}

func GetDB() *xorm.Engine {
	return db
}
