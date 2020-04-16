package models

type BaseInfo struct {
	ID         int    `json:"id,omitempty" xorm:"not null pk autoincr INT(10) 'id'"  Comment:""`
	Nickname   string `json:"nickname,omitempty" xorm:"VARCHAR(15) 'nickname'"  Comment:"昵称"`
	AvatarURL  string `json:"avatar_url,omitempty" xorm:"VARCHAR(255) 'avatar_url'"  Comment:"头像地址"`
	Gender     string `json:"gender,omitempty" xorm:"CHAR(1) 'gender'"  Comment:"性别"`
	Provincial string `json:"provincial,omitempty" xorm:"VARCHAR(10) 'provincial'"  Comment:"省份"`
	City       string `json:"city,omitempty" xorm:"VARCHAR(10) 'city'"  Comment:"城市"`
	UID        string `json:"uid,omitempty" xorm:"VARCHAR(30) 'uid'"  Comment:"唯一编码"`
}

type User struct {
	BaseInfo     `xorm:"extends"`
	Phone        string `json:"phone,omitempty" xorm:"VARCHAR(11) 'phone'"  Comment:"手机号"`
	Email        string `json:"email,omitempty" xorm:"VARCHAR(30) 'email'"  Comment:"邮箱"`
	RegisterTime int    `json:"register_time,omitempty" xorm:"INT(11) 'register_time'"  Comment:"注册时间"`
}

type LoginInfo struct {
	Key string `json:"key" binding:"required" binding:"required" Comment:"邮箱/手机号/用户名"`
	Psw string `json:"psw" binding:"required" binding:"required" Comment:"密码"`
}
