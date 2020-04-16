package user

import (
	"wechat/apis/v1/dao/user"
	"wechat/models"
)

func LigonByMobile(phone, psw string) (has bool, userInfo *models.User, err error) {
	has, userInfo, err = user.LigonByMobile(phone, psw)
	return
}
