package user

import (
	"wechat/models"
	"wechat/pkg/db"
)

func LigonByMobile(phone, psw string) (bool, *models.User, error) {
	userInfo := new(models.User)
	has, err := db.GetDB().Table("user").And("phone = ?", phone).
		And("psw = ?", psw).Get(userInfo)
	return has, userInfo, err
}

func Register(info *models.RegisterInfo) (int64, error) {
	return db.GetDB().Table("user").InsertOne(info)
}

func IsMobileExist(phone string) (bool, error) {
	return db.GetDB().Table("user").Where("phone = ?", phone).Exist(&models.BaseInfo{})
}
