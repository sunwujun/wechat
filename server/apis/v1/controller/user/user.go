package user

import (
	"fmt"
	jwtgo "github.com/dgrijalva/jwt-go"
	"github.com/gin-gonic/gin"
	"log"
	"net/http"
	"regexp"
	"time"
	"wechat/apis"
	"wechat/apis/v1/service/user"
	"wechat/middleware/jwt"
	"wechat/models"
	"wechat/pkg/e"
	"wechat/pkg/logger"
)

// @Summary 手机号登录
// @Description 测试手机号登录
// @Tags 用户
// @Accept  application/json
// @Product application/json
// @Param data body models.User true "用户数据"
// @Success 200 {string} string	"{"code": 200, "message": "添加成功"}"
// @Success 200 {string} string	"{"code": -1, "message": "添加失败"}"
// @Router /phone_login [post]
func LigonByMobile(c *gin.Context) {
	phone := c.PostForm("phone")
	psw := c.PostForm("psw")
	if match, _ := regexp.MatchString("[1][34578]\\d{9}$", phone); !match {
		c.JSON(http.StatusOK, gin.H{
			"code": e.ERROR,
			"msg":  "请检查手机号码格式",
		})
		return
	}
	has, userInfo, err := user.LigonByMobile(phone, psw)
	if err != nil {
		logger.Errorf("手机号登录失败: %s", err)
	}
	if has {
		fmt.Println(userInfo)
		generateToken(c, userInfo)
	} else {
		c.JSON(http.StatusOK, gin.H{
			"code": e.ERROR,
			"msg":  "账号不存在或密码错误",
		})
	}
}

func Register(c *gin.Context) {
	register := new(models.RegisterInfo)
	apis.BindStruct(c, register)

	err := user.Register(register)

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"code": e.ERROR,
			"msg":  err.Error(),
		})
		return
	}

	generateToken(c, &models.User{
		BaseInfo: models.BaseInfo{
			ID:       register.ID,
			Nickname: register.Nickname,
			Avatar:   register.Avatar,
			UID:      register.UID,
		},
	})
}

// 生成令牌
func generateToken(c *gin.Context, info *models.User) {
	j := &jwt.JWT{
		SigningKey: []byte("WeChatDemo"),
	}
	claims := jwt.CustomClaims{
		ID:   info.ID,
		Name: info.Nickname,
		Uid:  info.UID,
		StandardClaims: jwtgo.StandardClaims{
			NotBefore: time.Now().Unix() - 1000,    // 签名生效时间
			ExpiresAt: time.Now().Unix() + 3600*48, // 过期时间 一小时
			Issuer:    "WeChatDemo",                //签名的发行者
		},
	}

	token, err := j.CreateToken(claims)

	if err != nil {
		c.JSON(http.StatusOK, gin.H{
			"status": -1,
			"msg":    err.Error(),
		})
		return
	}

	log.Println(token)
	//c.SetCookie("token", token, )

	c.JSON(http.StatusOK, gin.H{
		"code": e.SUCCESS,
		"msg":  e.GetMsg(e.SUCCESS),
		"data": gin.H{
			"info":  info,
			"token": token,
		},
	})

	return
}
