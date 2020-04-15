package main

import (
	"fmt"
	"log"
	"net/http"
	"time"
	"wechat/config"
	"wechat/routers"
)

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
