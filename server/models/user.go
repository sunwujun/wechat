package models

import "time"

type BaseInfo struct {
	ID       int    `json:"id,omitempty" xorm:"not null pk autoincr INT(10) 'id'"  comment:""`
	Nickname string `json:"nickname,omitempty" xorm:"VARCHAR(15) 'nickname'"  comment:"昵称"`
	Avatar   []byte `json:"avatar,omitempty" validate:"required" xorm:"BLOB 'avatar'"  comment:"头像"`
	UID      string `json:"uid,omitempty" xorm:"VARCHAR(30) 'uid'"  comment:"唯一编码"`
}

type RegisterInfo struct {
	BaseInfo     `xorm:"extends"`
	Phone        string    `json:"phone,omitempty" validate:"required" xorm:"VARCHAR(11) 'phone'"  comment:"手机号"`
	Psw          string    `json:"psw,omitempty" validate:"required" xorm:"VARCHAR(64) 'psw'"  comment:"密码"`
	CountryID    int       `json:"country_id,omitempty" validate:"required" xorm:"TINYINT(4) 'country_id'"  comment:"国家/地区"`
	RegisterTime time.Time `json:"register_time,omitempty" xorm:"DATETIME 'register_time'"  comment:"注册时间"`
}

type User struct {
	BaseInfo     `xorm:"extends"`
	Phone        string `json:"phone,omitempty" xorm:"VARCHAR(11) 'phone'"  comment:"手机号"`
	Email        string `json:"email,omitempty" xorm:"VARCHAR(30) 'email'"  comment:"邮箱"`
	RegisterTime int    `json:"register_time,omitempty" xorm:"INT(11) 'register_time'"  comment:"注册时间"`
	Provincial   string `json:"provincial,omitempty" xorm:"VARCHAR(10) 'provincial'"  comment:"省份"`
	City         string `json:"city,omitempty" xorm:"VARCHAR(10) 'city'"  comment:"城市"`
	Gender       string `json:"gender,omitempty" xorm:"CHAR(1) 'gender'"  comment:"性别"`
}

type LoginInfo struct {
	Key string `json:"key" binding:"required" comment:"邮箱/手机号/用户名"`
	Psw string `json:"psw" binding:"required" comment:"密码"`
}
