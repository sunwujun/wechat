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

// @title Swagger Example API
// @version 1.0
// @description This is a sample server celler server.
// @termsOfService https://razeen.me

// @contact.name Razeen
// @contact.url https://razeen.me
// @contact.email me@razeen.me

// @license.name Apache 2.0
// @license.url http://www.apache.org/licenses/LICENSE-2.0.html

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
