package routers

import (
	"github.com/gin-gonic/gin"
	"github.com/swaggo/files"
	"github.com/swaggo/gin-swagger"
	"net/http"
	"wechat/apis/v1/controller/user"
	"wechat/config"
)

func InitRouter() *gin.Engine {
	gin.SetMode(config.Conf.Server.RunMode)
	engine := gin.New()
	ConfigureRoute(engine)
	engine.Any("/", helloWechat)
	engine.GET("/swagger/*any", ginSwagger.WrapHandler(swaggerFiles.Handler))
	return engine
}

func ConfigureRoute(r *gin.Engine) {
	apiV1(r)
}

func apiV1(r *gin.Engine) {
	apiv1 := r.Group("/apis/v1")
	{
		apiv1.POST("/phone_login", user.LigonByMobile)
	}
}

func helloWechat(context *gin.Context) {
	context.String(http.StatusOK, "Hello, Wechat")
}
