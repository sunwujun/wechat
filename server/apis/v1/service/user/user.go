package user

import (
	"encoding/hex"
	"errors"
	"time"
	"wechat/apis/v1/dao/user"
	"wechat/models"
	"wechat/pkg/encrypt"
	"wechat/pkg/generate"
)

func LigonByMobile(phone, psw string) (has bool, userInfo *models.User, err error) {
	has, userInfo, err = user.LigonByMobile(phone, psw)
	return
}

func Register(info *models.RegisterInfo) error {
	has, err := user.IsMobileExist(info.Phone)
	if err != nil {
		return err
	}
	if has {
		return errors.New("手机号已被注册")
	}

	info.UID = generate.GenerateUID()
	encryptPsw, err := encrypt.AesCBCEncrypt([]byte(info.Psw))
	if err != nil {
		return err
	}
	info.Psw = hex.EncodeToString(encryptPsw)
	info.RegisterTime = time.Now()
	if _, err := user.Register(info); err != nil {
		return err
	}

	return nil
}
