package routers

import (
	"github.com/gin-gonic/gin"
	"net/http"
	"wechat/config"
)

func InitRouter() *gin.Engine {
	gin.SetMode(config.Conf.Server.RunMode)
	engine := gin.New()

	engine.Any("/", helloWechat)
	return engine
}

func helloWechat(context *gin.Context) {
	context.String(http.StatusOK, "Hello, Wechat")
}
