package main

import (
	"fmt"
	"log"
	"net/http"
	"time"
	"wechat/config"
	_ "wechat/docs"
	"wechat/routers"
)

// @title 微信
// @version 1.0
// @description 后端接口
// @host 127.0.0.1:8000
// @BasePath /apis/v1

func main() {
	gin := routers.InitRouter()
	conf := config.Conf.Server

	s := &http.Server{
		Addr:           fmt.Sprintf(":%s", conf.Port),
		Handler:        gin,
		ReadTimeout:    conf.ReadTimeout * time.Second,
		WriteTimeout:   conf.WriteTimeout * time.Second,
		MaxHeaderBytes: 1 << 20,
	}

	if err := s.ListenAndServe(); err != nil {
		log.Printf("服务启动失败: %s", err)
	}
}
