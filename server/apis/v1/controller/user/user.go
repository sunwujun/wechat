package user

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"net/http"
	"regexp"
	"wechat/apis/v1/service/user"
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
		//generateToken(c, userInfo)
	} else {
		c.JSON(http.StatusOK, gin.H{
			"code": e.ERROR,
			"msg":  "账号不存在或密码错误",
		})
	}
}

func Register(c *gin.Context) {

}
